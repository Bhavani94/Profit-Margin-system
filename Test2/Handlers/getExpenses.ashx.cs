using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Web.Script.Serialization;
using BLL;
using EF;

namespace Test2.Handlers
{
    /// <summary>
    /// Summary description for getExpenses
    /// </summary>
    public class getExpenses : IHttpHandler
    {
        profit obj = new profit();
        public void ProcessRequest(HttpContext context)
        {
            int ProjectID = int.Parse(context.Request.QueryString["ProjectID1"]);
            JavaScriptSerializer js = new JavaScriptSerializer();
            var res1 = obj.dispExp(ProjectID);
            //var res2 = obj.dispTExp(ProjectID);
            context.Response.Write(js.Serialize(res1));
            //context.Response.Write(js.Serialize(res2));
            context.Response.ContentType = "text/plain";
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}