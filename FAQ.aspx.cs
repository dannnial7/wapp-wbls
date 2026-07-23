using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Atelier
{
    public partial class FAQ : Page
    {
        private string ConnStr =>
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFAQs();
            }
        }

        private void LoadFAQs()
        {
            using (SqlConnection con = new SqlConnection(ConnStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT Question, Answer FROM FAQs " +
                    "WHERE IsActive = 1 " +
                    "ORDER BY OrderIndex", con);

                DataTable dt = new DataTable();
                da.Fill(dt);

                rptFAQs.DataSource = dt;
                rptFAQs.DataBind();

                pnlNoFAQs.Visible = (dt.Rows.Count == 0);
            }
        }
    }
}
