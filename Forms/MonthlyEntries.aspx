<%@ Page Title="" Language="C#" MasterPageFile="~/Raigad.Master" AutoEventWireup="true"
    CodeBehind="MonthlyEntries.aspx.cs" Inherits="Raigad.Forms.MonthlyEntries" %>

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
    <asp:UpdatePanel ID="upMonthlyEntryMain" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hdnCustomerId" runat="server" Value="" />
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblMonthlyEntryMessage" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <div id="divNewFDPopup" runat="server" style="display: block; margin-top: 5px;">
                            <table width="100%">
                                <tr>
                                    <td>
                                       <div class="form_head">	
	                                    <div class="form_head_top">
		                                    maaisak naaoMd
	                                    </div>

                                        <div class="form_bg">
	                                    <div class="form_bg_subdiv">
                                            <div class="form_row">
                                                    <div class="form_labeldiv">
                                                       <label class="form_label">
                                                            vaYa-:</label>
                                                            <font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;
                                                    </div>
                                                    <div class="small_input_textdiv">
                                                        <asp:DropDownList ID="ddlyear" runat="server" CssClass="short_select">
                                   
                                                        </asp:DropDownList><asp:RequiredFieldValidator ID="rfvyear" runat="server" ControlToValidate="ddlyear"
                                                    InitialValue="" ErrorMessage="Please Select Year" Display="None" ValidationGroup="monthlyEntrySearch"
                                                    Enabled="true"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
                                                    </div>

                                                    <div class="small_input_label">
                                                         <label class="form_label">
                                                            maihnaa:
                                                            </label>
                                                            <font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;</div>
                                                  
                                                    <div class="small_input_textdiv">
                                                       <asp:DropDownList ID="ddlmonth" runat="server" CssClass="short_select">
                                                           </asp:DropDownList><asp:RequiredFieldValidator ID="rfvmonth" runat="server" ControlToValidate="ddlmonth"
                                                    InitialValue="" ErrorMessage="Please Select Month" Display="None" ValidationGroup="monthlyEntrySearch"
                                                    Enabled="true"></asp:RequiredFieldValidator>
                                                    </div>    
                                               </div>
                                                
                                            <div class="form_row">
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        saBaasad k`maaMk :</label><font face="arial" size="4" weight="bold" color="red">*</font>&nbsp;</div>
                                                <div class="form_inputdiv">
                                                    <asp:TextBox ID="txtCustomerNo" runat="server" onkeypress="return NumericsOnly(this,event);"
                                                        CssClass="short_input" MaxLength="100"></asp:TextBox>&nbsp;<asp:LinkButton ID="lnkOpenCustomerSearch"
                                                            runat="server" Text="saBaasad k`. SaaoQaa" ToolTip="saBaasad k`. SaaoQaa" OnClientClick="ValidatePageControl();ValidateCustomer('monthlyEntrySearch');"
                                                            OnClick="lnkOpenCustomerSearch_Click" ValidationGroup="monthlyEntrySearch">
                                                        </asp:LinkButton>
                                                </div>
                                            </div>
                                            <div class="form_row">
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        saBaasadacao naava :</label>&nbsp;</div>
                                                <div class="labeldiv">
                                                    <asp:Label ID="lblCustomerName" class="form_label_kruti" runat="server">
                                                    </asp:Label>
                                                </div>
                                            </div>
                                            <div class="form_row">
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        saBaasadacaa pa`kxar :</label>&nbsp;</div>
                                                <div class="labeldiv">
                                                    <asp:Label ID="lblCustomerType" class="form_label_kruti" runat="server">
                                                    </asp:Label></div>
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        kayamainaQaIcaI rkkxma:</label>&nbsp;</div>
                                                <div class="labeldiv">
                                                    <asp:Label ID="lblKayamNidhiBalance" class="form_label_english" runat="server">
                                                    </asp:Label></div>
                                            </div>
                                            <div class="form_row">
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        SaoyarsacaI rkkxma:</label>&nbsp;
                                                </div>
                                                <div class="labeldiv">
                                                    <asp:Label ID="lblbShareBalance" class="form_label_english" runat="server">
                                                    </asp:Label>
                                                </div>
                                                <div class="form_labeldiv">
                                                    <label class="form_label">
                                                        ekuxNa Kaatao rkkxma:</label>&nbsp;
                                                </div>
                                                <div class="labeldiv">
                                                    <asp:Label ID="lblAccountBalance" class="form_label_english" runat="server">
                                                    </asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                        </div>
                                        <div class="clear"></div>
                                        <div style="margin-top:10px;">
                                                 <asp:Button ID="btnNewMonthlyEntry" runat="server" Text="i@laAr" CssClass="searchbtn"
                                                ClientIDMode="Static" OnClick="btnNewMonthlyEntry_Click" />
                                            <asp:DropDownList ID="ddlMEPager" runat="server" AutoPostBack="true" CssClass="acc_page_count_txt"
                                                OnSelectedIndexChanged="ddlMEPager_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Text="10" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <asp:Panel ID="Panel1" runat="server" Style="display: block;">
                                            <table width="100%">
                                                <tr>
                                                    <td>
                                                        <div class="grid" style="margin-top: 10px;">
                                                            <asp:GridView ID="gvMonthlyEntry" runat="server" CellPadding="4" ForeColor="#333333"
                                                                GridLines="None" AutoGenerateColumns="false" AllowPaging="true" Width="100%"
                                                                CssClass="grid_header" OnRowDeleting="gvMonthlyEntry_RowDeleting" 
                                                                OnPageIndexChanging="gvMonthlyEntry_PageIndexChanging" 
                                                                onrowdatabound="gvMonthlyEntry_RowDataBound">
                                                                <EmptyDataTemplate>
                                                                    Saunya roka^D- saapaDlao
                                                                </EmptyDataTemplate>
                                                                <Columns>
                                                                      <asp:TemplateField HeaderText="fnuakd">
                                                                        <ItemTemplate>
                                                                           <asp:Label ID="lbldate" runat="server" Text='<%# Eval("NowDate") %>'> </asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="dzekad" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("stat") %>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("CustomerId") %>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblLoanId" runat="server" Text='<%# Eval("LoanId") %>'> </asp:Label>
                                                                            <asp:Label ID="lblRecurrenceDepositeId" runat="server" Text='<%# Eval("RecurrenceDepositeId") %>'> </asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="saBaasad k`maaMk"  Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCustomerCode" runat="server" Text='<%# Eval("CustomerCode") %>' > </asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Hkj.kk izdkj">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblEntryType" runat="server" Text='<%# Eval("EntryType") %>'> </asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Entry Balance"  Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Literal ID="litEntryBalance" runat="server" Text='<%# string.Format("{0:0.00}", Eval("EntryBalance")) %>' ></asp:Literal>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Hkj.kk jDde">
                                                                        <ItemTemplate>
                                                                            <asp:Literal ID="litEntryAmount" runat="server" Text='<%# string.Format("{0:0.00}", Eval("EntryAmount")) %>'></asp:Literal>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                                                    </asp:TemplateField>
                                                                     <asp:TemplateField HeaderText=";qtj">
                                                                        <ItemTemplate>
                                                                           <asp:Label ID="lbluser" runat="server" Text='<%# Eval("UserName") %>'> </asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="uksan djk">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="ibtnEditMonthlyEntry" runat="server" CommandArgument='<%# Eval("CustomerId") %>'
                                                                                CommandName="Delete" ImageUrl="~/images/Edit.gif" ClientIDMode="Static" OnClientClick='return confirm("Are you sure do you want to pay ?")' />
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
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
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
                    <uc:CustomerSearch ID="ucMECustomerSearch" runat="server" />
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
