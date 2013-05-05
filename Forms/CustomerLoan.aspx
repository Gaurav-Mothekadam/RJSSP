<%@ Page Title=".:: Loan ::." Language="C#" MasterPageFile="~/Raigad.Master" AutoEventWireup="true"
    CodeBehind="CustomerLoan.aspx.cs" Inherits="Raigad.Forms.CustomerLoan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>
<%@ Register Src="~/UserControls/CustomerSearchLoan.ascx" TagPrefix="uc" TagName="CustomerSearchLoan" %>
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
    <script type="text/javascript">
        function CheckLoanAmount() {
            try {
              txtLoanAmt = document.getElementById('<%= txtLoanAmt.ClientID%>');
               ddlLoanType = document.getElementById('<%= ddlLoanType.ClientID%>');
               var ddlLoanType = ddlLoanType.value;
               var txtLoanAmtval = txtLoanAmt.value;
               if (ddlLoanType == '4') { if (txtLoanAmtval > 25000) { alert("Not Allowed Maximum 25000"); txtLoanAmt.value = ''; return false; } return true; }
               if (ddlLoanType == '3') { if (txtLoanAmtval > 50000) { alert("Not Allowed Maximum 50000"); txtLoanAmt.value = ''; return false; } return true; }
               if (ddlLoanType == '2') { if (txtLoanAmtval > 150000) { alert("Not Allowed Maximum 150000"); txtLoanAmt.value = ''; return false; } return true; }
               if (ddlLoanType == '1') { if (txtLoanAmtval > 75000) { alert("Not Allowed Maximum 75000"); txtLoanAmt.value = ''; return false; } return true; }
              
            }
            catch (ex) {
               // alert("Error :" + ex);
            }
            return true;
         }
    
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upMain" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hdnBindLoanData" runat="server" Value="" />
            <asp:HiddenField ID="hdnCustomerId" runat="server" />
            <asp:HiddenField ID="hdnLoanId" runat="server" />
            <asp:HiddenField ID="hdnWitnessID1" runat="server" />
            <asp:HiddenField ID="hdnWitnessID2" runat="server" />
            <asp:HiddenField ID="hdnWitnessID3" runat="server" />
            <asp:HiddenField ID="hdnWitnessID4" runat="server" />
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <div id="divLoanGrid" runat="server" style="display: none;" class="acc_grid_start">
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
                                            <asp:DropDownList ID="ddlLoanSearch" runat="server" CssClass="short_select" Width="125px">
                                                <asp:ListItem Selected="True" Text="i;kZ; fuoMk" Value=""></asp:ListItem>
                                                <asp:ListItem Value="CustomerNo" Text="lHkkln dzekad"></asp:ListItem>
                                                <asp:ListItem Value="CusotmerName" Text="lHkklnkps uko"></asp:ListItem>
                                                <asp:ListItem Value="CusotmerDistrict" Text="lHkklnkpk ftYgk"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvCustomerSearch" runat="server" ControlToValidate="ddlLoanSearch"
                                                InitialValue="" ErrorMessage="Please Select Customer Search Type" Display="None"
                                                ValidationGroup="SearchCusotmerForLoan" Enabled="true"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="acc_search_inputdiv">
                                            <asp:TextBox ID="txtSearchCustomer" runat="server" CssClass="login_input"></asp:TextBox>
                                        </div>
                                        <div>
                                            <asp:Button ID="btnSearchCustomer" runat="server" Text="SaaoQaa" CssClass="searchbtn"
                                                OnClientClick="ValidatePageControl('SearchCusotmerForLoan');ValidateCustomer('SearchCusotmerForLoan');"
                                                OnClick="btnSearchCustomer_Click" ValidationGroup="SearchCusotmerForLoan" />
                                            <asp:Button ID="btnClearCustomer" runat="server" Text="i@laAr" CssClass="searchbtn"
                                                OnClick="btnClearCustomer_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 75px;">
                                <asp:Button ID="btnNewCustomer" runat="server" Text="naivana kja-" CssClass="createbtn"
                                    OnClick="btnNewCustomer_Click" />
                                <asp:DropDownList ID="ddlPager" runat="server" CssClass="acc_page_count_txt">
                                    <asp:ListItem Selected="True" Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="grid" style="margin-top: 10px;">
                                <asp:GridView ID="gvCustomerLoan" runat="server" CellPadding="4" ForeColor="#333333"
                                    AutoGenerateColumns="false" GridLines="None" AllowPaging="true" Width="100%"
                                    OnPageIndexChanging="gvCustomerLoan_PageIndexChanging" OnRowEditing="gvCustomerLoan_RowEditing"
                                    CssClass="grid_header">
                                    <EmptyDataTemplate>
                                        Saunya roka^D- saapaDlao
                                    </EmptyDataTemplate>
                                    <EmptyDataRowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="lHkkln dzekad">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLoanId" runat="server" Text='<%# Eval("LoanId") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("CustomerId") %>'></asp:Label>
                                                <asp:Label ID="lblCustomerCode" runat="server" Text='<%# Eval("CustomerCode") %>'
                                                    Visible="false"> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="lHkklnkpk izdkj">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("FirstName") + " " + Eval("LastName")  %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="dtkZpk izdkj">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLoanTypeName" runat="server" Text='<%# Eval("LoanTypeName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="dtkZph jDde">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLoanAmount" runat="server" Text='<%# string.Format("{0:0.00}", Eval("LoanAmount")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="gIR;kph jDde">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInstalmentAmount" runat="server" Text='<%# string.Format("{0:0.00}",Eval("InstallmentAmount")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="dtkZpk dkyko/kh">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLoanPeriod" runat="server" CssClass="grid_numeric_item" Text='<%# Convert.ToInt32(Eval("LoanPeriod")) %>'></asp:Label>
                                                <asp:Label ID="lblLoanPeriodDurationText" runat="server" Text="efgus" CssClass="form_label_kruti"></asp:Label>
                                            </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Center"/>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="cnyk">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnEditLoan" runat="server" CommandArgument='<%# Eval("CustomerId") %>'
                                                    CommandName="Edit" ImageUrl="~/images/Edit.gif" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" CssClass="grid_empty_row" />
                                    <AlternatingRowStyle BackColor="White" Width="100%" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
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
                        <div id="divNewLoanPopup" runat="server" style="display: block; margin-top: 5px;">
                            <table>
                                <tr>
                                    <td>
                                       <div class="collepsiblebody">
                                            <div class="form_link">
                                                
                                                    <a href="#" id="openAll" title="Open All">Open All</a> | <a href="#" id="closeAll" title="Close all">Close All</a>
                                            </div>
                                            <!-- Section 1 -->
                                            <!-- Section 2 -->
                                            <h3 class="page_collapsible" id="body-section1">
                                                Aja-daracaI maihtaI <span></span>
                                            </h3>
                                            <div class="container">
                                                <div class="collepsiblecontent">
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                idnaaMkx:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv" style="width: 264px;">
                                                            <asp:TextBox ID="txtLoanDate" runat="server"  Width="240px"  MaxLength="10" CssClass="date_input"
                                                                    onkeypress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                                    AutoComplete="off"></asp:TextBox>
                                                            <asp:ImageButton ID="ibtnLoanDate" runat="server" ImageUrl="~/images/calendar.png" />
                                                            <AjaxToolkit:CalendarExtender ID="calLoanDate" runat="server" TargetControlID="txtLoanDate"
                                                                PopupButtonID="ibtnLoanDate" Format="yyyy/MM/dd">
                                                            </AjaxToolkit:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="rfvLoanDate" runat="server" ControlToValidate="txtLoanDate"
                                                                ErrorMessage="Please Enter Date" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                           <%-- <asp:RegularExpressionValidator ID="revLoanDate" runat="server" ControlToValidate="txtLoanDate"
                                                                ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                                                                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                                                                ValidationGroup="SaveLoan" Enabled="true">
                                                            </asp:RegularExpressionValidator>--%>
                                                        </div>
                                                        <div class="form_labeldiv" style="width: 120px;">
                                                            <label class="form_label">
                                                                saBaasad k`maaMkx:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_btn_div" style="float: left;">
                                                            <asp:TextBox ID="txtCustomerNo" runat="server" CssClass="date_input" Enabled="false"
                                                                Width="225px"></asp:TextBox>
                                                            &nbsp
                                                            <asp:LinkButton ID="lnkOpenCustomerSearch" runat="server" CssClass="link_search"
                                                                Text="saBaasad k`. SaaoQaa" OnClick="lnkOpenCustomerSearch_Click" ToolTip="saBaasad k`. SaaoQaa"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="name_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                Aja-daracao naava:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlCustomerPrefix" runat="server" CssClass="select" Width="100px"
                                                                            Enabled="false">
                                                                            <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                            <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                            <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="short_input" Enabled="false"></asp:TextBox>
                                                                        <td>
                                                                            <asp:TextBox ID="txtMiddleName" runat="server" CssClass="short_input" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="short_input" Enabled="false"></asp:TextBox>
                                                                            &nbsp;
                                                                        </td>
                                                                        <tr>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    sva:taacao naava</label>
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    vaiDlaaMcao naava</label>
                                                                            </td>
                                                                            <td>
                                                                                <label>
                                                                                    AaDnaaMva</label>
                                                                            </td>
                                                                        </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                kjaa-caa pa`kxar:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlLoanType" runat="server" CssClass="select" 
                                                              AutoPostBack="true"   onselectedindexchanged="ddlLoanType_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvLoanType" runat="server" ControlToValidate="ddlLoanType"
                                                                InitialValue="" ErrorMessage="Please Select Loan Type" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                kxja-caI r@kma:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtLoanAmt" runat="server" CssClass="date_input" MaxLength="6"
                                                                onKeyPress="var result=CheckLoanAmount();if(result) var result=NumericsOnly(this,event);return result;"  onChange="CheckLoanAmount()"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvLoanamt" runat="server" ControlToValidate="txtLoanAmt"
                                                                ErrorMessage="Please Enter Loan Amount" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                            <%--<asp:RegularExpressionValidator ID="revLoanAmt" runat="server" ControlToValidate="txtLoanAmt"
                                                                Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveLoan"
                                                                ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>--%>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                hptyaacaI r@kma:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtEmiAmt" runat="server" CssClass="date_input" MaxLength="6" onKeyPress="return NumericsOnly(this,event);"
                                                                ></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvEmiamt" runat="server" ControlToValidate="txtEmiAmt"
                                                                ErrorMessage="Please Enter Monthly Loan Amount" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                           <%-- <asp:RegularExpressionValidator ID="revEmiamt" runat="server" ControlToValidate="txtEmiAmt"
                                                                Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveLoan"
                                                                ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>--%>
                                                            <asp:CompareValidator ID="cvEmiAmt" runat="server" ControlToCompare="txtLoanAmt"
                                                                ControlToValidate="txtEmiAmt" ErrorMessage="Value Must be smaller than Karjachi rakam"
                                                                Operator="LessThan" Type="Double" ValidationGroup="SaveLoan" Display="None"></asp:CompareValidator>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                kxalaavaQaI:</label><font face="arial" size="4" color="red">*</font>&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlLoanYear" runat="server" CssClass="select" Width="90px">
                                                                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                                <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                                                <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &nbsp;<asp:Label ID="lblLoanYear" runat="server" Text="vaYa-" CssClass="short_lable"></asp:Label>
                                                            <asp:DropDownList ID="ddlLoanMonth" runat="server" CssClass="select" Width="90px">
                                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                                <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                                                <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                                <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                                                <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &nbsp;
                                                            <asp:Label ID="lblLoanMonth" runat="server" Text="maihnao" CssClass="short_lable"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                naaokrI vaYa-:</label>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerServiceYear" runat="server" ReadOnly="true" CssClass="date_input"></asp:TextBox>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                saovaainavaRttaIcaI taarIKa:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCusotmerRetirementDate" runat="server" CssClass="date_input"></asp:TextBox>
                                                            <asp:ImageButton ID="ibtnCustomerRetirementDate" runat="server" visible="false" ImageUrl="~/images/calendar.png" />
                                                            <AjaxToolkit:CalendarExtender ID="calextCustomerRetirementDate" runat="server" TargetControlID="txtCusotmerRetirementDate"
                                                                PopupButtonID="ibtnCustomerRetirementDate" Format="dd/MM/yyyy">
                                                            </AjaxToolkit:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="rfvCustomerRetirementDate" runat="server" ControlToValidate="txtCusotmerRetirementDate"
                                                                ErrorMessage="Please Enter Date Of Retirement" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="revCustomerRetirementDate" runat="server" ControlToValidate="txtCusotmerRetirementDate"
                                                                ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                                                                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                                                                ValidationGroup="SaveLoan" Enabled="true">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                pagaar:</label>&nbsp;&nbsp;&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerSalary" runat="server" CssClass="date_input" MaxLength="6"
                                                                Enabled="false"></asp:TextBox>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                maaigala kxja- vasaulaI:</label>&nbsp;&nbsp;&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustomerPastLoanEMI" runat="server" CssClass="select">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                kxja- GaoNyaacaa hotaU:</label>&nbsp;&nbsp;&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerLoanPurpose" runat="server" CssClass="input"></asp:TextBox>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                qaikta hptao:</label>&nbsp;&nbsp;&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtTotalLoanInstallmentAmt" runat="server" CssClass="date_input"
                                                                MaxLength="6" onKeyPress="return NumericsOnly(this,event);"></asp:TextBox>
                                                    <%--        <asp:RequiredFieldValidator ID="rfvTotalInstalment" runat="server" ControlToValidate="txtTotalLoanInstallmentAmt"
                                                                ErrorMessage="Please Enter Loan Amount" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>--%>    
                                                      <%--<asp:RegularExpressionValidator ID="revTotalLoanInstallmentAmt" runat="server" ControlToValidate="txtTotalLoanInstallmentAmt"
                                                                Display="None" ErrorMessage="Please Enter only numeric value" ValidationGroup="SaveLoan"
                                                                ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end collapsible -->
                                            <!-- Section 3 -->
                                            <h3 class="page_collapsible" id="body-section2">
                                                jaaimanadaracaI maihtaI<span></span>
                                            </h3>
                                            <div class="container">
                                                <div class="collepsiblecontent">
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                jaaimanadar 1</label>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                saBaasad k`maaMkx:</label><font face="arial" size="4" color="red">*</font>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv" style="width: 260px;">
                                                            <asp:TextBox ID="txtCustWitnessNo1" runat="server" CssClass="date_input" Enabled="false"></asp:TextBox>
                                                            &nbsp
                                                            <asp:RequiredFieldValidator ID="rfvCustWitnessNo1" runat="server" ControlToValidate="txtCustWitnessNo1"
                                                                InitialValue="" ErrorMessage="Please Enter Gaurantor Customer No" Display="None"
                                                                ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div>
                                                            <asp:LinkButton ID="lnkOpenCustomerSearchForWitness1" runat="server" CssClass="link_search"
                                                                Text="saBaasad k`. SaaoQaa" OnClick="lnkOpenCustomerSearchForWitness1_Click"
                                                                ToolTip="saBaasad k`. SaaoQaa"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="name_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                jaaimanadaracao naava:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlCustWitnessPrefix1" runat="server" CssClass="select" Width="100px"
                                                                            AutoPostBack="true">
                                                                            <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                            <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                            <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvCustWitnessPrefix1" runat="server" ControlToValidate="ddlCustWitnessPrefix1"
                                                                            InitialValue="" ErrorMessage="Please Select" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessFirstName1" runat="server" CssClass="short_input"
                                                                            Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessMiddleName1" runat="server" CssClass="short_input"
                                                                            Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessLastName1" runat="server" CssClass="short_input" Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <tr>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                sva:taacao naava</label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                vaiDlaaMcao naava</label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                AaDnaaMva</label>
                                                                        </td>
                                                                    </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                SaaLa:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustWitnessSchool1" runat="server" CssClass="input"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvGaurantorSchool1" runat="server" ControlToValidate="txtCustWitnessSchool1"
                                                                InitialValue="" ErrorMessage="Please Enter Gaurantor School Name" Display="None"
                                                                ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                taalaukxa:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustWitnessTaluka1" runat="server" CssClass="select">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv" style="display:none">
                                                            <label class="form_label">
                                                                hptao vasaulaI:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv" style="display:none">
                                                            <asp:DropDownList ID="ddlCustWitnessInstallmentReturnType1" runat="server" CssClass="select">
                                                                <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                <asp:ListItem Text="fu;fer" Value="regular"></asp:ListItem>
                                                                <asp:ListItem Text="vfu;fer" Value="irregular"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                jaaimanadar 2</label></div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                saBaasad k`maaMkx:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv" style="width: 260px;">
                                                            <asp:TextBox ID="txtCustWitnessNo2" runat="server" CssClass="date_input" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvCustWitnessNo2" runat="server" ControlToValidate="txtCustWitnessNo2"
                                                                InitialValue="" ErrorMessage="Please Enter Gaurantors No" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div>
                                                            <asp:LinkButton ID="lnkOpenCustomerSearchForWitness2" runat="server" CssClass="link_search"
                                                                Text="saBaasad k`. SaaoQaa" OnClick="lnkOpenCustomerSearchForWitness2_Click"
                                                                ToolTip="saBaasad k`. SaaoQaa"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="name_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                jaaimanadaracao naava:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlCustWitnessPrefix2" runat="server" CssClass="select" Width="100px"
                                                                            AutoPostBack="true">
                                                                            <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                            <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                            <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvCustWitnessPrefix2" runat="server" ControlToValidate="ddlCustWitnessPrefix2"
                                                                            InitialValue="" ErrorMessage="Please Select" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessFirstName2" runat="server" CssClass="short_input"
                                                                            Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessMiddleName2" runat="server" CssClass="short_input"
                                                                            Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessLastName2" runat="server" CssClass="short_input" Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <tr>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                sva:taacao naava</label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                vaiDlaaMcao naava</label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                AaDnaaMva</label>
                                                                        </td>
                                                                    </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                SaaLa:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustWitnessSchool2" runat="server" CssClass="input"></asp:TextBox>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                taalaukxa:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustWitnessTaluka2" runat="server" CssClass="select">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv" style="display:none">
                                                            <label class="form_label">
                                                                hptao vasaulaI:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv" style="display:none">
                                                            <asp:DropDownList ID="ddlCustWitnessInstallmentReturnType2" runat="server" CssClass="select">
                                                                <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                <asp:ListItem Text="fu;fer" Value="regular"></asp:ListItem>
                                                                <asp:ListItem Text="vfu;fer" Value="irregular"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                jaaimanadar 3</label></div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                saBaasad k`maaMkx:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv" style="width: 260px;">
                                                            <asp:TextBox ID="txtCustWitnessNo3" runat="server" CssClass="date_input" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvCustWitnessNo3" runat="server" ControlToValidate="txtCustWitnessNo3"
                                                                InitialValue="" ErrorMessage="Please Enter Gaurantors No" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div>
                                                            <asp:LinkButton ID="lnkOpenCustomerSearchForWitness3" runat="server" CssClass="link_search"
                                                                Text="saBaasad k`. SaaoQaa" OnClick="lnkOpenCustomerSearchForWitness3_Click"
                                                                ToolTip="saBaasad k`. SaaoQaa"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="name_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                jaaimanadaracao naava:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlCustWitnessPrefix3" runat="server" CssClass="select" Width="100px"
                                                                            AutoPostBack="true">
                                                                            <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                            <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                            <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvCustWitnessPrefix3" runat="server" ControlToValidate="ddlCustWitnessPrefix3"
                                                                            Display="None" ErrorMessage="Please Select" InitialValue="" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessFirstName3" runat="server" CssClass="short_input"
                                                                            Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessMiddleName3" runat="server" CssClass="short_input"
                                                                            Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessLastName3" runat="server" CssClass="short_input" Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <tr>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                sva:taacao naava</label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                vaiDlaaMcao naava</label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                AaDnaaMva</label>
                                                                        </td>
                                                                    </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                SaaLa:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustWitnessSchool3" runat="server" CssClass="input"></asp:TextBox>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                taalaukxa:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustWitnessTaluka3" runat="server" CssClass="select">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv" style="display:none">
                                                            <label class="form_label">
                                                                hptao vasaulaI:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv" style="display:none">
                                                            <asp:DropDownList ID="ddlCustWitnessInstallmentReturnType3" runat="server" CssClass="select">
                                                                <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                <asp:ListItem Text="fu;fer" Value="regular"></asp:ListItem>
                                                                <asp:ListItem Text="vfu;fer" Value="irregular"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="form_row" style="display:none" >
                                                        <div class="form_labeldiv" style="display:none">
                                                            <label class="form_label">
                                                                jaaimanadar 4</label></div>
                                                    </div>
                                                    <div class="form_row" style="display:none" >
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                saBaasad k`maaMkx:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv" style="width: 260px;">
                                                            <asp:TextBox ID="txtCustWitnessNo4" runat="server" CssClass="date_input" Enabled="false"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvCustWitnessNo4" runat="server" ControlToValidate="txtCustWitnessNo4"
                                                                InitialValue="" ErrorMessage="Please Enter Gaurantors No" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div>
                                                            <asp:LinkButton ID="lnkOpenCustomerSearchForWitness4" runat="server" CssClass="link_search"
                                                                Text="saBaasad k`. SaaoQaa" OnClick="lnkOpenCustomerSearchForWitness4_Click"
                                                                ToolTip="saBaasad k`. SaaoQaa"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="name_row" style="display:none" >
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                jaaimanadaracao naava:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlCustWitnessPrefix4" runat="server" CssClass="select" Width="100px"
                                                                            AutoPostBack="true">
                                                                            <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                            <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                            <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvCustWitnessPrefix4" runat="server" ControlToValidate="ddlCustWitnessPrefix4"
                                                                            InitialValue="" ErrorMessage="Please Select" Display="None" ValidationGroup="SaveLoan"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessFirstName4" runat="server" CssClass="short_input"
                                                                            Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessMiddleName4" runat="server" CssClass="short_input"
                                                                            Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustWitnessLastName4" runat="server" CssClass="short_input" Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <tr>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                sva:taacao naava</label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                vaiDlaaMcao naava</label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                AaDnaaMva</label>
                                                                        </td>
                                                                    </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="form_row" style="display:none" >
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                SaaLa:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustWitnessSchool4" runat="server" CssClass="input"></asp:TextBox>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                taalaukxa:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustWitnessTaluka4" runat="server" CssClass="select">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="form_row" style="display:none" >
                                                        <div class="form_labeldiv" style="display:none">
                                                            <label class="form_label">
                                                                hptao vasaulaI:</label><font face="arial" size="4" color="red">*</font>&nbsp;</div>
                                                        <div class="form_inputdiv" style="display:none">
                                                            <asp:DropDownList ID="ddlCustWitnessInstallmentReturnType4" runat="server" CssClass="select">
                                                                <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                <asp:ListItem Text="fu;fer" Value="regular"></asp:ListItem>
                                                                <asp:ListItem Text="vfu;fer" Value="irregular"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end collapsible -->
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <div class="form_btn_div" style="width: 100%;">
                                            <asp:Button ID="btnSave" runat="server" Text="jatana kra" CssClass="loginbtn" ValidationGroup="SaveLoan"
                                                OnClientClick="ValidatePageControl('SaveLoan');ValidateCustomer('SaveLoan');CheckLoanAmount()"
                                                OnClick="btnSave_Click" />
                                            <asp:Button ID="btnCancel" runat="server" Text="r_ kra" CssClass="loginbtn" OnClick="btnCancel_Click" />
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
                    <uc:CustomerSearchLoan ID="ucCustomerSearchLoan" runat="server" />
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
