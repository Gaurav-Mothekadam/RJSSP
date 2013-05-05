<%@ Page Title=".:: Fix Deposite ::." Language="C#" MasterPageFile="~/Raigad.Master"
    AutoEventWireup="true" CodeBehind="FixDeposite.aspx.cs" Inherits="Raigad.Forms.FixDeposite" %>

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
    <asp:UpdatePanel ID="upFixDepositeMain" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hdnFixDepositeId" runat="server" Value="" />
            <asp:HiddenField ID="hdnCustomerId" runat="server" Value="" />
            <asp:HiddenField ID="hdnNomineeId" runat="server" Value="" />
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblFixDepositeMessage" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <div id="divFDGrid" runat="server" style="display: block;" class="acc_grid_start">
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
                                        <asp:Panel ID="pnlFDSearch" runat="server" DefaultButton="btnSearchFD">
                                            <div class="acc_search_textdiv">
                                                <asp:DropDownList ID="ddlFDSearch" runat="server" CssClass="short_select" Width="125px">
                                                    <asp:ListItem Selected="True" Text="i;kZ; fuoMk" Value=""></asp:ListItem>
                                                    <asp:ListItem Value="CusotmerName" Text="lHkklnkps uko"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvFDSearch" runat="server" ControlToValidate="ddlFDSearch"
                                                    InitialValue="" ErrorMessage="Please Select Search Type" Display="None" ValidationGroup="FixDepositeSearch"
                                                    Enabled="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="acc_search_inputdiv">
                                                <asp:TextBox ID="txtSearchFD" runat="server" CssClass="input" AutoComplete="off"></asp:TextBox>
                                            </div>
                                            <div>
                                                <asp:Button ID="btnSearchFD" runat="server" Text="SaaoQaa" CssClass="searchbtn" OnClientClick="ValidatePageControl();ValidateCustomer('FixDepositeSearch');"
                                                    OnClick="btnSearchFD_Click" ValidationGroup="FixDepositeSearch" />
                                                <asp:Button ID="btnClearFD" runat="server" Text="i@laAr" CssClass="searchbtn" OnClick="btnClearFD_Click" />
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 75px;">
                                <asp:Button ID="btnNewFixDeposite" runat="server" Text="naivana maudta zova" CssClass="createbtn"
                                    OnClick="btnNewFixDeposite_Click" ClientIDMode="Static" />
                                <asp:DropDownList ID="ddlFDPager" runat="server" OnSelectedIndexChanged="ddlFDPager_SelectedIndexChanged"
                                    AutoPostBack="true" CssClass="acc_page_count_txt">
                                    <asp:ListItem Selected="True" Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="grid" style="margin-top: 10px;">
                                <asp:GridView ID="gvFixDeposite" runat="server" CellPadding="4" ForeColor="#333333"
                                    GridLines="None" OnRowEditing="gvFixDeposite_RowEditing" AutoGenerateColumns="false"
                                    AllowPaging="true" Width="100%" OnPageIndexChanging="gvFixDeposite_PageIndexChanging"
                                    CssClass="grid_header">
                                    <EmptyDataTemplate>
                                        Saunya roka^D- saapaDlao
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="lHkkln dzekad">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFixDepositeId" runat="server" Text='<%# Eval("FixDepositeId") %>'
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
                                                <asp:Label ID="lblFixDepositeType" runat="server" Text='<%# Eval("FixDepositeTypeDesc")  %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="eqnr Bsohph jDde">
                                            <ItemTemplate>
                                                <asp:Literal ID="litFixDepositeAmount" runat="server" Text='<%# string.Format("{0:0.00}", Eval("FixDepositeAmount")) %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="eqnr Bsohph fnuakd">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFixDepositeDate" runat="server" Text='<%# Eval("FixDepositeDate") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="cnyk">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnEditFixDeposite" runat="server" CommandArgument='<%# Eval("FixDepositeId") %>'
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
                        <div id="divNewFDPopup" runat="server" style="display: none; margin-top: 5px;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <div class="collepsiblebody">
                                            <div class="form_link">
                                                <a href="#" id="openAll" title="Open All">Open All</a> | <a href="#" id="closeAll"
                                                    title="Close all">Close All </a>
                                            </div>
                                                                                <!-- Section 1 -->
                                        <h3 class="page_collapsible" id="body-section1">
                                            maudta zoivacaI maaihtaI<span></span>
                                        </h3>
                                        <div class="container">
                                            <div class="collepsiblecontent">
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            maudta zoivacaI idnaaMkx :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtFixDepositeDate" runat="server" MaxLength="10" CssClass="date_input"
                                                            AutoComplete="off"></asp:TextBox>
                                                        <asp:ImageButton ID="ibtnFixDepositeDate" runat="server" ImageUrl="~/images/calendar.png" />
                                                        <AjaxToolkit:CalendarExtender ID="calextFixDepositeDate" runat="server" TargetControlID="txtFixDepositeDate"
                                                            PopupButtonID="ibtnFixDepositeDate" Format="yyyy/MM/dd">
                                                        </AjaxToolkit:CalendarExtender>
                                                        <asp:RequiredFieldValidator ID="rfvFixDepositeDate" runat="server" ControlToValidate="txtFixDepositeDate"
                                                            ErrorMessage="Please Enter Fix Deposite Date" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
                                                        <%--<asp:RegularExpressionValidator ID="revFixDepositeDate" runat="server" ControlToValidate="txtFixDepositeDate"
                                                            ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                                                            ValidationGroup="SaveFixDeposite" Enabled="true"></asp:RegularExpressionValidator>--%>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            saBaasad kx`maaMkx:
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtFDCustomerNo" runat="server" MaxLength="10" CssClass="input"
                                                            AutoComplete="off" Width="196px"></asp:TextBox>&nbsp;
                                                        <asp:LinkButton ID="lnkOpenCustomerSearch" runat="server" Text="saBaasad k`. SaaoQaa"
                                                            OnClick="lnkOpenCustomerSearch_Click" ToolTip="saBaasad k`. SaaoQaa"></asp:LinkButton>
                                                        <asp:RequiredFieldValidator ID="rfvFDCustomerNumber" runat="server" ControlToValidate="txtFDCustomerNo"
                                                            ErrorMessage="Please Enter Customer Number" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
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
                                                                    <asp:DropDownList ID="ddlFDCustomernamePrefix" runat="server" CssClass="select" Width="100px">
                                                                        <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                        <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                        <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="rfvFDCustomernamePrefix" runat="server" ControlToValidate="ddlFDCustomernamePrefix"
                                                                        InitialValue="" ErrorMessage="Please Select Customer Prefix" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFDCusotmerFirstname" runat="server" CssClass="short_input" MaxLength="30"
                                                                        AutoComplete="off"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="rfvFDCusotmerFirstname" runat="server" ControlToValidate="txtFDCusotmerFirstname"
                                                                        ErrorMessage="Please Enter Customer FirstName" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFDCustomerMiddlename" runat="server" CssClass="short_input" MaxLength="30"
                                                                        AutoComplete="off"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFDCustomerLastname" runat="server" CssClass="short_input" MaxLength="30"
                                                                        AutoComplete="off"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="rfvFDCustomerLastname" runat="server" ControlToValidate="txtFDCustomerLastname"
                                                                        ErrorMessage="Please Enter Customer LastName" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
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
                                                            maudta zoivacaa pa`kxar :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:DropDownList ID="ddlFixDepositeType" runat="server" CssClass="select" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlFixDepositeType_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvFixDepositeType" runat="server" ControlToValidate="ddlFixDepositeType"
                                                            InitialValue="" ErrorMessage="Please Select FixDeposite Type" Display="None"
                                                            ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            maudta zoivacaI r@kxma :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtFixDepositeAmount" runat="server" CssClass="date_input" MaxLength="30"
                                                            onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                            AutoPostBack="true" OnTextChanged="txtFixDepositeAmount_TextChanged" AutoComplete="off"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvFixDepositeAmount" runat="server" ControlToValidate="txtFixDepositeAmount"
                                                            ErrorMessage="Please Enter Fix Deposite Amount" Display="None" ValidationGroup="SaveFixDeposite">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revFixDepositeAmount" runat="server" ControlToValidate="txtFixDepositeAmount"
                                                            Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveFixDeposite"
                                                            ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
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
                                                        <asp:DropDownList ID="ddlFDPeriodYears" runat="server" CssClass="select" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlFDPeriodYears_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvFDPeriodYears" runat="server" ControlToValidate="ddlFDPeriodYears"
                                                            InitialValue="" ErrorMessage="Please Enter Fix Deposite Period" Display="None"
                                                            ValidationGroup="SaveFixDeposite">
                                                        </asp:RequiredFieldValidator>
                                                        <%--<asp:TextBox ID="txtFDPeriodYears" runat="server" CssClass="input" Width="90px" MaxLength="4"
                                                            onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                            AutoComplete="off"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvFDPeriodYears" runat="server" ControlToValidate="txtFDPeriodYears"
                                                            ErrorMessage="Please Enter Fix Deposite Years" Display="None" ValidationGroup="SaveFixDeposite">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revFDPeriodYears" runat="server" ControlToValidate="txtFDPeriodYears"
                                                            Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveFixDeposite"
                                                            ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>
                                                        &nbsp;
                                                        <lable class="short_lable">vaYa-</lable>
                                                        &nbsp;
                                                        <asp:TextBox ID="txtFDPeriodMonth" runat="server" CssClass="input" Width="75px" MaxLength="2"
                                                            onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                            AutoComplete="off"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvFDPeriodMonth" runat="server" ControlToValidate="txtFDPeriodMonth"
                                                            ErrorMessage="Please Enter Fix Deposite Months" Display="None" ValidationGroup="SaveFixDeposite">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revFDPeriodMonth" runat="server" ControlToValidate="txtFDPeriodMonth"
                                                            Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveFixDeposite"
                                                            ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>
                                                        &nbsp;
                                                        <lable class="short_lable">maihnao</lable>--%>
                                                    </div>
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            vyaajadr :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtFDInterestRate" runat="server" CssClass="date_input" MaxLength="30"
                                                            onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                            AutoComplete="off" Enabled="false"></asp:TextBox>
                                                        <lable> %</lable>
                                                        <%--<asp:RequiredFieldValidator ID="rfvFDInterestRate" runat="server" ControlToValidate="txtFDInterestRate"
                                                            ErrorMessage="Please Enter Fix Deposite Interest Rates" Display="None" ValidationGroup="SaveFixDeposite">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revFDInterestRate" runat="server" ControlToValidate="txtFDInterestRate"
                                                            Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveFixDeposite"
                                                            ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>--%>
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
                                                        <asp:TextBox ID="txtFDMaturityDate" runat="server" CssClass="date_input" MaxLength="10"
                                                            AutoComplete="off" Enabled="false"></asp:TextBox>
                                                        <asp:ImageButton ID="ibtnFDMaturityDate" runat="server" ImageUrl="~/images/calendar.png" />
                                                        <AjaxToolkit:CalendarExtender ID="calExtFDMaturityDate" runat="server" TargetControlID="txtFDMaturityDate"
                                                            PopupButtonID="ibtnFDMaturityDate" Format="yyyy/MM/dd">
                                                        </AjaxToolkit:CalendarExtender>
                                                        <asp:RequiredFieldValidator ID="rfvFDMaturityDate" runat="server" ControlToValidate="txtFDMaturityDate"
                                                            ErrorMessage="Please Enter Fix Deposite Maturity Date" Display="None" ValidationGroup="SaveFixDeposite">
                                                        </asp:RequiredFieldValidator>
                                                       <%-- <asp:RegularExpressionValidator ID="revFDMaturityDate" runat="server" ControlToValidate="txtFDMaturityDate"
                                                            ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                                                            ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                                                            ValidationGroup="SaveFixDeposite" Enabled="true">
                                                        </asp:RegularExpressionValidator>--%>
                                                    </div>
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            doya r@kxma :
                                                        </label>
                                                        <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtFDMaturityAmt" runat="server" CssClass="date_input" MaxLength="10"
                                                            onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                            AutoComplete="off" Enabled="false"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvFDMaturityAmt" runat="server" ControlToValidate="txtFDMaturityAmt"
                                                            ErrorMessage="Please Enter Fix Deposite Maturity Amount" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revFDMaturityAmt" runat="server" ControlToValidate="txtFDMaturityAmt"
                                                            Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveFixDeposite"
                                                            ValidationExpression="^[1-9]\d*(\.\d+)?$"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end collapsible -->
                                        <!-- Section 2 -->
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
                                                                <asp:DropDownList ID="ddlFDNomineePrefix" runat="server" CssClass="select" Width="100px">
                                                                    <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                    <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                    <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvFDNomineePrefix" runat="server" ControlToValidate="ddlFDNomineePrefix"
                                                                    InitialValue="" ErrorMessage="Please Select Nominee Prefix" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtFDNomineeFirstname" runat="server" CssClass="short_input" MaxLength="50"
                                                                    AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvFDNomineeFirstname" runat="server" ControlToValidate="txtFDNomineeFirstname"
                                                                    ErrorMessage="Please Enter Nominee Firstname" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtFDNomineeMiddlename" runat="server" CssClass="short_input" MaxLength="50"
                                                                    AutoComplete="off"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvFDNomineeMiddlename" runat="server" ControlToValidate="txtFDNomineeMiddlename"
                                                                    ErrorMessage="Please Enter Nominee Middlename" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>--%>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtFDNomineeLastname" runat="server" CssClass="short_input" MaxLength="50"
                                                                    AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvFDNomineeLastname" runat="server" ControlToValidate="txtFDNomineeLastname"
                                                                    ErrorMessage="Please Enter Nominee Lastname" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
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
                                                    <asp:TextBox ID="txtFDNomineeAddress" runat="server" CssClass="input" MaxLength="200"
                                                        AutoComplete="off"></asp:TextBox>
                                                </div>
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        mauLgaava :
                                                    </label>
                                                    <span style="font-weight: bold; color: Red; font-family: Arial;">*</span> &nbsp;
                                                </div>
                                                <div class="form_inputdiv">
                                                    <asp:DropDownList ID="ddlFDNomineeVillage" runat="server" CssClass="select">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvFDNomineeVillage" runat="server" ControlToValidate="ddlFDNomineeVillage"
                                                        InitialValue="" ErrorMessage="Please Select Nominee Village" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
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
                                                    <asp:DropDownList ID="ddlFDNomineeTaluka" runat="server" CssClass="select">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvFDNomineeTaluka" runat="server" ControlToValidate="ddlFDNomineeTaluka"
                                                        InitialValue="" ErrorMessage="Please Enter Nominee Taluka" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        ijalha :
                                                    </label>
                                                    <span style="font-weight: bold; color: Red; font-family: Arial;">*</span> &nbsp;
                                                </div>
                                                <div class="form_inputdiv">
                                                    <asp:DropDownList ID="ddlFDNomineeDistrict" runat="server" CssClass="select">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvFDNomineeDistrict" runat="server" ControlToValidate="ddlFDNomineeDistrict"
                                                        InitialValue="" ErrorMessage="Please Select Nominee District" Display="None"
                                                        ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
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
                                                    <asp:TextBox ID="txtFDNomineePinCode" runat="server" CssClass="input" MaxLength="6"
                                                        AutoComplete="off"></asp:TextBox>
                                                </div>
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        Faona naMbar :
                                                    </label>
                                                    <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                </div>
                                                <div class="form_inputdiv">
                                                    <asp:TextBox ID="txtFDNomineePhonenumber" runat="server" CssClass="date_input" MaxLength="10"
                                                        onKeyPress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                        AutoComplete="off"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvFDNomineePhoneNumber" runat="server" ControlToValidate="txtFDNomineePhonenumber"
                                                        ErrorMessage="Please Enter Nominee Phone number" Display="None" ValidationGroup="SaveFixDeposite"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revFDNomineePhonenumber" runat="server" ControlToValidate="txtFDNomineePhonenumber"
                                                        Display="None" ErrorMessage="Please Enter only numeric Phone number" ValidationGroup="SaveFixDeposite"
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
                                            <asp:Button ID="btnSaveFixDepoisite" runat="server" Text="jatana kra" CssClass="loginbtn"
                                                OnClientClick="ValidatePageControl('SaveFixDeposite');ValidateCustomer('SaveFixDeposite');"
                                                OnClick="btnSaveFixDepoisite_Click" ValidationGroup="SaveFixDeposite" />
                                            <asp:Button ID="btnCloseFixDeposite" runat="server" Text="baMd kxra" OnClientClick="return confirm('Are you sure you want to close this fix deposoite ?');"
                                                OnClick="btnCloseFixDeposite_Click" Visible="false" CssClass="loginbtn" />
                                            <asp:Button ID="btnCancelFixDeposite" runat="server" Text="r_ kra" CssClass="loginbtn"
                                                OnClick="btnCancelFixDeposite_Click" />
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
                    <uc:CustomerSearch ID="ucCustomerSearch" runat="server" />
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
