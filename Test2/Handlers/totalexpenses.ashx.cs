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
    /// Summary description for totalexpenses
    /// </summary>
    public class totalexpenses : IHttpHandler
    {
        ProfitProEntities obj = new ProfitProEntities();
        public void ProcessRequest(HttpContext context)
        {
            int ProjectID = int.Parse(context.Request.QueryString["ProjectID3"]);
            JavaScriptSerializer js = new JavaScriptSerializer();

            var res5 = obj.usp_TotalProfit(ProjectID);
            context.Response.Write(js.Serialize(res5));

            //     context.Response.Write(js.Serialize(res5));

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
