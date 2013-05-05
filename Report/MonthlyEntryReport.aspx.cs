using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Raigad.Report
{
    public partial class MonthlyEntryReport : System.Web.UI.Page
    {
        string strReportname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnShow_Click(object sender, EventArgs e)
        {
            string strReportUrl = "";
            strReportUrl = "http://" + System.Configuration.ConfigurationManager.AppSettings["ReportServerName"].ToString() + "/ReportServer/Pages/ReportViewer.aspx?%2fRaigadReports%2fMonthlyEntryReport&rs:Command=Render&UserName=";
            strReportUrl = strReportUrl + AppSessions.GetSession(AppSessions.UDFSessionName._user_name.ToString());
            strReportUrl = strReportUrl + "&FromDate=";
            strReportUrl = strReportUrl + txtFromDate .Text .Trim ();
            strReportUrl = strReportUrl + "&ToDate=";
            strReportUrl = strReportUrl + txtToDate .Text .Trim ();
            MyIframe.Attributes["src"] = strReportUrl;
        }
    }
}