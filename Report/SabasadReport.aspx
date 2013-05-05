<%@ Page Title="" Language="C#" MasterPageFile="~/Raigad.Master" AutoEventWireup="true"
    CodeBehind="SabasadReport.aspx.cs" Inherits="Raigad.Report.SabasadReport" %>

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
                        saBaasadacaa pa`kxar:&nbsp;</div>
                    <div class="small_input_textdiv">
                        <asp:DropDownList ID="ddCustomerType" runat="server" CssClass="short_select">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvLoanType" runat="server" ControlToValidate="ddCustomerType"
                            InitialValue="" ErrorMessage="Please Select Loan Type" Display="None" ValidationGroup="SabasadReport"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
                    </div>
                     <div class="small_input_label">
                        ijalha:&nbsp;</div>
                    <div class="small_input_textdiv">
                        <asp:DropDownList ID="ddlDistrictName" runat="server" CssClass="short_select" Width="130px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDistrictName" runat="server" ControlToValidate="ddlDistrictName"
                            InitialValue="" ErrorMessage="Please Select Loan Type" Display="None" ValidationGroup="SabasadReport"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="small_input_label">
                        taalaukxa:&nbsp;</div>
                    <div class="small_input_textdiv">
                        <asp:DropDownList ID="ddlBankBranches" runat="server" CssClass="short_select" Width="130px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvBankBranch" runat="server" ControlToValidate="ddlBankBranches"
                            InitialValue="" ErrorMessage="Please Select Loan Type" Display="None" ValidationGroup="SabasadReport"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
                    </div>
                    <div>
                        <asp:Button ID="btnShow" runat="server" Text="SaaoQaa" OnClick="btnShow_Click" CssClass="searchbtn"
                            OnClientClick="ValidatePageControl('SabasadReport');ValidateCustomer('SabasadReport');"
                            ValidationGroup="SabasadReport" />
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
<%--<div align="center">
        <div style="float: left; display: none; width: 150px">
            <asp:TreeView ID="TreeView1" runat="server" Width="100%" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
                <Nodes>
                    <asp:TreeNode Value="Child1" Expanded="false" Text="Customer Reports">
                        <asp:TreeNode Value="SabasadCustomerReport" Text="Sabasat Customer" />
                        <asp:TreeNode Value="Grandchild2" Text="Kaymnidhi report" />
                    </asp:TreeNode>
                    <asp:TreeNode Value="Child2" Expanded="false" Text="Loan Reports">
                        <asp:TreeNode Value="Grandchild1" Text="Loan1" />
                        <asp:TreeNode Value="Grandchild1" Text="Loan2" />
                    </asp:TreeNode>
                </Nodes>
            </asp:TreeView>
        </div>
        <%--<div style="float: left; width: 830px">--%>
<%--<iframe id="MyIframe" style="border: 0px;" runat="server" src="" width="100%"
    height="700" allowtransparency="true"></iframe>--%>
<%-- </div>--%>
<%-- </div>--%>