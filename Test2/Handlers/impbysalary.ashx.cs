using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Web.Script.Serialization;
using EF;

namespace Test2.Handlers
{
    /// <summary>
    /// Summary description for impbysalary
    /// </summary>
    public class impbysalary : IHttpHandler
    {
        ProfitProEntities obj = new ProfitProEntities();
        public void ProcessRequest(HttpContext context)
        {
            int ProjectID = int.Parse(context.Request.QueryString["sal"]);
            JavaScriptSerializer js = new JavaScriptSerializer();

            var res7 = obj.usp_impbysalary(ProjectID);
            context.Response.Write(js.Serialize(res7));


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