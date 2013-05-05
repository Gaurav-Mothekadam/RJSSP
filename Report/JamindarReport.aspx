<%@ Page Title="" Language="C#" MasterPageFile="~/Raigad.Master" AutoEventWireup="true"
    CodeBehind="JamindarReport.aspx.cs" Inherits="Raigad.Report.JamindarReport" %>

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
                <div class="acc_search_text">
                </div>
                <div class="acc_search_subdiv">
                    <div class="labeldiv">
                        <label class="form_label" id="lblNomini">
                            Nomini :
                        </label>
                        &nbsp;
                    </div>
                    <div class="inputdiv">
                        <asp:DropDownList ID="ddlNomini" runat="server" CssClass="short_select" Width="130">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvLoanType" runat="server" ControlToValidate="ddlNomini"
            InitialValue="" ErrorMessage="Please Select Loan Type" Display="None" ValidationGroup="JamindarReport"></asp:RequiredFieldValidator>
                    </div>
                <div class="labeldiv">
                    <label class="form_label" id="lblFromDate">
                        From Date :
                    </label>
                    &nbsp;
                </div>
                <div class="form_inputdiv" style="width: 160px;">
                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="date_input" Width="130px"></asp:TextBox>
                    <asp:ImageButton ID="ibtnFromDate" runat="server" ImageUrl="~/images/calendar.png" />
                    <AjaxToolkit:CalendarExtender ID="calFromDate" runat="server" TargetControlID="txtFromDate"
                        PopupButtonID="ibtnFromDate" Format="MM/dd/yyyy">
                    </AjaxToolkit:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="txtFromDate"
                        ErrorMessage="Please Enter From Date" Display="None" ValidationGroup="JamindarReport"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revFromDate" runat="server" ControlToValidate="txtFromDate"
                        ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                        ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                        ValidationGroup="JamindarReport" Enabled="true">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="labeldiv">
                    <label class="form_label" id="lblToDate">
                        To Date :
                    </label>
                    &nbsp;
                </div>
                <div class="form_inputdiv" style="width: 160px;">
                    <asp:TextBox ID="txtToDate" runat="server" CssClass="date_input" Width="130px"></asp:TextBox>
                    <asp:ImageButton ID="ibtnToDate" runat="server" ImageUrl="~/images/calendar.png" />
                    <AjaxToolkit:CalendarExtender ID="calToDate" runat="server" TargetControlID="txtToDate"
                        PopupButtonID="ibtnToDate" Format="MM/dd/yyyy">
                    </AjaxToolkit:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rfvToDate" runat="server" ControlToValidate="txtToDate"
                        ErrorMessage="Please Enter To Date" Display="None" ValidationGroup="JamindarReport"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revToDate" runat="server" ControlToValidate="txtToDate"
                        ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                        ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                        ValidationGroup="JamindarReport" Enabled="true">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="form_labeldiv">
                    <asp:Button ID="btnShow" runat="server" Text="SaaoQaa" OnClick="btnShow_Click" CssClass="searchbtn" 
                    OnClientClick="ValidatePageControl('JamindarReport');ValidateCustomer('JamindarReport');"
                    ValidationGroup="JamindarReport"/>
                     <asp:Button ID="btnPrintPdf" runat="server" Text="Export To PDF" OnClick="btnPrintPDF_Click" CssClass="searchbtn" Enabled=false />
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
    </div>
</asp:Content>
