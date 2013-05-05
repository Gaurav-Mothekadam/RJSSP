<%@ Page Title=".:: CashBookEntry ::." Language="C#" MasterPageFile="~/Raigad.Master"
    AutoEventWireup="true" CodeBehind="CashBookEntry.aspx.cs" Inherits="Raigad.Forms.CashBookEntry" %>

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

        function HideShowBankDetails(IsBank) {
            var ctrlrfvTxtBank = document.getElementById('<%= rfvtxtBank.ClientID%>');
            var ctrlrfvTxtChequeno = document.getElementById('<%= rfvtxtChequeno.ClientID%>');

            var divBank = document.getElementById("DivBank");
            var divChequeno = document.getElementById("DivChequeno");

            var chkCash = document.getElementById('<%= chkCash.ClientID %>');
            var chkCheque = document.getElementById('<%= chkCheque.ClientID %>');

            if (IsBank == "1") {
                chkCash.checked = false;
                chkCheque.checked = true;
                divBank.style.display = "block";
                divChequeno.style.display = "block";
                ValidatorEnable(ctrlrfvTxtBank, true);
                ValidatorEnable(ctrlrfvTxtChequeno, true);
            }
            else {
                chkCash.checked = true;
                chkCheque.checked = false;
                divBank.style.display = "none";
                divChequeno.style.display = "none";
                ValidatorEnable(ctrlrfvTxtBank, false);
                ValidatorEnable(ctrlrfvTxtChequeno, false);
            }
        } 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upCashBookEntryMain" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                Sys.Application.add_load(LoadScript);
            </script>
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblCashbookMessage" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <div id="divEXPGrid" runat="server" style="display: block;" class="acc_grid_start">
                            <div class="acc_search">
                                <div class="acc_search_top">
                                    SaaoQaa
                                </div>
                                <div class="acc_search_bg">
                                    <div class="acc_search_text">
                                        <label class="grey_label">
                                            AapaNa paavataI k`xmaaMk vaapar}na saca- kr} Saktaata.
                                        </label>
                                    </div>
                                    <div class="acc_search_subdiv">
                                        <asp:Panel ID="pnlEXPSearch" runat="server" DefaultButton="btnSearchEXP">
                                            <div class="acc_search_textdiv">
                                                <asp:DropDownList ID="ddlEXPSearch" runat="server" CssClass="short_select" Width="125px">
                                                    <asp:ListItem Selected="True" Text="i;kZ; fuoMk" Value=""></asp:ListItem>
                                                    <asp:ListItem Value="VoucherNumber" Text=" ikorh dzekad"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvEXPSearch" runat="server" ControlToValidate="ddlEXPSearch"
                                                    InitialValue="" ErrorMessage="Please Select Search Type" Display="None" ValidationGroup="CashBookSearch"
                                                    Enabled="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="acc_search_inputdiv">
                                                <asp:TextBox ID="txtSearchEXP" runat="server" CssClass="input" EnableViewState="false"></asp:TextBox>
                                            </div>
                                            <div>
                                                <asp:Button ID="btnSearchEXP" runat="server" Text="SaaoQaa" CssClass="searchbtn"
                                                    OnClientClick="ValidatePageControl();ValidateCustomer('CashBookSearch');" ValidationGroup="CashBookSearch"
                                                    OnClick="btnSearchEXP_Click" />
                                                <asp:Button ID="btnClearEXP" runat="server" Text="i@laAr" CssClass="searchbtn" OnClick="btnClearEXP_Click" />
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 75px;">
                                <asp:Button ID="btnNewCashBook" runat="server" Text="naivana k^ Sabauk naaoMd" CssClass="createbtn"
                                    OnClick="btnNewCashBook_Click" ClientIDMode="Static" />
                                <asp:DropDownList ID="ddlEXPPager" runat="server" OnSelectedIndexChanged="ddlEXPPager_SelectedIndexChanged"
                                    AutoPostBack="true" CssClass="acc_page_count_txt">
                                    <asp:ListItem Selected="True" Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="grid" style="margin-top: 10px;">
                                <asp:GridView ID="gvCashBook" runat="server" CellPadding="4" ForeColor="#333333"
                                    GridLines="None" AutoGenerateColumns="false" AllowPaging="true" Width="100%"
                                    CssClass="grid_header" OnPageIndexChanging="gvCashBook_PageIndexChanging" OnRowEditing="gvCashBook_RowEditing"
                                    OnRowDeleting="gvCashBook_RowDeleting" 
                                    onrowdatabound="gvCashBook_RowDataBound">
                                    <EmptyDataTemplate>
                                        Saunya roka^D- saapaDlao
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="ikorh dzekad">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExpenditureId" runat="server" Text='<%# Eval("ExpenditureId") %>'></asp:Label>
                                                <asp:Label ID="lblExpenditureTypeId" runat="server" Text='<%# Eval("ExpenditureTypeId") %>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblVoucherNumber" runat="server" Text='<%# Eval("VoucherNumber") %>'
                                                    Visible="false"> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="[kpkZpk ri”khy">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExpenditureTypeName" runat="server" Text='<%# Eval("ExpenditureTypeName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="fnukad" ControlStyle-CssClass="grid_numeric_item">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExpenditureDate" runat="server" Text='<%# Eval("ExpenditureDate") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="jDde">
                                            <ItemTemplate>
                                                <asp:Literal ID="litExpenditureAmount" runat="server" Text='<%# string.Format("{0:0.00}", Eval("ExpenditureAmount")) %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="eqnr Bsohph fnuakd" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIsPaidByCash" runat="server" Visible="false" Text='<%# Eval("IsPaidByCash") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="eqnr Bsohph fnuakd" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIsPaidByCheque" runat="server" Visible="false" Text='<%# Eval("IsPaidByCheque") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="eqnr Bsohph fnuakd" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBankName"  Visible="false" runat="server" Text='<%# Eval("BankName") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="eqnr Bsohph fnuakd" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeNumber" runat="server" Text='<%# Eval("ChequeNumber") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="eqnr Bsohph fnuakd" Visible="false" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblExpanditureDescription" Visible="false" runat="server" Text='<%# Eval("ExpanditureDescription") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="}kjk vf/kd`r" ControlStyle-CssClass="form_label_kruti">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApprovedBy"  runat="server" Text='<%# Eval("ApprovedBy") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                           <asp:TemplateField HeaderText="jks[k@psd" ControlStyle-CssClass="form_label_kruti" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblPaymentStatus"  runat="server" Text=""> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="cnyk">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnEditCashBook" runat="server" CommandArgument='<%# Eval("VoucherNumber") %>'
                                                    CommandName="Edit" ImageUrl="~/images/Edit.gif" ClientIDMode="Static" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="cnyk">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnDeleteCashBook" runat="server" CommandArgument='<%# Eval("VoucherNumber") %>'
                                                    CommandName="Delete" ImageUrl="~/images/cross_small.png" ClientIDMode="Static"
                                                    OnClientClick='return confirm("Are you sure do you want to delete?")' />
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
                        <div id="divNewEXPPopup" runat="server" style="display: none; margin-top: 5px;">
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
                                            k^xSabaukx naaoMd<span></span>
                                        </h3>
                                        <div class="container">
                                            <div class="collepsiblecontent">
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            paavataI k`xmaaMk :</label><font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;</div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtVoucherNo" runat="server" CssClass="date_input" MaxLength="100" EnableViewState="false"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvVoucherNo" runat="server" ControlToValidate="txtVoucherNo"
                                                            InitialValue="" ErrorMessage="Please Enter Voucher No" Display="None" ValidationGroup="SaveCashBookEntries"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            idnaaMk :</label><font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;</div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtDate" runat="server" MaxLength="10" onChange="NumericsOnly(this,event);"
                                                            onkeypress="return NumericsOnly(this,event);" CssClass="date_input" EnableViewState="false"></asp:TextBox>
                                                        <asp:ImageButton ID="ibtnDate" runat="server" ImageUrl="~/images/calendar.png" ToolTip="Please Select Date" />
                                                        <AjaxToolkit:CalendarExtender ID="calextDate" runat="server" TargetControlID="txtDate"
                                                            PopupButtonID="ibtnDate" Format="yyyy/MM/dd">
                                                        </AjaxToolkit:CalendarExtender>
                                                        <asp:RequiredFieldValidator ID="rfvibtnDate" runat="server" ControlToValidate="txtDate"
                                                            InitialValue="" ErrorMessage="Please Select Date" Display="None" ValidationGroup="SaveCashBookEntries"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            rkkma:</label><font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;</div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtAmount" runat="server" onkeypress="return NumericsOnly(this,event);"
                                                            CssClass="date_input" MaxLength="100"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvtxtAmount" runat="server" ControlToValidate="txtAmount"
                                                            InitialValue="" ErrorMessage="Please Enter Amount" Display="None" ValidationGroup="SaveCashBookEntries"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            Kacaa-caa tapaSaIla :</label><font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;</div>
                                                    <div class="form_inputdiv">
                                                        <asp:DropDownList ID="ddlExpanditureType" runat="server" CssClass="select">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvExpanditureType" runat="server" ControlToValidate="ddlExpanditureType"
                                                            InitialValue="" ErrorMessage="Please Select Expanditure Type" Display="None"
                                                            ValidationGroup="SaveCashBookEntries"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            Wara AiQakRxta :</label>
                                                        <font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;</div>
                                                    <div class="inputdiv_english">
                                                        <asp:TextBox ID="txtAuthorizedby" runat="server" CssClass="input" MaxLength="100"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvtxtAuthorizedby" runat="server" ControlToValidate="txtAuthorizedby"
                                                            InitialValue="" ErrorMessage="Please Enter Description" Display="None" ValidationGroup="SaveCashBookEntries"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:CheckBox ID="chkCash" Text="raoKa" onclick="HideShowBankDetails('0')" runat="server" CssClass="form_label" />
                                                        <asp:CheckBox ID="chkCheque" Text="caokx" onclick="HideShowBankDetails('1')" runat="server" CssClass="form_label" />
                                                    </div>
                                                </div>
                                                <div id="DivBank" class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            ba^Mkoxcao naava :</label><font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;</div>
                                                    <div class="inputdiv_english">
                                                        <asp:TextBox ID="txtBank" runat="server" CssClass="input" MaxLength="100"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvtxtBank" runat="server" ControlToValidate="txtBank"
                                                            InitialValue="" ErrorMessage="Please Enter Bank" Display="None" ValidationGroup="SaveCashBookEntries"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div id="DivChequeno" class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            caokx naMbar :</label><font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;</div>
                                                    <div class="inputdiv_english">
                                                        <asp:TextBox ID="txtChequeno" runat="server" onkeypress="return NumericsOnly(this,event);"
                                                            CssClass="input" MaxLength="100"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvtxtChequeno" runat="server" ControlToValidate="txtChequeno"
                                                            InitialValue="" ErrorMessage="Please Enter Description" Display="None" ValidationGroup="SaveCashBookEntries"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form_row">
                                                    <div class="form_labeldiv">
                                                        <label class="form_label">
                                                            spaiYTkxrNa :</label><font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;
                                                    </div>
                                                    <div class="form_inputdiv">
                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="input" MaxLength="100"
                                                            AutoComplete="off" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvtxtDescription" runat="server" ControlToValidate="txtDescription"
                                                            InitialValue="" ErrorMessage="Please Enter Description" Display="None" ValidationGroup="SaveCashBookEntries"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <div class="form_btn_div" style="width: 100%;">
                                            <asp:Button ID="btnSave" runat="server" Text="jatana kra" CssClass="loginbtn" OnClick="btnSave_Click"
                                                OnClientClick="ValidatePageControl('SaveCashBookEntries');ValidateCustomer('SaveCashBookEntries');"
                                                ValidationGroup="SaveCashBookEntries" />
                                            <asp:Button ID="btnUpdate" runat="server" Text="jatana kra" OnClientClick="return confirm('Are you sure you want to update this ?');"
                                                OnClick="btnUpdate_Click" Visible="false" CssClass="loginbtn" />
                                            <asp:Button ID="btnCancel" runat="server" Text="rdd kra" CssClass="loginbtn" OnClick="btnCancel_Click" />
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
