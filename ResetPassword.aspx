<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Atelier.ResetPassword" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="auth-wrapper">
        <div class="auth-card card">

            <h1 style="text-align:center;margin-bottom:8px">Reset Password</h1>
            <p style="text-align:center;color:var(--muted-colour);margin-bottom:24px">
                Enter the reset token you received and choose a new password.
            </p>

            <asp:Panel ID="pnlError" runat="server" Visible="false">
                <div class="alert alert-danger">
                    <asp:Literal ID="litError" runat="server" />
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
                <div class="alert alert-success">
                    Your password has been reset successfully!
                    <a href="~/Login.aspx" runat="server" style="font-weight:600">
                        Sign in now
                    </a>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlForm" runat="server">

                <div class="form-group">
                    <label>Reset Token</label>
                    <asp:TextBox ID="txtToken" runat="server"
                        placeholder="Enter your 6-digit token"
                        MaxLength="6" />
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtToken"
                        ErrorMessage="Token is required."
                        ValidationGroup="Reset"
                        CssClass="field-error"
                        Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label>New Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"
                        placeholder="Minimum 6 characters" />
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtNewPassword"
                        ErrorMessage="New password is required."
                        ValidationGroup="Reset"
                        CssClass="field-error"
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator runat="server"
                        ControlToValidate="txtNewPassword"
                        ValidationExpression=".{6,}"
                        ErrorMessage="Password must be at least 6 characters."
                        ValidationGroup="Reset"
                        CssClass="field-error"
                        Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label>Confirm New Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"
                        placeholder="Re-enter your new password" />
                    <asp:CompareValidator runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtNewPassword"
                        ErrorMessage="Passwords do not match."
                        ValidationGroup="Reset"
                        CssClass="field-error"
                        Display="Dynamic" />
                </div>

                <asp:Button ID="btnReset" runat="server"
                    Text="Reset Password"
                    CssClass="btn btn-primary btn-lg"
                    style="width:100%;margin-top:8px"
                    ValidationGroup="Reset"
                    OnClick="btnReset_Click" />

            </asp:Panel>

            <div style="text-align:center;margin-top:16px;font-size:14px">
                <a href="~/Login.aspx" runat="server" style="font-weight:600">
                    Back to Sign In
                </a>
            </div>

        </div>
    </div>

</asp:Content>
