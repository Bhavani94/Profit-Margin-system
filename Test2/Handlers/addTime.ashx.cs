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
    /// Summary description for addTime
    /// </summary>
    public class addTime : IHttpHandler
    {

        profit obj = new profit();
        public void ProcessRequest(HttpContext context)
        {
            int TimesheetID = int.Parse(context.Request.QueryString["TimesheetID"]);
            int ProjectID = int.Parse(context.Request.QueryString["ProjectID"]);
            string Activity = (context.Request.QueryString["Activity"]);
            string Datee = (context.Request.QueryString["Datee"]);
            double hourss = double.Parse(context.Request.QueryString["hourss"]);
            obj.addTime(TimesheetID, ProjectID, Activity, Datee, hourss);
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