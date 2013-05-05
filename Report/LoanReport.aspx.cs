using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Raigad.Report
{
    public partial class LoanReport : System.Web.UI.Page
    {
        #region Gloabal Declaration
        CommonFunctions clsComFun;
        #endregion
        string strReportname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strReportname = Request.QueryString["Name"];
                switch (strReportname)
                {
                    case "LoanReport":
                        BindLoanType();
                        break;
                }
            }
        }
        protected void btnShow_Click(object sender, EventArgs e)
        {
            string strReportUrl = "";
            strReportUrl = "http://" + System.Configuration.ConfigurationManager.AppSettings["ReportServerName"].ToString() + "/ReportServer/Pages/ReportViewer.aspx?%2fRaigadReports%2fLoanReport&rs:Command=Render&UserName=";
            strReportUrl = strReportUrl + AppSessions.GetSession(AppSessions.UDFSessionName._user_name.ToString());
            strReportUrl = strReportUrl + "&LoanType=";
            strReportUrl = strReportUrl + ddlLoanType.SelectedValue;
            MyIframe.Attributes["src"] = strReportUrl;
        }
        public void BindLoanType()
        {
            clsComFun = new CommonFunctions();
            try
            {
                clsComFun.LoanTypes(ddlLoanType);
            }
            catch { }
            finally { clsComFun = null; }
        }
    }
}