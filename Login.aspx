<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Raigad.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>.:: Raigadh Jilla Application ::.</title>
    <style type="text/css">
        #LoginForm
        {
            height: 623px;
        }
    </style>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="LoginForm" runat="server">
    <div class="wrapper">
        <div class="header">
            <div class="logo">
                <asp:Image ID="ImgLogo" ImageUrl="~/images/RJPSSP_Logo_transp_200_1_trs.png" runat="server" Height="100px"
                    Width="130px" />
            </div>
            <div class="heading">
                <asp:Image ID="imgBankNameLogo" ImageUrl="~/images/BankName.png" runat="server" />
            </div>
        </div>
        <div class="blank"></div>
    </div>
        <div class="content">
            <asp:Panel ID="pnlLogin" runat="server" Visible="true">
                <div class="login">
                    <div class="login_top">
                        laa^ga [na
                    </div>
                    <div class="login_bg">
                        <div class="login_subdiv">
                            <div class="div_message">
                                <asp:Label ID="lblLoginMessage" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="login_maindiv">
                                <div class="login_txtdiv login_pad">
                                    <strong>
                                        <label for="txtusername">
                                            yaujarcao naava</label></strong></div>
                                <div class="login_inputdiv">
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="login_input"></asp:TextBox>
                                    <a style="font-family: Arial; font-size: large; font-weight: bolder; color: #FF0000">
                                        *</a>
                                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUsername"
                                        ErrorMessage="Please Enter Username" ValidationGroup="UserLogin" Display="None"
                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="login_maindiv">
                                <div class="login_txtdiv login_pad">
                                    <strong>
                                        <label for="txtPassword">
                                            paasavaD-</label></strong>
                                </div>
                                <div class="login_inputdiv">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login_input"></asp:TextBox>
                                    <a style="font-family: Arial; font-size: large; font-weight: bolder; color: #FF0000">
                                        *</a>
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtpassword"
                                        ErrorMessage="Please Enter Password" ValidationGroup="UserLogin" Display="None"
                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="login_maindiv">
                                <div class="login_txtdiv login_pad">
                                </div>
                                <div class="login_inputdiv">
                                    <div class="login_reme">
                                        <asp:LinkButton ID="lnkForgotPassword" runat="server" Text="paasavaD- ivasarlaata?"
                                            OnClick="lnkForgotPassword_Click" CssClass="login_link"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="login_maindiv">
                                <div class="login_txtdiv login_pad">
                                </div>
                                <div class="login_inputdiv">
                                    <asp:Button ID="btnlogin" runat="server" Text="laa^ga [na" CssClass="loginbtn" OnClick="btnlogin_Click"
                                        ValidationGroup="UserLogin" />
                                    <asp:Button ID="btnCancelLogin" runat="server" Text="rV kxra" CssClass="loginbtn"
                                        OnClick="btnCancelLogin_Click" />
                                    <asp:ValidationSummary ID="vsUserLogin" runat="server" ShowMessageBox="true" ShowSummary="false"
                                        ValidationGroup="UserLogin" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlForgotPassword" runat="server" Visible="false">
                <div class="login">
                    <div class="login_top">
                        paasavaD- ivasarlaata?
                    </div>
                    <div class="login_bg">
                        <div class="login_subdiv">
                            <div class="div_message">
                                <asp:Label ID="lblForgotPasswordMessage" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="login_maindiv">
                                <div class="login_txtdiv login_pad">
                                    <strong>
                                        <label for="email">
                                            [maola</label></strong></div>
                                <div class="login_inputdiv">
                                    <asp:TextBox ID="txtUserEmailAddress" runat="server" CssClass="login_input"></asp:TextBox>
                                    <a style="font-family: Arial; font-size: large; font-weight: bolder; color: #FF0000">
                                        *</a>
                                    <asp:RequiredFieldValidator ID="rfvUserEmailAddress" runat="server" ValidationGroup="ForgotPassword"
                                        ControlToValidate="txtUserEmailAddress" ErrorMessage="Please Enter Email Address"
                                        Display="None"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revUserEmailAddress" runat="server" ControlToValidate="txtUserEmailAddress"
                                        ErrorMessage="Please Enter Correct Email Id" Display="None" ValidationGroup="ForgotPassword"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="login_maindiv">
                                <div class="login_txtdiv login_pad">
                                </div>
                                <div class="login_inputdiv">
                                    <asp:Button ID="btnForgotPasswordSubmit" runat="server" Text="paazvaa" CssClass="loginbtn"
                                        OnClick="btnForgotPasswordSubmit_Click" ValidationGroup="ForgotPassword" />
                                    <asp:Button ID="btnForgotPasswordCancel" runat="server" Text="r_ kra" CssClass="loginbtn"
                                        OnClick="btnForgotPasswordCancel_Click" />
                                    <asp:ValidationSummary ID="vsForgotPassword" runat="server" ShowMessageBox="true"
                                        ShowSummary="false" ValidationGroup="ForgotPassword" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
   
    </form>
</body>
</html>
