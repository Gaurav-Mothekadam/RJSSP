<%@ Page Title="" Language="C#" MasterPageFile="~/Raigad.Master" AutoEventWireup="true"
    CodeBehind="VarasdarReport.aspx.cs" Inherits="Raigad.Report.VarasdarReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<%@ Register Src="~/UserControls/CustomerSearch.ascx" TagPrefix="uc" TagName="CustomerSearch" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="../Styles/Collepsible.css" type="text/css" />
    <link type="text/css" rel="stylesheet" href="../Styles/Site.css" />
    <script type="text/javascript" src="../Scripts/jquery-1.6.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.cookie.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.collapsible.min.js"></script>
    <script type="text/javascript" src="../Scripts/highlight.pack.js"></script>
    <script type="text/javascript" src="../Scripts/CommonFunction.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contents">
	<div class="acc_search">	
	<div class="acc_search_top">
		inavaDa                    	
	</div>
    <div class="acc_search_bg">
        <div class="acc_search_text"></div>
		<div class="acc_search_subdiv">
             <div class="labeldiv">
                <label class="form_label" id="Label1">saBaasadacaa pa`kxar : </label>&nbsp;
             </div>
            <div class="inputdiv">
                <asp:DropDownList ID="ddlLoanType" runat="server" CssClass="short_select" Width="130">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvLoanType" runat="server" ControlToValidate="ddlLoanType"
            InitialValue="" ErrorMessage="Please Select Loan Type" Display="None" ValidationGroup="VarasdarReport"></asp:RequiredFieldValidator>
            </div>
            <div class="form_labeldiv">
			    <asp:Button ID="btnShow" runat="server" Text="SaaoQaa" OnClick="btnShow_Click" CssClass="searchbtn" 
                OnClientClick="ValidatePageControl('VarasdarReport');ValidateCustomer('VarasdarReport');"
                    ValidationGroup="VarasdarReport"/>
                     <asp:Button ID="btnPrintPdf" runat="server" Text="Export To PDF" OnClick="btnPrintPDF_Click" CssClass="searchbtn" Enabled=false />
		    </div>
		</div>		
	</div>
    </div>
    <div class="clear"></div>
    <div class="acc_grid">
    <table width="100%">
        <tr>
            <td>
                <iframe id="MyIframe" style="border: 0px;" runat="server" src="" width="100%" height="700"
                    allowtransparency="true"></iframe>
            </td>
        </tr>
    </table>
    </div>
</div>
</asp:Content>