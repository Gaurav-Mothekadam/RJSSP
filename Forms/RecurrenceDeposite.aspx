<%@ Page Title=".:: Recurrence Deposite ::." Language="C#" MasterPageFile="~/Raigad.Master"
    AutoEventWireup="true" CodeBehind="RecurrenceDeposite.aspx.cs" Inherits="Raigad.Forms.RecurrenceDeposite" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<%@ Register Src="~/UserControls/CustomerSearch.ascx" TagPrefix="uc" TagName="CustomerSearch" %>
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
    <asp:UpdatePanel ID="upRecurrenceDepositeMain" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hdnRecurrenceDepositeId" runat="server" Value="" />
            <asp:HiddenField ID="hdnCustomerId" runat="server" Value="" />
            <asp:HiddenField ID="hdnNomineeId" runat="server" Value="" />
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblRecurrenceDepositeMessage" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <div id="divRDGrid" runat="server" style="display: block;" class="acc_grid_start">
                            <div class="acc_search">
                                <div class="acc_search_top">
                                    SaaoQaa
                                </div>
                                <div class="acc_search_bg">
                                    <div class="acc_search_text">
                                        <label class="grey_label">
                                            AapaNa saBaasad k`xmaaMkx vaapar}na saca- kr} Saktaata.
                                        </label>
                                    </div>
                                    <div class="acc_search_subdiv">
                                        <div class="acc_search_textdiv">
                                            <asp:DropDownList ID="ddlRDSearch" runat="server" CssClass="short_select" Width="125px">
                                                <asp:ListItem Selected="True" Text="i;kZ; fuoMk" Value=""></asp:ListItem>
                                                <asp:ListItem Value="CusotmerName" Text="lHkklnkps uko"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvRDSearch" runat="server" ControlToValidate="ddlRDSearch"
                                                InitialValue="" ErrorMessage="Please Select Search Type" Display="None" ValidationGroup="RecurrenceDepositeSearch"
                                                Enabled="true"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="acc_search_inputdiv">
                                            <asp:TextBox ID="txtSearchRD" runat="server" CssClass="input"></asp:TextBox>
                                        </div>
                                        <div>
                                            <asp:Button ID="btnSearchRD" runat="server" Text="SaaoQaa" CssClass="searchbtn" OnClientClick="ValidatePageControl();ValidateCustomer('RecurrenceDepositeSearch');"
                                                OnClick="btnSearchRD_Click" ValidationGroup="RecurrenceDepositeSearch" />
                                            <asp:Button ID="btnClearRD" runat="server" Text="i@laAr" CssClass="searchbtn" OnClick="btnClearRD_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 75px;">
                                <asp:Button ID="btnNewRecurrenceDeposite" runat="server" Text="naivana Aavata- zova"
                                    CssClass="createbtn" OnClick="btnNewRecurrenceDeposite_Click" ClientIDMode="Static" />
                                <asp:DropDownList ID="ddlRDPager" runat="server" OnSelectedIndexChanged="ddlRDPager_SelectedIndexChanged"
                                    AutoPostBack="true" CssClass="acc_page_count_txt">
                                    <asp:ListItem Selected="True" Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="grid" style="margin-top: 10px;">
                                <asp:GridView ID="gvRecurrenceDeposite" runat="server" CellPadding="4" ForeColor="#333333"
                                    GridLines="None" OnRowEditing="gvRecurrenceDeposite_RowEditing" AutoGenerateColumns="false"
                                    AllowPaging="true" Width="100%" OnPageIndexChanging="gvRecurrenceDeposite_PageIndexChanging"
                                    CssClass="grid_header">
                                    <EmptyDataTemplate>
                                        Saunya roka^D- saapaDlao
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="lHkkln dzekad">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRecurrenceDepositeId" runat="server" Text='<%# Eval("RecurrenceDepositeId") %>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("CustomerId") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblCustomerCode" runat="server" Text='<%# Eval("CustomerCode") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="lHkklnkps uko">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("CustomerLastName") + " " + Eval("CustomerFirstName")  %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="eqnr Bsohpk izdkj">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRecurrenceDepositeType" runat="server" Text='<%# Eval("RecurrenceDepositeTypeDesc")  %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Deposite Amount">
                                            <ItemTemplate>
                                                <asp:Literal ID="litRecurrenceDepositeAmount" runat="server" Text='<%# string.Format("{0:0.00}", Eval("RecurrenceDepositeAmount")) %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRecurrenceDepositeDate" runat="server" Text='<%# Eval("RecurrenceDepositeDate") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="cnyk">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnEditRecurrenceDeposite" runat="server" CommandArgument='<%# Eval("RecurrenceDepositeId") %>'
                                                    CommandName="Edit" ImageUrl="~/images/Edit.gif" ClientIDMode="Static" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" CssClass="grid_empty_row" />
                                    <AlternatingRowStyle BackColor="White" Width="100%" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="16px" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                                        Font-Size="20px" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Right" />
                                    <PagerSettings Mode="Numeric" Position="Bottom" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>
                        </div>
                        <div id="divNewRDPopup" runat="server" style="display: none; margin-top: 5px;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <div class="collepsiblebody">
                                            <div class="form_link">
                                                <a href="#" id="openAll" title="Open All">Open All</a> | <a href="#" id="closeAll"
                                                    title="Close all">Close All </a>
                                            </div>
                                        
                                        <!-- RD Section 1 -->
                                        <h3 class="page_collapsible" id="body-section1">
                                            Aava-ta zoivacaI maaihtaI<span></span>
                                        </h3>
                                        <div class="container">
                                            <div class="collepsiblecontent">
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            Aava-ta zoivacaI idnaaMk :</label><span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;</div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtRecurrenceDepositeDate" runat="server" MaxLength="10" CssClass="date_input"></asp:TextBox>
                                                        <asp:ImageButton ID="ibtnRecurrenceDepositeDate" runat="server" ImageUrl="~/images/calendar.png" />
                                                        <AjaxToolkit:CalendarExtender ID="calextRecurrenceDepositeDate" runat="server" TargetControlID="txtRecurrenceDepositeDate"
                                                            PopupButtonID="ibtnRecurrenceDepositeDate" Format="dd/MM/yyyy">
                                                        </AjaxToolkit:CalendarExtender>
                                                        <asp:RequiredFieldValidator ID="rfvRecurrenceDepositeDate" runat="server" ControlToValidate="txtRecurrenceDepositeDate"
                                                            ErrorMessage="Please Enter Recurrence Deposite Date" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                    <%--    <asp:RegularExpressionValidator ID="revRecurrenceDepositeDate" runat="server" ControlToValidate="txtRecurrenceDepositeDate"
                                                            ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                                                            ValidationGroup="SaveRecurrenceDeposite" Enabled="true"></asp:RegularExpressionValidator>--%>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            saBaasad k`maaMkx:
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtRDCustomerNo" runat="server" MaxLength="10" CssClass="date_input"
                                                            Width="196px"></asp:TextBox>&nbsp;
                                                        <asp:LinkButton ID="lnkOpenCustomerSearch" runat="server" Text="saBaasad k`. SaaoQaa"
                                                            OnClick="lnkOpenCustomerSearch_Click" ToolTip="saBaasad k`. SaaoQaa"></asp:LinkButton>
                                                        <asp:RequiredFieldValidator ID="rfvRDCustomerNumber" runat="server" ControlToValidate="txtRDCustomerNo"
                                                            ErrorMessage="Please Enter Customer Number" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            saBaasadacaa pa`kxar:
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:DropDownList ID="ddlCustomerType" runat="server" CssClass="select" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvCustomerType" runat="server" ControlToValidate="ddlCustomerType"
                                                            InitialValue="" ErrorMessage="Please Select Customer Type" Display="None" ValidationGroup="SaveFixDeposite"
                                                            Enabled="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="name_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            saBaasadacao naava :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlRDCustomernamePrefix" runat="server" CssClass="select" Width="100px">
                                                                        <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                        <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                        <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="rfvRDCustomernamePrefix" runat="server" ControlToValidate="ddlRDCustomernamePrefix"
                                                                        InitialValue="" ErrorMessage="Please Select Customer Prefix" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtRDCusotmerFirstname" runat="server" CssClass="short_input" MaxLength="30"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="rfvRDCusotmerFirstname" runat="server" ControlToValidate="txtRDCusotmerFirstname"
                                                                        ErrorMessage="Please Enter Customer FirstName" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtRDCustomerMiddlename" runat="server" CssClass="short_input" MaxLength="30"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtRDCustomerLastname" runat="server" CssClass="short_input" MaxLength="30"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="rfvRDCustomerLastname" runat="server" ControlToValidate="txtRDCustomerLastname"
                                                                        ErrorMessage="Please Enter Customer LastName" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label>
                                                                        sva:taacao naava
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <label>
                                                                        vaiDlaaMcao naava
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <label>
                                                                        AaDnaaMva
                                                                    </label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            Aava-ta zoivacaa pa`kxar :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:DropDownList ID="ddlRecurrenceDepositeType" runat="server" CssClass="select"
                                                            AutoPostBack="true" OnSelectedIndexChanged="ddlRecurrenceDepositeType_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvRecurrenceDepositeType" runat="server" ControlToValidate="ddlRecurrenceDepositeType"
                                                            InitialValue="" ErrorMessage="Please Select Recurrence Type" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            Aava-ta zoivacaI r@kma :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtRecurrenceDepositeAmount" runat="server" CssClass="date_input"
                                                            MaxLength="30" onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                            AutoPostBack="true" OnTextChanged="txtRecurrenceDepositeAmount_TextChanged" AutoComplete="off"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvRecurrenceDepositeAmount" runat="server" ControlToValidate="txtRecurrenceDepositeAmount"
                                                            ErrorMessage="Please Enter Recurrence Deposite Amount" Display="None" ValidationGroup="SaveRecurrenceDeposite">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revRecurrenceDepositeAmount" runat="server" ControlToValidate="txtRecurrenceDepositeAmount"
                                                            Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveRecurrenceDeposite"
                                                            ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            kxalaavaQaI :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:DropDownList ID="ddlRecurrenceDepositePeriodYears" runat="server" CssClass="select"
                                                            AutoPostBack="true" OnSelectedIndexChanged="ddlRecurrenceDepositePeriodYears_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvRecurrenceDepositePeriodYears" runat="server"
                                                            ControlToValidate="ddlRecurrenceDepositePeriodYears" InitialValue="" ErrorMessage="Please Enter Recurrence Deposite Period"
                                                            Display="None" ValidationGroup="SaveRecurrenceDeposite">
                                                        </asp:RequiredFieldValidator>
                                                        <%--<asp:TextBox ID="txtRDPeriodYears" runat="server" CssClass="input" Width="90px" MaxLength="4"
                                                            onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvRDPeriodYears" runat="server" ControlToValidate="txtRDPeriodYears"
                                                            ErrorMessage="Please Enter Recurrence Deposite Years" Display="None" ValidationGroup="SaveRecurrenceDeposite">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revRDPeriodYears" runat="server" ControlToValidate="txtRDPeriodYears"
                                                            Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveRecurrenceDeposite"
                                                            ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>
                                                        &nbsp;
                                                        <lable class="short_lable">vaYa-</lable>
                                                        &nbsp;
                                                        <asp:TextBox ID="txtRDPeriodMonth" runat="server" CssClass="input" Width="75px" MaxLength="2"
                                                            onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvRDPeriodMonth" runat="server" ControlToValidate="txtRDPeriodMonth"
                                                            ErrorMessage="Please Enter Recurrence Deposite Months" Display="None" ValidationGroup="SaveRecurrenceDeposite">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revRDPeriodMonth" runat="server" ControlToValidate="txtRDPeriodMonth"
                                                            Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveRecurrenceDeposite"
                                                            ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>
                                                        &nbsp;
                                                        <lable class="short_lable">maihnao</lable>--%>
                                                    </div>
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            vyaajadr :</label><span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;</div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtRDInterestRate" runat="server" CssClass="date_input" MaxLength="3"
                                                            onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                            Enabled="false"></asp:TextBox>
                                                        <%-- <asp:RequiredFieldValidator ID="rfvRDInterestRate" runat="server" ControlToValidate="txtRDInterestRate"
                                                            ErrorMessage="Please Enter Recurrence Deposite Interest Rate" Display="None"
                                                            ValidationGroup="SaveRecurrenceDeposite">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revRDInterestRate" runat="server" ControlToValidate="txtRDInterestRate"
                                                            Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveRecurrenceDeposite"
                                                            ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>--%>
                                                        <lable> %</lable>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            maudta saMpaNyaacaI taarIKa :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtRDMaturityDate" runat="server" CssClass="date_input" MaxLength="10"
                                                            Enabled="false"></asp:TextBox>
                                                        <asp:ImageButton ID="ibtnRDMaturityDate" runat="server" ImageUrl="~/images/calendar.png" />
                                                        <AjaxToolkit:CalendarExtender ID="calExtRDMaturityDate" runat="server" TargetControlID="txtRDMaturityDate"
                                                            PopupButtonID="ibtnRDMaturityDate" Format="yyyy/MM/dd">
                                                        </AjaxToolkit:CalendarExtender>
                                                        <asp:RequiredFieldValidator ID="rfvRDMaturityDate" runat="server" ControlToValidate="txtRDMaturityDate"
                                                            ErrorMessage="Please Enter Recurrence Deposite Maturity Date" Display="None"
                                                            ValidationGroup="SaveRecurrenceDeposite">
                                                        </asp:RequiredFieldValidator>
                                                       <%-- <asp:RegularExpressionValidator ID="revRDMaturityDate" runat="server" ControlToValidate="txtRDMaturityDate"
                                                            ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                                                            ValidationGroup="SaveRecurrenceDeposite" Enabled="true">
                                                        </asp:RegularExpressionValidator>--%>
                                                    </div>
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            doya r@kxma :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtRDMaturityAmt" runat="server" CssClass="date_input" MaxLength="10"
                                                            onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                            Enabled="false"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvRDMaturityAmt" runat="server" ControlToValidate="txtRDMaturityAmt"
                                                            ErrorMessage="Please Enter Recurrence Deposite Maturity Amount" Display="None"
                                                            ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revRDMaturityAmt" runat="server" ControlToValidate="txtRDMaturityAmt"
                                                            Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveRecurrenceDeposite"
                                                            ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end collapsible -->
                                        <!-- RD Section 2 -->
                                        <h3 class="page_collapsible" id="body-section3">
                                            vaarsadaracaI maaihtaI<span></span>
                                        </h3>
                                        <div class="collepsiblecontent">
                                            <div class="name_row">
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        vaarsadaracao naava :
                                                    </label>
                                                    <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                </div>
                                                <div>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="ddlRDNomineePrefix" runat="server" CssClass="select" Width="100px">
                                                                    <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                    <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                    <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvRDNomineePrefix" runat="server" ControlToValidate="ddlRDNomineePrefix"
                                                                    InitialValue="" ErrorMessage="Please Select Nominee Prefix" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtRDNomineeFirstname" runat="server" CssClass="short_input" MaxLength="50"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvRDNomineeFirstname" runat="server" ControlToValidate="txtRDNomineeFirstname"
                                                                    ErrorMessage="Please Enter Nominee Firstname" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtRDNomineeMiddlename" runat="server" CssClass="short_input" MaxLength="50"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvRDNomineeMiddlename" runat="server" ControlToValidate="txtRDNomineeMiddlename"
                                                                    ErrorMessage="Please Enter Nominee Middlename" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>--%>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtRDNomineeLastname" runat="server" CssClass="short_input" MaxLength="50"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvRDNomineeLastname" runat="server" ControlToValidate="txtRDNomineeLastname"
                                                                    ErrorMessage="Please Enter Nominee Lastname" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <label>
                                                                    sva:taacao naava
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <label>
                                                                    vaiDlaaMcao naava
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <label>
                                                                    AaDnaaMva
                                                                </label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="form_row">
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        pattaa :
                                                    </label>
                                                    &nbsp;&nbsp;&nbsp;
                                                </div>
                                                <div class="form_inputdiv">
                                                    <asp:TextBox ID="txtRDNomineeAddress" runat="server" CssClass="input" MaxLength="200"></asp:TextBox>
                                                </div>
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        mauLgaava :
                                                    </label>
                                                    <span style="font-weight: bold; color: Red; font-family: Arial;">*</span> &nbsp;
                                                </div>
                                                <div class="form_inputdiv">
                                                    <asp:DropDownList ID="ddlRDNomineeVillage" runat="server" CssClass="select">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvRDNomineeVillage" runat="server" ControlToValidate="ddlRDNomineeVillage"
                                                        InitialValue="" ErrorMessage="Please Select Nominee Village" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form_row">
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        taalaukxa :
                                                    </label>
                                                    <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                </div>
                                                <div class="form_inputdiv">
                                                    <asp:DropDownList ID="ddlRDNomineeTaluka" runat="server" CssClass="select">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvRDNomineeTaluka" runat="server" ControlToValidate="ddlRDNomineeTaluka"
                                                        InitialValue="" ErrorMessage="Please Enter Nominee Taluka" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        ijalha :
                                                    </label>
                                                    <span style="font-weight: bold; color: Red; font-family: Arial;">*</span> &nbsp;
                                                </div>
                                                <div class="form_inputdiv">
                                                    <asp:DropDownList ID="ddlRDNomineeDistrict" runat="server" CssClass="select">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvRDNomineeDistrict" runat="server" ControlToValidate="ddlRDNomineeDistrict"
                                                        InitialValue="" ErrorMessage="Please Select Nominee District" Display="None"
                                                        ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form_row">
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        paaosT :
                                                    </label>
                                                    &nbsp;&nbsp;&nbsp;
                                                </div>
                                                <div class="form_inputdiv">
                                                    <asp:TextBox ID="txtRDNomineePinCode" runat="server" CssClass="input" MaxLength="6"></asp:TextBox>
                                                </div>
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        Faona naMbar :
                                                    </label>
                                                    <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                </div>
                                                <div class="form_inputdiv">
                                                    <asp:TextBox ID="txtRDNomineePhonenumber" runat="server" CssClass="input" MaxLength="10"
                                                        onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvRDNomineePhoneNumber" runat="server" ControlToValidate="txtRDNomineePhonenumber"
                                                        ErrorMessage="Please Enter Nominee Phone number" Display="None" ValidationGroup="SaveRecurrenceDeposite"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revRDNomineePhonenumber" runat="server" ControlToValidate="txtRDNomineePhonenumber"
                                                        Display="None" ErrorMessage="Please Enter only numeric Phone number" ValidationGroup="SaveRecurrenceDeposite"
                                                        ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator></div>
                                            </div>
                                        </div>
                                        </div>
                                        <!-- end collapsible -->
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <div class="form_btn_div" style="width: 100%;">
                                            <asp:Button ID="btnSaveRecurrenceDepoisite" runat="server" Text="jatana kra" CssClass="loginbtn"
                                                OnClientClick="ValidatePageControl('SaveRecurrenceDeposite');ValidateCustomer('SaveRecurrenceDeposite');"
                                                OnClick="btnSaveRecurrenceDepoisite_Click" ValidationGroup="SaveRecurrenceDeposite" />
                                            <asp:Button ID="btnCloseRecurrenceDeposite" runat="server" Text="baMd kxra" OnClientClick="return confirm('Are you sure you want to close this recurrence deposoite ?');"
                                                OnClick="btnCloseRecurrenceDeposite_Click" Visible="false" CssClass="loginbtn" />
                                            <asp:Button ID="btnCancelRecurrenceDeposite" runat="server" Text="r_ kra" CssClass="loginbtn"
                                                OnClick="btnCancelRecurrenceDeposite_Click" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <AjaxToolkit:ModalPopupExtender ID="mpeCustSearchPopUp" runat="server" PopupControlID="pnlCustomerSearchPopup"
        TargetControlID="btnCustomerSearchPopUp" BackgroundCssClass="modalBackground"
        CancelControlID="ibtnCloseCustSearchPopUp">
    </AjaxToolkit:ModalPopupExtender>
    <asp:Button ID="btnCustomerSearchPopUp" runat="server" Text="" Style="display: none;" />
    <asp:Panel ID="pnlCustomerSearchPopup" runat="server" Style="display: none;">
        <table>
            <tr>
                <td>
                    <uc:CustomerSearch ID="ucRDCustomerSearch" runat="server" />
                </td>
                <td align="left" valign="top" style="padding-left: 5px;">
                    <asp:ImageButton ID="ibtnCloseCustSearchPopUp" runat="server" ToolTip="Close" ImageUrl="~/images/pop_close.ico"
                        Style="position: absolute; top: -15px; width: 35px; height: 35px; z-index: 39;
                        right: -10px;" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
