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
    /// Summary description for addExpenses
    /// </summary>
    public class addExpenses : IHttpHandler
    {
        profit obj = new profit();
        public void ProcessRequest(HttpContext context)
        {          
            int ProjectID = int.Parse(context.Request.QueryString["ProjectID"]);
            int AssociateID = int.Parse(context.Request.QueryString["AssociateID"]);
            string ExpenseType = (context.Request.QueryString["ExpenseType"]);
            string ExpenseDate = (context.Request.QueryString["ExpenseDate"]);
            int Amount = int.Parse(context.Request.QueryString["Amount"]);
            string Currency=(context.Request.QueryString["Currency"]);
            string Descr=(context.Request.QueryString["Descr"]);
            obj.addExpenses(ProjectID,AssociateID,ExpenseType,ExpenseDate,Amount,Currency,Descr);
            context.Response.ContentType="text/plain";
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