using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test2.Pages
{
    public partial class Associate1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("home.aspx");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["uid"] != null)
            {
                Session["uid"] = null;
                Session["designation"] = null;
                Session["name"] = null;
                Response.Redirect("home.aspx");
            }
        }
    }
}