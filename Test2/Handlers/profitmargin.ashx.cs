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
    /// Summary description for profitmargin
    /// </summary>
    public class profitmargin : IHttpHandler
    {
        ProfitProEntities obj = new ProfitProEntities();
        public void ProcessRequest(HttpContext context)
        {
            int ProjectID = int.Parse(context.Request.QueryString["ProjectID3"]);
            JavaScriptSerializer js = new JavaScriptSerializer();

            var res6 = obj.usp_ProfitMargin(ProjectID);

            context.Response.Write(js.Serialize(res6));

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