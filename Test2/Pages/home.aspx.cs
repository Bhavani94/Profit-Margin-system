using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EF;
using System.Data.Objects;

namespace profitpro
{
    public partial class home : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null)
            {

                Response.Redirect("Manager.aspx");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string uid = TextBox1.Text;
            string password = TextBox2.Text;
            ProfitProEntities obj = new ProfitProEntities();
            ObjectResult<int?> i = obj.usp_Validate(uid,password);
            int foo = (int)i.ToList<int?>()[0];
            //     



            if (foo == 1)
            {
                ObjectResult<string> str = obj.usp_selectdesignation(uid);
                ObjectResult<string> str1 = obj.usp_ShowName(uid);
                string s = (string)str.ToList<string>()[0];
                string n = (string)str1.ToList<string>()[0];

                Session["uid"] = Request["TextBox1"];
                Session["designation"] = s;
                Session["name"] = n;
                Response.Redirect(s+".aspx");



            }
            else
            {
                Label1.Text = "Invalid User ID or Password";
            }


        }
    }
}