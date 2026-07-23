using System;
using System.Web.UI;

namespace Atelier
{
    public partial class Logout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear all session data and redirect to the home page
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
        }
    }
}
