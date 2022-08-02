using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Web_Project_Datatable
{
    public partial class Select_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Admin_Click(object sender, EventArgs e)
        {
            string User1 = "Admin";
            Session["User"] = User1;
            Response.Redirect("Login_Page.aspx?user=" + User1);
        }

        protected void Accountant_Click(object sender, EventArgs e)
        {
            string User2 = "Accountant";
            Session["User"] = User2;
            Response.Redirect("Login_Page.aspx?user=" + User2);
        }
    }
}