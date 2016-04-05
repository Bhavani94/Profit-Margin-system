using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EF;
using System.Data.Entity;

namespace DAL
{
    public class profit
    {
        ProfitProEntities obj = new ProfitProEntities();
        public void addExpenses(int ProjectID, int AssociateID, string ExpenseType, string ExpenseDate, int Amount, string Currency, string Descr)
        {
            obj.usp_insExpenses(ProjectID, AssociateID, ExpenseType, ExpenseDate, Amount, Currency, Descr);
        }
        public IEnumerable<usp_displayExpenses_Result> dispExp(int ProjectID)
        {
            return obj.usp_displayExpenses(ProjectID);
        }
        public IEnumerable<usp_displayTotalExpense_Result> dispTExp(int ProjectID)
        {
            return obj.usp_displayTotalExpense(ProjectID);
        }
        public IEnumerable<usp_viewTimesheet_Result> viewTimesheet(int ProjectID)
        {
            return obj.usp_viewTimesheet(ProjectID);
        }
        public void addTime(int TimesheetID, int ProjectID, string Activity, string Datee, double hourss)
        {
            obj.usp_addTime(TimesheetID, ProjectID, Activity, Datee, hourss);
        }
        public IEnumerable<usp_viewProject_Result> viewProject(int ProjectID)
        {
            return obj.usp_viewProject(ProjectID);
        }
      
    }
}
