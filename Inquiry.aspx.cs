using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Atelier
{
    public partial class Inquiry : Page
    {
        private string ConnStr =>
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // No special load logic needed — guest-accessible page
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();

            using (SqlConnection con = new SqlConnection(ConnStr))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO GuestInquiries (FullName, Email, Subject, Message) " +
                    "VALUES (@FullName, @Email, @Subject, @Message)", con);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Subject", subject);
                cmd.Parameters.AddWithValue("@Message", message);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Show success and hide the form
            litSuccess.Text = "Thank you for your inquiry, " + fullName +
                              "! We will get back to you at <strong>" + email +
                              "</strong> as soon as possible.";
            pnlSuccess.Visible = true;
            pnlForm.Visible = false;
        }
    }
}
