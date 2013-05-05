using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Raigad.Report
{
    public partial class MudatThevReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strReportUrl = "";
            strReportUrl = "http://" + System.Configuration.ConfigurationManager.AppSettings["ReportServerName"].ToString() + "/ReportServer/Pages/ReportViewer.aspx?%2fRaigadReports%2fMudatThevReport&rs:Command=Render&UserName=";
            strReportUrl = strReportUrl + AppSessions.GetSession(AppSessions.UDFSessionName._user_name.ToString());
            MyIframe.Attributes["src"] = strReportUrl;
        }
    }
}