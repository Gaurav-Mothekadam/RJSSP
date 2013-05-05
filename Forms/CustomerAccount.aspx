<%@ Page Title=".:: Customer ::." Language="C#" MasterPageFile="~/Raigad.Master"
    AutoEventWireup="true" CodeBehind="CustomerAccount.aspx.cs" Inherits="Raigad.Forms.CustomerAccount" %>

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
        // Added By : Himanshu Pandya
        function SetCustomerRetirementDate(objDate, month) {
            try {
                if (objDate.value.trim() != '') {
                    var elem = objDate.value.split('/');
                    var EmpDate = new Date(elem[1] + "/" + elem[0] + "/" + elem[2]);
                    var EmpNewDate = new Date(new Date(EmpDate).setMonth(EmpDate.getMonth() + month));
                    txtCustRetirementDate = document.getElementById("<%= txtCustRetirementDate.ClientID %>");
                    txtCustRetirementDate.value = EmpNewDate.format("dd/MM/yyyy").toString();
                    //alert(EmpNewDate.format("dd/MM/yyyy").toString() + "--" + txtCustRetirementDate);
                }
            }
            catch (ex) {
                //alert("Error :" + ex);
            }
        }

        // Added By : Himanshu Pandya
        // Date : 13-01-2013
        function CheckCustomerEmploymentDate() {
            try {
                var txtCustomerDOB = document.getElementById("<%= txtCustomerDOB.ClientID %>")
                var txtCustEmploymentYear = document.getElementById("<%= txtCustEmploymentYear.ClientID %>")

                var arrstart = txtCustomerDOB.value.split('/');
                var arrend = txtCustEmploymentYear.value.split('/');

                var startdate = new Date(arrstart[1] + "/" + arrstart[0] + "/" + arrstart[2]);
                var enddate = new Date(arrend[1] + "/" + arrend[0] + "/" + arrend[2]);

                if (enddate <= startdate) {
                    alert("Employment date should not be less than equal Birth Date ");
                    txtCustEmploymentYear.value = '';
                    return false;
                }
            }
            catch (ex) {
                //alert("Compare Date Error : " + ex);
            }
        }
        //Added By : Himanshu
        function CheckCusotmerRetirementDate() {
            try {
                var txtCustomerDOB = document.getElementById("<%= txtCustomerDOB.ClientID %>");
                var txtCustEmploymentYear = document.getElementById("<%= txtCustEmploymentYear.ClientID %>");
                var txtCustRetirementDate = document.getElementById("<%= txtCustRetirementDate.ClientID %>");

                var arrstart = txtCustomerDOB.value.split('/');
                var arrend = txtCustEmploymentYear.value.split('/');
                var arrend1 = txtCustRetirementDate.value.split('/');

                var startdate = new Date(arrstart[1] + "/" + arrstart[0] + "/" + arrstart[2]);
                var enddate = new Date(arrend[1] + "/" + arrend[0] + "/" + arrend[2]);
                var enddate1 = new Date(arrend1[1] + "/" + arrend1[0] + "/" + arrend1[2]);

                if (enddate1 <= startdate) {
                    alert("Retirement date should not be less than Birth Date");
                    txtCustRetirementDate.value = '';
                    return false;
                }
                else if (enddate1 <= enddate) {
                    alert("Retirement date should not be less than Employment Date");
                    txtCustRetirementDate.value = '';
                    return false;
                }
            }
            catch (ex) {
                //alert("Compare Date Error : " + ex);
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upMain" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hdnCusotmerId" runat="server" />
            <asp:HiddenField ID="hdnNomineeId" runat="server" />
            <asp:HiddenField ID="hdnAccountId" runat="server" />
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <div id="divCustomerGrid" runat="server" style="display: none;" class="acc_grid_start">
                            <div class="acc_search">
                                <div class="acc_search_top">
                                    SaaoQaa
                                </div>
                                <div class="acc_search_bg">
                                    <div class="acc_search_text">
                                        <label class="grey_label">
                                            AapaNa KaalaIla payaa-ya vaapar}na SaaoQaU Saktaata.
                                        </label>
                                    </div>
                                    <div class="acc_search_subdiv">
                                        <div class="acc_search_textdiv">
                                            <asp:DropDownList ID="ddlCustomerSearch" runat="server" CssClass="short_select" Width="125px">
                                                <asp:ListItem Selected="True" Text="i;kZ; fuoMk" Value=""></asp:ListItem>
                                                <asp:ListItem Value="CustomerNo" Text="lHkkln dzekad"></asp:ListItem>
                                                <asp:ListItem Value="CusotmerName" Text="lHkklnkps uko"></asp:ListItem>
                                                <asp:ListItem Value="CusotmerDistrict" Text="lHkklnkpk ftYgk"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvCustomerSearch" runat="server" ControlToValidate="ddlCustomerSearch"
                                                InitialValue="" ErrorMessage="Please Select Customer Search Type" Display="None"
                                                ValidationGroup="CustomerSearch" Enabled="true"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="acc_search_inputdiv">
                                            <asp:TextBox ID="txtSearchCustomer" runat="server" CssClass="input" AutoComplete="off"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="rfvtxtSearchCustomer" runat="server" ControlToValidate="txtSearchCustomer"
                                                InitialValue="" ErrorMessage="Please Enter to Search" Display="None"
                                                ValidationGroup="CustomerSearch" Enabled="true"></asp:RequiredFieldValidator>
                                        </div>
                                        <div>
                                            <asp:Button ID="btnSearchCustomer" runat="server" Text="SaaoQaa" CssClass="searchbtn"
                                                OnClientClick="ValidatePageControl();ValidateCustomer('CustomerSearch');" OnClick="btnSearchCustomer_Click"
                                                ValidationGroup="CustomerSearch" />
                                            <asp:Button ID="btnClearCustomer" runat="server" Text="i@laAr" CssClass="searchbtn"
                                                OnClick="btnClearCustomer_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 75px;">
                                <asp:Button ID="btnNewCustomer" runat="server" Text="naivana saBaasad" CssClass="createbtn"
                                    OnClick="btnNewCustomer_Click" ClientIDMode="Static" />
                                <asp:DropDownList ID="ddlPager" runat="server" OnSelectedIndexChanged="ddlPager_SelectedIndexChanged"
                                    AutoPostBack="true" CssClass="acc_page_count_txt">
                                    <asp:ListItem Selected="True" Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="grid" style="margin-top: 10px;">
                                <asp:GridView ID="gvCustomer" runat="server" CellPadding="4" ForeColor="#333333"
                                    GridLines="None" OnRowEditing="gvCustomer_RowEditing" AutoGenerateColumns="false"
                                    AllowPaging="true" Width="100%" OnPageIndexChanging="gvCustomer_PageIndexChanging"
                                    CssClass="grid_header">
                                    <EmptyDataTemplate>
                                        Saunya roka^D- saapaDlao
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="lHkkln dzekad">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("CustomerId") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblCustomerCode" runat="server" Text='<%# Eval("CustomerCode") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="lHkklnkpk izdkj">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerType" runat="server" Text='<%# Eval("CustomerTypeName")  %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="lHkklnkps uko">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("FirstName") + " " + Eval("LastName")  %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="lHkklnkps xako">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerVillage" runat="server" Text='<%# Eval("VillageId") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="lHkklnkpk ftYgk">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerDistrict" runat="server" Text='<%# Eval("DistrictName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qksu uacj">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="cnyk">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnEditCustomer" runat="server" CommandArgument='<%# Eval("CustomerId") %>'
                                                    CommandName="Edit" ImageUrl="~/images/Edit.gif" ClientIDMode="Static" />
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
                        <div id="divNewCusotmerPopup" runat="server" style="display: block; margin-top: 5px;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <div class="collepsiblebody">
                                            <div class="form_link">
                                                <a href="#" id="openAll" title="Open All">Open All</a> |<a href="#" id="closeAll"
                                                    title="Close all">Close All</a>
                                            </div>
                                            <!-- Section 1 -->
                                            <h3 class="page_collapsible" id="body-section1">
                                                saBaasadacaI maaihtaI <span></span>
                                            </h3>
                                            <div class="container">
                                                <div class="collepsiblecontent">
                                                    
                                                      <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                ba^Mk SaaKaa:
                                                            </label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlBankBranches" runat="server" CssClass="select">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvBankBranches" runat="server" ControlToValidate="ddlBankBranches"
                                                                InitialValue="" ErrorMessage="Please Select Bank Branch" Display="None" ValidationGroup="SaveCustomer"
                                                                Enabled="true"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                saBaasadacaa pa`kxar:</label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustomerType" runat="server" CssClass="select" OnSelectedIndexChanged="ddlCustomerType_SelectedIndexChanged"
                                                                AutoPostBack="true">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvCustomerType" runat="server" ControlToValidate="ddlCustomerType"
                                                                InitialValue="" ErrorMessage="Please Select Customer Type" Display="None" ValidationGroup="SaveCustomer"
                                                                Enabled="true"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>


                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                saBaasad k`xmaaMkx:
                                                            </label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerNo" runat="server" CssClass="date_input" MaxLength="10"
                                                               AutoPostBack="true"  OnTextChanged="txtCustomerNo_TextChanged" AutoComplete="off"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvCustomerNo" runat="server" ControlToValidate="txtCustomerNo"
                                                                ErrorMessage="Please Enter Customer Number" Display="None" ValidationGroup="SaveCustomer"
                                                                Enabled="true"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    
                                                   

                                                    <div class="name_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                saBaasadacao naava:
                                                            </label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlCustomernamePrefix" runat="server" CssClass="select" Width="100px">
                                                                            <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                            <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                            <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvCustomernamePrefix" runat="server" ControlToValidate="ddlCustomernamePrefix"
                                                                            InitialValue="" ErrorMessage="Please Select Prefix" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCusotmerFirstname" runat="server" CssClass="short_input" MaxLength="30"
                                                                            AutoComplete="off"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvCusotmerFirstname" runat="server" ControlToValidate="txtCusotmerFirstname"
                                                                            ErrorMessage="Please Enter User Fristname" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustomerMiddlename" runat="server" CssClass="short_input" MaxLength="30"
                                                                            AutoComplete="off"></asp:TextBox>
                                                                        <%--asp:RequiredFieldValidator ID="CustomerMiddlename" runat="server" ControlToValidate="txtCustomerMiddlename"
                                                                            ErrorMessage="Please Enter User Middlename" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustomerLastname" runat="server" CssClass="short_input" MaxLength="30"
                                                                            AutoComplete="off"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvCustomerLastname" runat="server" ControlToValidate="txtCustomerLastname"
                                                                            ErrorMessage="Please Enter User Lastname" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
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
                                                                pattaa:</label>&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCusotomerAddress" runat="server" CssClass="input" MaxLength="200"
                                                                AutoComplete="off"></asp:TextBox>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                mauLgaava:</label>
                                                            <span style="font-weight: bold; color: Red;">*</span> &nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                        <asp:TextBox ID="ddlCustomerVillage" runat="server" CssClass="input" MaxLength="200"
                                                                AutoComplete="off"></asp:TextBox>

                                                            <%--<asp:DropDownList ID="ddlCustomerVillage" runat="server" CssClass="select">
                                                            </asp:DropDownList>--%>
                                                            <asp:RequiredFieldValidator ID="rfvCustomerVillage" runat="server" ControlToValidate="ddlCustomerVillage"
                                                                InitialValue="" ErrorMessage="Please Select Village" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        

                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                ijalha:</label>&nbsp;<span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustomerDistrict" runat="server" CssClass="select" 
                                                               AutoPostBack="true"  onselectedindexchanged="ddlCustomerDistrict_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvCustomerDistrict" runat="server" ControlToValidate="ddlCustomerDistrict"
                                                                InitialValue="" ErrorMessage="Please Select District" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                taalaukxa:
                                                            </label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustomerTaluka" runat="server" CssClass="select">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvCustomerTaluka" runat="server" ControlToValidate="ddlCustomerTaluka"
                                                                InitialValue="" ErrorMessage="Please Select Taluka" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                paaosT:</label>&nbsp;&nbsp;&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerPinCode" runat="server" CssClass="input" MaxLength="50"
                                                                AutoComplete="off"></asp:TextBox>
                                                            <%--<asp:RegularExpressionValidator ID="revCustomerPinCode" runat="server" ControlToValidate="txtCustomerPinCode"
                                                                Display="None" ErrorMessage="Please Enter only numeric pincode" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^(0|[1-9][0-9]*)$" Enabled="true"></asp:RegularExpressionValidator>--%>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                pa^nakxaD-:</label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerPanCard" runat="server" CssClass="date_input" MaxLength="10"
                                                                AutoComplete="off"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvCustomerPanCard" runat="server" ControlToValidate="txtCustomerPanCard"
                                                                ErrorMessage="Please Enter PanCard" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                             <asp:RegularExpressionValidator ID="revCustomerPanCard" runat="server" ControlToValidate="txtCustomerPanCard"
                                                                Display="None" ErrorMessage="Please Enter PanCard" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^([a-zA-Z0-9]*)$"></asp:RegularExpressionValidator>
                                                     
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                janmataarIKa:
                                                            </label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerDOB" runat="server" MaxLength="10" onChange="SetCustomerRetirementDate(this,696);NumericsOnly(this,event);"
                                                                onkeypress="return NumericsOnly(this,event);" CssClass="date_input" AutoComplete="off"></asp:TextBox>
                                                            <asp:ImageButton ID="ibtnCustomerDOB" runat="server" ImageUrl="~/images/calendar.png"
                                                                ToolTip="Please Select Date" />
                                                            <AjaxToolkit:CalendarExtender ID="calextCustomerDOB" runat="server" TargetControlID="txtCustomerDOB"
                                                                PopupButtonID="ibtnCustomerDOB" Format="dd/MM/yyyy">
                                                            </AjaxToolkit:CalendarExtender>
                                                           <%-- <asp:RequiredFieldValidator ID="rfvCustomerDOB" runat="server" ControlToValidate="txtCustomerDOB"
                                                                ErrorMessage="Please Enter Date Of Birth" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator ID="revCustomerDOB" runat="server" ControlToValidate="txtCustomerDOB"
                                                                ErrorMessage="Date format should be DD/MM/YYYY" Display="None" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                                                                ValidationGroup="SaveCustomer" Enabled="true"></asp:RegularExpressionValidator>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                pagaar:</label>&nbsp;&nbsp;&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerSalary" runat="server" CssClass="date_input" MaxLength="8"
                                                                onkeypress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                                AutoComplete="off"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revCustomerSalary" runat="server" ControlToValidate="txtCustomerSalary"
                                                                Display="None" ErrorMessage="Enter numerics only in this field." ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^[1-9]\d*(\.\d+)?$" Enabled="true"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <%--<div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                kalaavaQaI:</label>&nbsp;&nbsp;&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustTotalYearOfService" runat="server" CssClass="input" MaxLength="50" AutoComplete="off"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revCustTotalYearOfService" runat="server" ControlToValidate="txtCustTotalYearOfService"
                                                                Display="None" ErrorMessage="Please Enter only numeric pincode" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^(0|[1-9][0-9]*)$" Enabled="true"></asp:RegularExpressionValidator>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                naaokrI vaYa-:</label><span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustEmploymentYear" runat="server" MaxLength="50" CssClass="date_input" AutoComplete="off"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revCustEmploymentYear" runat="server" ControlToValidate="txtCustEmploymentYear"
                                                                Display="None" ErrorMessage="Please Enter only numeric pincode" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^(0|[1-9][0-9]*)$" Enabled="false"></asp:RegularExpressionValidator>
                                                            <asp:ImageButton ID="ibtnCustEmploymentYear" runat="server" ImageUrl="~/images/calendar.png" />
                                                            <AjaxToolkit:CalendarExtender ID="calextCustEmploymentYear" runat="server" TargetControlID="txtCustEmploymentYear"
                                                                PopupButtonID="ibtnCustEmploymentYear" Format="dd/MM/yyyy">
                                                            </AjaxToolkit:CalendarExtender>
                                                        </div>
                                                    </div>--%>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                naaokrI laagaNyaacaI taarIKa:</label><span style="font-weight: bold; color: Red;
                                                                    font-family: Arial;">*</span>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustEmploymentYear" runat="server" MaxLength="50" onChange="NumericsOnly(this,event);"
                                                                CssClass="date_input" onkeypress="return NumericsOnly(this,event);" AutoComplete="off"></asp:TextBox>
                                                            <asp:ImageButton ID="ibtnCustEmploymentYear" runat="server" ImageUrl="~/images/calendar.png" />
                                                            <AjaxToolkit:CalendarExtender ID="calextCustEmploymentYear" runat="server" TargetControlID="txtCustEmploymentYear"
                                                                PopupButtonID="ibtnCustEmploymentYear" Format="dd/MM/yyyy">
                                                            </AjaxToolkit:CalendarExtender>
                                                            <%--<asp:RequiredFieldValidator ID="rfvCustEmploymentYear" runat="server" ControlToValidate="txtCustEmploymentYear"
                                                                ErrorMessage="Please Enter Employear Date" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator ID="revCustEmploymentYear" runat="server" ControlToValidate="txtCustEmploymentYear"
                                                                ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                                                                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                                                                ValidationGroup="SaveCustomer" Enabled="true"></asp:RegularExpressionValidator>
                                                            <%--<asp:CompareValidator ID="CompareValCustEmploymentYear" runat="server" ControlToCompare="txtCustomerDOB"
                                                                ControlToValidate="txtCustEmploymentYear" ErrorMessage="Employment date should not be less than Birth Date"
                                                                Operator="GreaterThan" Type="Date" ValueToCompare="<%= txtCustomerDOB.Text.ToShortString() %>"
                                                                ValidationGroup="SaveCustomer" Display="None"></asp:CompareValidator>--%>
                                                        </div>
                                                        <%-- <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                saBaasad vaYa-:</label><span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerYear" runat="server" CssClass="input" MaxLength="50" AutoComplete="off"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revCustomerYear" runat="server" ControlToValidate="txtCustomerYear"
                                                                Display="None" ErrorMessage="Please Enter only numeric pincode" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^(0|[1-9][0-9]*)$" Enabled="true"></asp:RegularExpressionValidator>
                                                        </div>--%>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                [-maola:</label>&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerEmail" runat="server" CssClass="date_input" MaxLength="50"
                                                                AutoComplete="off"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revCusotmerEamil" runat="server" ControlToValidate="txtCustomerEmail"
                                                                Display="None" ErrorMessage="Please Enter Correct Email" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                saovaainavaRttaIcaI taarIKa:</label><span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustRetirementDate" runat="server" MaxLength="50" CssClass="date_input"
                                                                onkeypress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                                AutoComplete="off"></asp:TextBox>
                                                            <asp:ImageButton ID="imgCustRetirementDate" runat="server" ImageUrl="~/images/calendar.png" />
                                                            <AjaxToolkit:CalendarExtender ID="ceCustRetirementDate" runat="server" TargetControlID="txtCustRetirementDate"
                                                                PopupButtonID="imgCustRetirementDate" Format="dd/MM/yyyy">
                                                            </AjaxToolkit:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="rfvCustRetirementDate" runat="server" ControlToValidate="txtCustRetirementDate"
                                                                ErrorMessage="Please Enter Customer Retirement Date" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="revCustRetirementDate" runat="server" ControlToValidate="txtCustRetirementDate"
                                                                ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                                                                ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                                                                ValidationGroup="SaveCustomer" Enabled="true"></asp:RegularExpressionValidator>
                                                            <%--<asp:CompareValidator ID="CompareValCustRetirementDate" runat="server" ControlToCompare="txtCustomerDOB"
                                                                ControlToValidate="txtCustRetirementDate" ErrorMessage="Retirement date should not be less than Birth Date"
                                                                Operator="GreaterThan" Type="Date" ValueToCompare="<%= txtCustomerDOB.Text.ToShortString() %>"
                                                                ValidationGroup="SaveCustomer" Display="None"></asp:CompareValidator>
                                                            <asp:CompareValidator ID="CompareValCustRetirementDate1" runat="server" ControlToCompare="txtCustEmploymentYear"
                                                                ControlToValidate="txtCustRetirementDate" ErrorMessage="Retirement date should not be less than Employment Date"
                                                                Operator="GreaterThan" Type="Date" ValueToCompare="<%= txtCustEmploymentYear.Text.ToShortString() %>"
                                                                ValidationGroup="SaveCustomer" Display="None"></asp:CompareValidator>--%>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                Faona naMbar:</label><span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;</div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerPhoneNumber" runat="server" CssClass="date_input" MaxLength="10"
                                                                onkeypress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                                AutoComplete="off"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtCustomerPhoneNumber"
                                                                Display="None" ErrorMessage="Please Enter only numeric Phone number" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^([0-9]{10,})$"></asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="rfvCustomerPhoneNumber" runat="server" ControlToValidate="txtCustomerPhoneNumber"
                                                                ErrorMessage="Please Enter Phone number" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end Section 1 collapsible -->
                                            <!-- Section 2 -->
                                            <div id="divCustomerSchoolDetails" runat="server">
                                                <h3 class="page_collapsible" id="body-section2">
                                                    SaaLocaI maaihtaI<span></span>
                                                </h3>
                                                <div class="container">
                                                    <div class="collepsiblecontent">
                                                        <div class="form_row">
                                                            <div class="form_labeldiv">
                                                                <label class="form_label">
                                                                    SaaLocao naava:
                                                                </label>
                                                                <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                            </div>
                                                            <div class="form_inputdiv">
                                                                <asp:TextBox ID="txtCustomerSchoolname" runat="server" CssClass="input" MaxLength="50"
                                                                    AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvCustomerSchoolname" runat="server" ControlToValidate="txtCustomerSchoolname"
                                                                    ErrorMessage="kRpayaa SaaLocao naava Taka" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="form_labeldiv">
                                                                <label class="form_label">
                                                                    ijalha:
                                                                </label>
                                                                <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                            </div>
                                                            <div class="form_inputdiv">
                                                                <asp:DropDownList ID="ddlCusotmerSchoolDistrict" runat="server" 
                                                                    CssClass="select" AutoPostBack="true"
                                                                    onselectedindexchanged="ddlCusotmerSchoolDistrict_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvCustomerSchoolDistrict" runat="server" ControlToValidate="ddlCusotmerSchoolDistrict"
                                                                    InitialValue="" ErrorMessage="Please Select School District" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                            </div>
                                                           
                                                        </div>
                                                        <div class="form_row">
                                                             <div class="form_labeldiv">
                                                                <label class="form_label">
                                                                    taalauka:
                                                                </label>
                                                                <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                            </div>
                                                            <div class="form_inputdiv">
                                                                <asp:DropDownList ID="ddlCustomerSchoolTaluka" runat="server" CssClass="select">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvCustomerSchoolTaluka" runat="server" ControlToValidate="ddlCustomerSchoolTaluka"
                                                                    InitialValue="" ErrorMessage="Please Select School Taluka" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="form_labeldiv">
                                                                <label class="form_label">
                                                                    paaosT:</label>&nbsp;&nbsp;&nbsp;
                                                            </div>
                                                            <div class="form_inputdiv">
                                                                <asp:TextBox ID="txtCustomerSchoolPinCode" runat="server" MaxLength="50" CssClass="input"
                                                                    AutoComplete="off"></asp:TextBox>
                                                                <%--<asp:RegularExpressionValidator ID="revCustomerSchoolPinCode" runat="server" ControlToValidate="txtCustomerSchoolPinCode"
                                                                Display="None" ErrorMessage="Please Enter only numeric Pincode" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^(0|[1-9][0-9]*)$" Enabled="true"></asp:RegularExpressionValidator>--%>
                                                                <%--<asp:RequiredFieldValidator ID="rfvSchoolPinCode" runat="server" ControlToValidate="txtCustomerSchoolPinCode"
                                                                    ErrorMessage="Please Enter School PinCode" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end Section 2 collapsible -->
                                            <!-- Section 3 -->
                                            <h3 class="page_collapsible" id="body-section3">
                                                vaarsadaracaI maaihtaI<span></span>
                                            </h3>
                                            <div class="container">
                                                <div class="collepsiblecontent">
                                                    <div class="name_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                vaarsadaracao naava:
                                                            </label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlCustNomineePrefix" runat="server" CssClass="select" Width="100px">
                                                                            <asp:ListItem Text="fuoMk" Value=""></asp:ListItem>
                                                                            <asp:ListItem Text="Jh" Value="Jh"></asp:ListItem>
                                                                            <asp:ListItem Text="Jherh" Value="Jherh"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvCustomerNomineePrefix" runat="server" ControlToValidate="ddlCustNomineePrefix"
                                                                            InitialValue="" ErrorMessage="Please Select Nominee Prefix" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustnomineeFirstname" runat="server" CssClass="short_input" MaxLength="50"
                                                                            AutoComplete="off"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvCustnomineeFirstname" runat="server" ControlToValidate="txtCustnomineeFirstname"
                                                                            ErrorMessage="Please Enter Nominee Firstname" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustnomineeMiddlename" runat="server" CssClass="short_input"
                                                                            MaxLength="50" AutoComplete="off"></asp:TextBox>
                                                                       <%-- <asp:RequiredFieldValidator ID="rfvCustnomineeMiddlename" runat="server" ControlToValidate="txtCustnomineeMiddlename"
                                                                            ErrorMessage="Please Enter Nominee Middlename" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtCustnomineeLastname" runat="server" CssClass="short_input" MaxLength="50"
                                                                            AutoComplete="off"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvCustnomineeLastname" runat="server" ControlToValidate="txtCustnomineeLastname"
                                                                            ErrorMessage="Please Enter Nominee Lastname" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
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
                                                                pattaa:</label>&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustNomineeAddress" runat="server" CssClass="input" MaxLength="200"
                                                                AutoComplete="off"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator ID="rfvCustNomineeAddress" runat="server" ControlToValidate="txtCustNomineeAddress"
                                                                ErrorMessage="Please Enter Nominee Address" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>--%>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                mauLgaava:</label>&nbsp;&nbsp;&nbsp; <font face="arial" style="font-weight: bold;
                                                                    color: Red;">*</font>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">

                                                        <asp:TextBox ID="ddlCustNomineeVillage" runat="server" CssClass="input" MaxLength="200"
                                                                AutoComplete="off"></asp:TextBox>

                                                          <%--  <asp:DropDownList ID="ddlCustNomineeVillage" runat="server" CssClass="select">
                                                            </asp:DropDownList>--%>
                                                           <%-- <asp:RequiredFieldValidator ID="rfvCustNomineeVillage" runat="server" ControlToValidate="ddlCustNomineeVillage"
                                                                InitialValue="" ErrorMessage="Please Select Nominee Village" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator> --%>         
                                               </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                ijalha:
                                                            </label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustNomineeDistrict" runat="server" CssClass="select" 
                                                             AutoPostBack="true"  onselectedindexchanged="ddlCustNomineeDistrict_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvCustNomineeDistrict" runat="server" ControlToValidate="ddlCustNomineeDistrict"
                                                                InitialValue="" ErrorMessage="Please Select Nominee District" Display="None"
                                                                ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                taalauka:
                                                            </label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustNomineeTaluka" runat="server" CssClass="select">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvCustNomineeTaluka" runat="server" ControlToValidate="ddlCustNomineeTaluka"
                                                                InitialValue="" ErrorMessage="Please Enter Nominee Taluka" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                paaosT:
                                                            </label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustNomineePinCode" runat="server" CssClass="input" MaxLength="50"
                                                                AutoComplete="off"></asp:TextBox>
                                                            <%--<asp:RegularExpressionValidator ID="revCustNomineePinCode" runat="server" ControlToValidate="txtCustNomineePinCode"
                                                                Display="None" ErrorMessage="Please Enter only numeric pincode" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^(0|[1-9][0-9]*)$" Enabled="true"></asp:RegularExpressionValidator>--%>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                Faona naMbar:
                                                            </label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustNomineePhonenumber" runat="server" CssClass="date_input"
                                                                MaxLength="10" onkeypress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                                AutoComplete="off"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvCustNomineePhoneNumber" runat="server" ControlToValidate="txtCustNomineePhonenumber"
                                                                ErrorMessage="Please Enter Nominee Phone number" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="revCustNomineePhonenumber" runat="server" ControlToValidate="txtCustNomineePhonenumber"
                                                                Display="None" ErrorMessage="Please Enter only numeric Phone number" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^([0-9]{10,})$"></asp:RegularExpressionValidator>
                                                      
                                                       
                                                        </div>
                                                    </div>
                                                    <div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                vyavasaaya:
                                                            </label>
                                                            &nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustNomineeOccupation" runat="server" CssClass="input" MaxLength="50"
                                                                AutoComplete="off"></asp:TextBox>
                                                        </div>
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                vaarsadaracao naatao:</label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustRelationWithNominee" runat="server" CssClass="input" AutoComplete="off"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvCustRelationWithNominee" runat="server" ControlToValidate="txtCustRelationWithNominee"
                                                                ErrorMessage="Please Enter Relation with Nominee" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end Section 3 collapsible -->
                                            <!-- Section 4 -->
                                            <div id="divCustomerAccountDetails" runat="server">
                                                <h3 class="page_collapsible" id="body-section4">
                                                    Kaatao maaihtaI <span></span>
                                                </h3>
                                                <div class="container">
                                                    <div class="collepsiblecontent">
                                                        <div class="form_row">
                                                            <div class="form_labeldiv">
                                                                <label class="form_label">
                                                                    Kaatao k`xmaaMkx: <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                                </label>
                                                            </div>
                                                            <div class="form_inputdiv">
                                                                <asp:TextBox ID="txtCustomerAccNumber" runat="server" CssClass="input" MaxLength="100"
                                                                    AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvCustomerAccNumber" runat="server" ControlToValidate="txtCustomerAccNumber"
                                                                    ErrorMessage="Please Enter Account Number" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="form_labeldiv">
                                                                <label class="form_label">
                                                                    Kaatao {GaDNyaacaI taarIKa:
                                                                </label>
                                                            </div>
                                                            <div class="form_inputdiv">
                                                                <asp:TextBox ID="txtCustomerAccOpenDate" runat="server" MaxLength="10" CssClass="date_input"
                                                                    onkeypress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"  AutoComplete="off"></asp:TextBox>
                                                                <asp:ImageButton ID="ibtnCustomerAccOpenDate" runat="server" ImageUrl="~/images/calendar.png" />
                                                                <AjaxToolkit:CalendarExtender ID="calextCustomerAccOpenDate" runat="server" TargetControlID="txtCustomerAccOpenDate"
                                                                    PopupButtonID="ibtnCustomerAccOpenDate" Format="yyyy/MM/dd">
                                                                </AjaxToolkit:CalendarExtender>
                                                                <%--<asp:RegularExpressionValidator ID="revCustomerAccOpenDate" runat="server" ControlToValidate="txtCustomerAccOpenDate"
                                                                    ErrorMessage="taarIKa ‘idvasa | maihnaa | vaYa-‘ yaa fa^rma^TmaQyao Taka" Display="None"
                                                                    ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$"
                                                                    ValidationGroup="SaveCustomer" Enabled="true"></asp:RegularExpressionValidator>--%>
                                                            </div>
                                                        </div>
                                                        <div class="form_row">
                                                            <%--<div class="form_labeldiv">
                                                            <label class="form_label">
                                                                Kaatyaacaa pa`kxar:
                                                            </label>
                                                            <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:DropDownList ID="ddlCustomerAccType" runat="server" CssClass="select">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvCustomerAccType" runat="server" ControlToValidate="ddlCustomerAccType"
                                                                InitialValue="" ErrorMessage="Please Select Account Type" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                        </div>--%>
                                                            <div class="form_labeldiv">
                                                                <label class="form_label">
                                                                    Kaatao {GaaDNyaacaI r@kxma:
                                                                </label>
                                                                <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                            </div>
                                                            <div class="form_inputdiv">
                                                                <asp:TextBox ID="txtCustomerOpeningBalance" runat="server" CssClass="date_input"
                                                                    MaxLength="8" onkeypress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                                    AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvCustomerOpeningBalance" runat="server" ControlToValidate="txtCustomerOpeningBalance"
                                                                    ErrorMessage="Please Enter Opening balance" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="revCustomerOpeningBalance" runat="server" ControlToValidate="txtCustomerOpeningBalance"
                                                                    Display="None" ErrorMessage="Please Enter only numeric amount" ValidationGroup="SaveCustomer"
                                                                    ValidationExpression="^[1-9]\d*(\.\d+)?$" Enabled="true"></asp:RegularExpressionValidator>
                                                            </div>
                                                            <div class="form_labeldiv">
                                                                <label class="form_label">
                                                                    SaoArcaI r@kxma:</label>
                                                                <span style="font-weight: bold; color: Red; font-family: Arial;">*</span>&nbsp;
                                                            </div>
                                                            <div class="form_inputdiv">
                                                                <asp:TextBox ID="txtCustomerShareAmt" runat="server" CssClass="date_input" MaxLength="8"
                                                                    onkeypress="return NumericsOnly(this,event);" onChange="NumericsOnly(this,event);"
                                                                    AutoComplete="off"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvCustomerShareAmt" runat="server" ControlToValidate="txtCustomerShareAmt"
                                                                    ErrorMessage="Please Enter Share Amount" Display="None" ValidationGroup="SaveCustomer"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="revCustomerShareAmt" runat="server" ControlToValidate="txtCustomerShareAmt"
                                                                    Display="None" ErrorMessage="Please Enter only numeric amount" ValidationGroup="SaveCustomer"
                                                                    ValidationExpression="^[1-9]\d*(\.\d+)?$" Enabled="true"></asp:RegularExpressionValidator>
                                                            </div>
                                                        </div>
                                                        <div class="form_row">
                                                            <%--<div class="form_labeldiv">
                                                            <label class="form_label">
                                                                kayamainaQaI:
                                                            </label>
                                                            &nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerKayamnidhiBal" runat="server" CssClass="input" MaxLength="50" AutoComplete="off"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revCustomerKayamnidhiBal" runat="server" ControlToValidate="txtCustomerKayamnidhiBal"
                                                                Display="None" ErrorMessage="Please Enter only numeric amount" ValidationGroup="SaveCustomer"
                                                                ValidationExpression="^\d{1,7}(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                                        </div>--%>
                                                        </div>
                                                        <%--<div class="form_row">
                                                        <div class="form_labeldiv">
                                                            <label class="form_label">
                                                                iSallakx:</label>&nbsp;&nbsp;&nbsp;
                                                        </div>
                                                        <div class="form_inputdiv">
                                                            <asp:TextBox ID="txtCustomerAccountBal" runat="server" CssClass="input" MaxLength="50" AutoComplete="off"></asp:TextBox>
                                                        </div>
                                                    </div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end Section 4 collapsible -->
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <div class="form_btn_div" style="width: 100%;">
                                            <asp:Button ID="btnSaveCustomer" runat="server" Text="jatana kra" CssClass="loginbtn"
                                                OnClientClick="ValidatePageControl('SaveCustomer');ValidateCustomer('SaveCustomer');"
                                                OnClick="btnSaveCustomer_Click" ValidationGroup="SaveCustomer" />
                                            <asp:Button ID="btnCancelSaveCusotmer" runat="server" Text="r_ kra" CssClass="loginbtn"
                                                OnClick="btnCancelSaveCusotmer_Click" />
                                            <%--<asp:ValidationSummary ID="vsSaveCustomer" runat="server" DisplayMode="BulletList" ShowMessageBox="true"
                                                ShowSummary="true" ValidationGroup="SaveCustomer" Visible="false"/>--%>
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
</asp:Content>
