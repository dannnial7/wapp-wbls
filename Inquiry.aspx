<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inquiry.aspx.cs" Inherits="Atelier.Inquiry" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="auth-wrapper">
        <div class="auth-card card" style="max-width:560px">

            <h1 style="text-align:center;margin-bottom:8px">Contact Us</h1>
            <p style="text-align:center;color:var(--muted-colour);margin-bottom:24px">
                Have a question or need help? Fill out the form below and our team will respond as soon as possible.
            </p>

            <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
                <div class="alert alert-success">
                    <asp:Literal ID="litSuccess" runat="server" />
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlError" runat="server" Visible="false">
                <div class="alert alert-danger">
                    <asp:Literal ID="litError" runat="server" />
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlForm" runat="server">

                <div class="form-group">
                    <label>Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server"
                        placeholder="Your full name" />
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtFullName"
                        ErrorMessage="Full name is required."
                        ValidationGroup="Inquiry"
                        CssClass="field-error"
                        Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                        placeholder="you@example.com" />
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required."
                        ValidationGroup="Inquiry"
                        CssClass="field-error"
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Please enter a valid email address."
                        ValidationGroup="Inquiry"
                        CssClass="field-error"
                        Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label>Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server"
                        placeholder="Brief summary of your inquiry" />
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtSubject"
                        ErrorMessage="Subject is required."
                        ValidationGroup="Inquiry"
                        CssClass="field-error"
                        Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label>Message</label>
                    <asp:TextBox ID="txtMessage" runat="server"
                        TextMode="MultiLine" Rows="5"
                        placeholder="Describe your question or concern in detail..." />
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="txtMessage"
                        ErrorMessage="Message is required."
                        ValidationGroup="Inquiry"
                        CssClass="field-error"
                        Display="Dynamic" />
                </div>

                <asp:Button ID="btnSubmit" runat="server"
                    Text="Submit Inquiry"
                    CssClass="btn btn-primary btn-lg"
                    style="width:100%;margin-top:8px"
                    ValidationGroup="Inquiry"
                    OnClick="btnSubmit_Click" />

            </asp:Panel>

        </div>
    </div>

</asp:Content>
