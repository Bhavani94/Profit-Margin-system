using System;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using BLL;
using EF;

namespace Test2.Handlers
{
    /// <summary>
    /// Summary description for totExpenses
    /// </summary>
    /// 
    public class totExpenses : IHttpHandler
    {
        profit obj = new profit();
        public void ProcessRequest(HttpContext context)
        {
            int ProjectID = int.Parse(context.Request.QueryString["ProjectID"]);
            JavaScriptSerializer js = new JavaScriptSerializer();
            var res = obj.dispTExp(ProjectID);
            context.Response.Write(js.Serialize(res));
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