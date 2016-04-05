using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using EF;
using BLL;
using System.Web.Script.Serialization;

namespace Test2.Handlers
{
    /// <summary>
    /// Summary description for viewTimesheet
    /// </summary>

    public class viewProject : IHttpHandler
    {
        profit obj = new profit();
        public void ProcessRequest(HttpContext context)
        {
            int ProjectID2 = int.Parse(context.Request.QueryString["ProjectID3"]);
            JavaScriptSerializer js = new JavaScriptSerializer();
            var res = obj.viewProject(ProjectID2);
            //var res2 = obj.dispTExp(ProjectID);
            context.Response.Write(js.Serialize(res));
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