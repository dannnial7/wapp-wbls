using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Atelier
{
    public partial class ForgotPassword : Page
    {
        private string ConnStr =>
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string email = txtEmail.Text.Trim();

            using (SqlConnection con = new SqlConnection(ConnStr))
            {
                con.Open();

                // Check if the email exists in Users
                SqlCommand checkCmd = new SqlCommand(
                    "SELECT UserID FROM Users WHERE Email = @Email", con);
                checkCmd.Parameters.AddWithValue("@Email", email);
                object result = checkCmd.ExecuteScalar();

                if (result == null)
                {
                    ShowError("No account found with that email address.");
                    return;
                }

                int userId = Convert.ToInt32(result);

                // Generate a 6-digit numeric token
                Random rng = new Random();
                string token = rng.Next(100000, 999999).ToString();

                // Store the token in PasswordResetToken table
                SqlCommand insertCmd = new SqlCommand(
                    "INSERT INTO PasswordResetToken (UserID, Token) " +
                    "VALUES (@UserID, @Token)", con);
                insertCmd.Parameters.AddWithValue("@UserID", userId);
                insertCmd.Parameters.AddWithValue("@Token", token);
                insertCmd.ExecuteNonQuery();

                // Display the token on screen (simulated — no real email)
                litToken.Text = token;
                pnlToken.Visible = true;
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
