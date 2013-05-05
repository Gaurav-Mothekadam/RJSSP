<%@ Page Title="MonthlyEntryReport" Language="C#" MasterPageFile="~/Raigad.Master" AutoEventWireup="true"
    CodeBehind="MonthlyEntryReport.aspx.cs" Inherits="Raigad.Report.MonthlyEntryReport" %>

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
                <div class="small_form_subdiv">
                    <div class="small_input_label">
                        idnaaMkx&nbsp;</div>
                    <div class="small_input_textdiv">
                        <asp:TextBox ID="txtFromDate" runat="server" MaxLength="10" CssClass="date_input" Width="200px"
                        onkeypress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                                    AutoComplete="off"></asp:TextBox>
                        <asp:ImageButton ID="ibtnFromDate" runat="server" ImageUrl="~/images/calendar.png" />
                        <AjaxToolkit:CalendarExtender ID="calFromDate" runat="server" TargetControlID="txtFromDate"
                            PopupButtonID="ibtnFromDate" Format="MM/dd/yyyy">
                        </AjaxToolkit:CalendarExtender>
                        <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="txtFromDate"
                            ErrorMessage="Please Enter From Date" Display="None" ValidationGroup="MonthlyEntryReport"></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="small_input_label">
                        tao&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;idnaaMkx&nbsp;</div>
                    <div class="small_input_textdiv">
                        <asp:TextBox ID="txtToDate" runat="server" MaxLength="10" CssClass="date_input" Width="200px"
                        onkeypress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                                    AutoComplete="off"></asp:TextBox>
                        <asp:ImageButton ID="ibtnToDate" runat="server" ImageUrl="~/images/calendar.png" />
                        <AjaxToolkit:CalendarExtender ID="calToDate" runat="server" TargetControlID="txtToDate"
                            PopupButtonID="ibtnToDate" Format="MM/dd/yyyy">
                        </AjaxToolkit:CalendarExtender>
                        <asp:RequiredFieldValidator ID="rfvToDate" runat="server" ControlToValidate="txtToDate"
                            ErrorMessage="Please Enter To Date" Display="None" ValidationGroup="MonthlyEntryReport"></asp:RequiredFieldValidator>
                       &nbsp;&nbsp;&nbsp;
                    </div>
                    <div>
                        <asp:Button ID="btnShow" runat="server" Text="SaaoQaa" OnClick="btnShow_Click" CssClass="searchbtn"
                            OnClientClick="ValidatePageControl('MonthlyEntryReport');ValidateCustomer('MonthlyEntryReport');"
                            ValidationGroup="MonthlyEntryReport" />
                            <asp:Button ID="btnPrintPdf" runat="server" Text="Export To PDF" OnClick="btnPrintPDF_Click" CssClass="createbtnRpt" Enabled=false />
                    </div>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
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
