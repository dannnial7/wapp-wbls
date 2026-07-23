<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Atelier.ForgotPassword" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="auth-wrapper">
        <div class="auth-card card">

            <h1 style="text-align:center;margin-bottom:8px">Forgot Password</h1>
            <p style="text-align:center;color:var(--muted-colour);margin-bottom:24px">
                Enter your registered email address and we will generate a password reset token for you.
            </p>

            <asp:Panel ID="pnlError" runat="server" Visible="false">
                <div class="alert alert-danger">
                    <asp:Literal ID="litError" runat="server" />
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlToken" runat="server" Visible="false">
                <div class="alert alert-success">
                    <strong>Your password reset token:</strong>
                    <div style="font-size:28px;font-weight:700;letter-spacing:6px;text-align:center;
                                margin:16px 0;color:#6B1A2A;font-family:monospace">
                        <asp:Literal ID="litToken" runat="server" />
                    </div>
                    <p style="font-size:13px;color:var(--muted-colour);margin-top:8px">
                        Please copy this token. You will need it to reset your password.
                    </p>
                </div>
                <a href="~/ResetPassword.aspx" runat="server"
                   class="btn btn-primary btn-lg"
                   style="width:100%;display:block;text-align:center;margin-top:16px">
                    Reset Password
                </a>
            </asp:Panel>

            <asp:Panel ID="pnlForm" runat="server">
                <div class="form-group">
                    <label>Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                        placeholder="you@example.com" />
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required."
                        ValidationGroup="Forgot"
                        CssClass="field-error"
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Please enter a valid email address."
                        ValidationGroup="Forgot"
                        CssClass="field-error"
                        Display="Dynamic" />
                </div>

                <asp:Button ID="btnSubmit" runat="server"
                    Text="Generate Reset Token"
                    CssClass="btn btn-primary btn-lg"
                    style="width:100%;margin-top:8px"
                    ValidationGroup="Forgot"
                    OnClick="btnSubmit_Click" />
            </asp:Panel>

            <div style="text-align:center;margin-top:16px;font-size:14px">
                Remember your password?
                <a href="~/Login.aspx" runat="server" style="font-weight:600">
                    Sign in
                </a>
            </div>

        </div>
    </div>

</asp:Content>
