using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Atelier
{
    public partial class PaymentSuccess : Page
    {
        private string ConnStr =>
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int courseId;
                if (!int.TryParse(Request.QueryString["courseId"], out courseId))
                {
                    Response.Redirect("~/Dashboard.aspx");
                    return;
                }

                LoadCourseDetails(courseId);
            }
        }

        private void LoadCourseDetails(int courseId)
        {
            using (SqlConnection con = new SqlConnection(ConnStr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT Title, Price FROM Courses WHERE CourseID = @CourseID", con);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    string title = dr["Title"].ToString();
                    litCourseName.Text = title;
                    litCourseTitle.Text = title;
                    litAmount.Text = Convert.ToDecimal(dr["Price"]).ToString("F2");
                }
                dr.Close();
            }
        }
    }
}
