using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Atelier
{
    public partial class ResetPassword : Page
    {
        private string ConnStr =>
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string token = txtToken.Text.Trim();
            string newPassword = txtNewPassword.Text;

            using (SqlConnection con = new SqlConnection(ConnStr))
            {
                con.Open();

                // Find the token — must not be used and must exist
                SqlCommand findCmd = new SqlCommand(
                    "SELECT UserID FROM PasswordResetToken " +
                    "WHERE Token = @Token AND IsUsed = 0", con);
                findCmd.Parameters.AddWithValue("@Token", token);
                object result = findCmd.ExecuteScalar();

                if (result == null)
                {
                    ShowError("Invalid or expired token. Please request a new one.");
                    return;
                }

                int userId = Convert.ToInt32(result);

                // Hash the new password
                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(newPassword);

                // Update the user's password
                SqlCommand updateCmd = new SqlCommand(
                    "UPDATE Users SET PasswordHash = @PasswordHash " +
                    "WHERE UserID = @UserID", con);
                updateCmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                updateCmd.Parameters.AddWithValue("@UserID", userId);
                updateCmd.ExecuteNonQuery();

                // Mark the token as used so it cannot be reused
                SqlCommand markCmd = new SqlCommand(
                    "UPDATE PasswordResetToken SET IsUsed = 1 " +
                    "WHERE Token = @Token", con);
                markCmd.Parameters.AddWithValue("@Token", token);
                markCmd.ExecuteNonQuery();

                // Show success and hide the form
                pnlSuccess.Visible = true;
                pnlForm.Visible = false;
            }
        }

        private void ShowError(string message)
        {
            litError.Text = message;
            pnlError.Visible = true;
        }
    }
}
