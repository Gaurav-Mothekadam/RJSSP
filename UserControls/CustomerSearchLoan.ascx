<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerSearchLoan.ascx.cs"
    Inherits="Raigad.UserControls.CustomerSearchLoan" %>
<!---Customer Search PopUp Start-->
<asp:Panel ID="pnlCustomerSearchPopup" runat="server" DefaultButton="btnSearchCustomer">
    <asp:UpdatePanel ID="upCustomerSearchPopup" runat="server">
        <ContentTemplate>
            <h3 class="pnl_header">
                saBaasad SaaoQaa
            </h3>
            <div class="pnl_sub_header">
                <asp:HiddenField ID="hdnCustomerId" runat="server" Value="" />
                <table width="100%">
                    <tr>
                        <td width="20%" align="right">
                            <asp:DropDownList ID="ddlCustomerSearch" runat="server" CssClass="short_select" Width="125px">
                                <asp:ListItem Selected="True" Text="i;kZ; fuoMk" Value=""></asp:ListItem>
                                <asp:ListItem Value="CustomerNo" Text="lHkkln dzekad"></asp:ListItem>
                                <asp:ListItem Value="CusotmerName" Text="lHkklnkps uko"></asp:ListItem>
                                <asp:ListItem Value="CusotmerDistrict" Text="lHkklnkpk ftYgk"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCustomerSearch" runat="server" ControlToValidate="ddlCustomerSearch"
                                InitialValue="" ErrorMessage="Please Select Customer Search Type" Display="None"
                                ValidationGroup="ValidateCustomerSearch" Enabled="true"></asp:RequiredFieldValidator>
                        </td>
                        <td width="20%">
                            <asp:TextBox ID="txtSearchCustomer" runat="server" CssClass="input"></asp:TextBox>
                        </td>
                        <td width="20%" style="padding-left: 4px;" valign="baseline">
                            <asp:Button ID="btnSearchCustomer" runat="server" Text="SaaoQaa" CssClass="searchbtn"
                                OnClientClick="ValidatePageControl();ValidateCustomer('ValidateCustomerSearch');"
                                ValidationGroup="ValidateCustomerSearch" OnClick="btnSearchCustomer_Click" />
                            <asp:Button ID="btnClearCustomerSearch" runat="server" Text="rdd kra" CssClass="searchbtn"
                                OnClick="btnClearCustomerSearch_Click" />
                        </td>
                        <td width="40%">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <div class="search_grid" align="center">
                                <asp:GridView ID="gvCustSearchResult" runat="server" AutoGenerateColumns="False"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="90%" EnablePersistedSelection="True"
                                    ShowHeaderWhenEmpty="True" DataKeyNames="CustomerId" OnRowDataBound="gvCustSearchResult_RowDataBound"
                                    AllowPaging="true" PageSize="12" OnPageIndexChanging="gvCustSearchResult_PageIndexChanging"
                                    CssClass="grid_header" Font-Size="Large">
                                    <AlternatingRowStyle BackColor="White" />
                                    <EmptyDataTemplate>
                                        Saunya roka^D- saapaDlao
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="fuoMk">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("CustomerId") %>' Visible="false"></asp:Label>
                                                <asp:CheckBox ID="chkSelect" runat="server" ClientIDMode="Static" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="lHkkln dzekad" DataField="CustomerCode" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Left"></asp:BoundField>
                                        <asp:TemplateField HeaderText="lHkklnkps uko" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("LastName") + " " + Eval("FirstName")  %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="VillageId" HeaderText="xako" ItemStyle-HorizontalAlign="Center">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DistrictName" HeaderText="fTkYgk" ItemStyle-HorizontalAlign="Center">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PhoneNumber" HeaderText="Qksu uacj" ItemStyle-HorizontalAlign="Center">
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" CssClass="grid_empty_row" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Right" />
                                    <PagerSettings Position="Bottom" Mode="Numeric" />
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
                    <tr>
                        <td colspan="4" align="center">
                            <asp:Button ID="btnOk" runat="server" Text="Aaokox" CssClass="searchbtn" OnClick="btnOk_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <asp:HiddenField ID="hdnSelectedRow" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
<!---Customer Search PopUp End-->
