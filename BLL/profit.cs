using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using DAL;
using EF;

namespace BLL
{
    public class profit
    {
        DAL.profit obj = new DAL.profit();
        public void addExpenses(int ProjectID, int AssociateID, string ExpenseType, string ExpenseDate, int Amount, string Currency, string Descr)
        {
            obj.addExpenses(ProjectID, AssociateID, ExpenseType, ExpenseDate, Amount, Currency, Descr);
        }
        public IEnumerable<usp_displayExpenses_Result> dispExp(int ProjectID)
        {
            return obj.dispExp(ProjectID);
        }
        public IEnumerable<usp_displayTotalExpense_Result> dispTExp(int ProjectID)
        {
            return obj.dispTExp(ProjectID);
        }
        public IEnumerable<usp_viewTimesheet_Result> viewTimesheet(int ProjectID)
        {
            return obj.viewTimesheet(ProjectID);
        }
        public void addTime(int TimesheetID, int ProjectID, string Activity, string Datee, double hourss)
        {
            obj.addTime(TimesheetID, ProjectID, Activity, Datee, hourss);
        }
        public IEnumerable<usp_viewProject_Result> viewProject(int ProjectID)
        {
            return obj.viewProject(ProjectID);
        }
    }
}
