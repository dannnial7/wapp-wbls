using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Atelier
{
    public partial class Register : Page
    {
        private string ConnStr =>
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Already logged-in users don't need to register again
            if (!IsPostBack && Session["UserID"] != null)
            {
                Response.Redirect("~/Dashboard.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            using (SqlConnection con = new SqlConnection(ConnStr))
            {
                con.Open();

                // Check if email already exists
                SqlCommand checkCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE Email = @Email", con);
                checkCmd.Parameters.AddWithValue("@Email", email);
                int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (exists > 0)
                {
                    ShowError("An account with this email address already exists. Please sign in instead.");
                    return;
                }

                // Hash the password using BCrypt
                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);

                // Insert new user (Role defaults to 'Learner' in the table definition)
                SqlCommand insertCmd = new SqlCommand(
                    "INSERT INTO Users (FullName, Email, PasswordHash) " +
                    "OUTPUT INSERTED.UserID " +
                    "VALUES (@FullName, @Email, @PasswordHash)", con);
                insertCmd.Parameters.AddWithValue("@FullName", fullName);
                insertCmd.Parameters.AddWithValue("@Email", email);
                insertCmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);

                int newUserId = Convert.ToInt32(insertCmd.ExecuteScalar());

                // Auto-login after successful registration
                Session["UserID"] = newUserId;
                Session["firstName"] = fullName.Split(' ')[0];
                Session["FullName"] = fullName;
                Session["Role"] = "Learner";

                Response.Redirect("~/Dashboard.aspx");
            }
        }

        private void ShowError(string message)
        {
            litError.Text = message;
            pnlError.Visible = true;
        }
    }
}
