using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Raigad.Report
{
    public partial class SabasadReport : System.Web.UI.Page
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
                    case "SabasadCustomerReport":
                        fnSabasadReport();
                        break;
                }
            }
        }
        protected void btnShow_Click(object sender, EventArgs e)
        {
            string strReportUrl = "";
            strReportUrl = "http://" + System.Configuration.ConfigurationManager.AppSettings["ReportServerName"].ToString() + "/ReportServer/Pages/ReportViewer.aspx?%2fRaigadReports%2fSabasadCustomerReport&rs:Command=Render&UserName=";
            strReportUrl = strReportUrl + AppSessions.GetSession(AppSessions.UDFSessionName._user_name.ToString());
            strReportUrl = strReportUrl + "&SabasadType=";
            strReportUrl = strReportUrl + ddlLoanType.SelectedValue;
            strReportUrl = strReportUrl + "&MulGaon=";
            strReportUrl = strReportUrl + ddlDistrictName.SelectedValue;
            strReportUrl = strReportUrl + "&Taluka=";
            strReportUrl = strReportUrl + ddlBankBranches.SelectedValue;
            MyIframe.Attributes["src"] = strReportUrl;
        }
        public void fnSabasadReport()
        {
            BindLoanType();
            BindBankBranches();
            BindDistricts();
        }
        //protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        //{
        //    string strReportName ="";
        //    //strReportName = TreeView1.SelectedNode.Value;
        //    strReportName = "http://jogeshbisoyi/ReportServer/Pages/ReportViewer.aspx?%2fRaigadReports%2fSabasadCustomerReport&rs:Command=Render&UserName=" + AppSessions.GetSession(AppSessions.UDFSessionName._user_name.ToString());
        //    //MyIframe.Attributes["src"] = "http://jogeshbisoyi/ReportServer/Pages/ReportViewer.aspx?%2fRaigadReports%2fSabasadCustomerReport&rs:Command=Render&UserName=Admin";
        //    MyIframe.Attributes["src"] = strReportName ;
        //}

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
        private void BindBankBranches()
        {
            try
            {
                CommonFunctions.BindBankBranches(ddlBankBranches);
            }
            catch { }
        }
        private void BindDistricts()
        {
            try
            {
                CommonFunctions.BindDistricts(ddlDistrictName);
            }
            catch { }
        }
    }
}