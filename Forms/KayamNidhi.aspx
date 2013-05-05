<%@ Page Title=".:: KayamNidhi ::." Language="C#" MasterPageFile="~/Raigad.Master"
    AutoEventWireup="true" CodeBehind="KayamNidhi.aspx.cs" Inherits="Raigad.Forms.KayamNidhi" %>

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
    <asp:UpdatePanel ID="upKayamNidhiMain" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblKayamNidhiMessage" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <div id="divKayamNidhiCustGrid" runat="server" class="acc_grid_start">
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
                                            <asp:DropDownList ID="ddlCustomerKayamNidhiSearch" runat="server" CssClass="short_select"
                                                Width="125px">
                                                <asp:ListItem Selected="True" Text="i;kZ; fuoMk" Value=""></asp:ListItem>
                                                <asp:ListItem Value="CustomerNo" Text="lHkkln dzekad"></asp:ListItem>
                                                <asp:ListItem Value="CusotmerName" Text="lHkklnkps uko"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvCustomerKayamNidhiSearch" runat="server" ControlToValidate="ddlCustomerKayamNidhiSearch"
                                                InitialValue="" ErrorMessage="Please Select Customer Search Type" Display="None"
                                                ValidationGroup="CustomerKayamNidhi" Enabled="true"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="acc_search_inputdiv">
                                            <asp:TextBox ID="txtSearchCustomerKayamNidhi" runat="server" CssClass="input" AutoComplete="off"></asp:TextBox>
                                        </div>
                                        <div>
                                            <asp:Button ID="btnSearchCustomerKayamNidhi" runat="server" Text="SaaoQaa" CssClass="searchbtn"
                                                OnClientClick="ValidatePageControl();ValidateCustomer('CustomerKayamNidhi');"
                                                OnClick="btnSearchCustomerKayamNidhi_Click" ValidationGroup="CustomerKayamNidhi" />
                                            <asp:Button ID="btnClearCustomerKayamNidhi" runat="server" Text="i@laAr" OnClick="btnClearCustomerKayamNidhi_Click"
                                                CssClass="searchbtn" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 75px; margin-left:10px;">
                                <lable class="short_lable">vaYa-</lable>
                                &nbsp;
                                <asp:DropDownList ID="ddlKayamNidhiYear" runat="server" CssClass="short_select_eng" Width="70px">
                                </asp:DropDownList>
                                &nbsp;
                                <lable class="short_lable">maihnao</lable>
                                &nbsp;
                                <asp:DropDownList ID="ddlKayamNidhiMonth" runat="server" CssClass="select" Width="70px">
                                </asp:DropDownList>
                                &nbsp;
                                <asp:Button ID="btnShowCustomerKayamNidhi" runat="server" Text="maaihtaI daKavaa" CssClass="createbtn"
                                    ClientIDMode="Static" OnClick="btnShowCustomerKayamNidhi_Click" />
                                &nbsp;
                                <asp:DropDownList ID="ddlPager" runat="server" OnSelectedIndexChanged="ddlPager_SelectedIndexChanged"
                                    AutoPostBack="true" CssClass="acc_page_count_txt">
                                    <asp:ListItem Selected="True" Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="grid" style="margin-top: 10px;">
                                <asp:GridView ID="gvCustomerKayamNidhi" runat="server" CellPadding="4" ForeColor="#333333"
                                    GridLines="None" AutoGenerateColumns="false" AllowPaging="true" Width="100%"
                                    OnPageIndexChanging="gvCustomerKayamNidhi_PageIndexChanging" CssClass="grid_header"
                                    OnRowEditing="gvCustomerKayamNidhi_RowEditing">
                                    <EmptyDataTemplate>
                                        Saunya roka^D- saapaDlao
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="lHkkln dzekad">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("CustomerId") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblAccountId" runat="server" Text='<%# Eval("AccountId") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblCustomerCode" runat="server" Text='<%# Eval("CustomerCode") %>'> </asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="lHkklnkpk izdkj">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerType" runat="server" Text='<%# Eval("CustomerTypeName")  %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="lHkklnkps uko">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("LastName") + " " + Eval("FirstName")  %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" Font-Size="Larger" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qksu uacj">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="dk;efu/kh [kkrs jDde">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerKayamNidhiBal" runat="server" Text='<%#string.Format("{0:0.00}", Eval("KayamNidhiBalance")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="dk;efu/kh ekfld jDde">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerKayamNidhiAmount" runat="server" Text='<%# string.Format("{0:0.00}",Eval("KayamNidhiAmount")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" CssClass="grid_numeric_item" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="uksan djk">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibtnEditCustomer" runat="server" CommandArgument='<%# Eval("CustomerId") %>'
                                                    CommandName="Edit" ImageUrl="~/images/Edit.gif" ClientIDMode="Static" OnClientClick="return confirm('Are you sure you want to pay for this customer ?');" />
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
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
