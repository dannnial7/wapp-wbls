<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Atelier.Profile" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .profile-pic {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #6B1A2A;
        }
        .profile-grid {
            display: grid;
            grid-template-columns: 200px 1fr;
            gap: 32px;
            align-items: start;
        }
        @media (max-width: 600px) {
            .profile-grid { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top:40px">

        <h1>My Profile</h1>
        <p style="color:var(--muted-colour)">Manage your account details.</p>

        <asp:Panel ID="pnlSaved" runat="server" Visible="false">
            <div class="alert alert-success">
                <asp:Literal ID="litSavedMsg" runat="server" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlError" runat="server" Visible="false">
            <div class="alert alert-danger">
                <asp:Literal ID="litErrorMsg" runat="server" />
            </div>
        </asp:Panel>

        <%-- Account details --%>
        <div class="card" style="margin-top:24px">
            <h2 class="section-title">Account Details</h2>

            <div class="profile-grid" style="margin-top:20px">

                <div style="text-align:center">
                    <asp:Image ID="imgProfile" runat="server" CssClass="profile-pic" />
                    <div class="form-group" style="margin-top:12px">
                        <asp:FileUpload ID="fuProfilePic" runat="server" />
                    </div>
                    <p class="course-meta" style="font-size:12px">
                        JPG or PNG, under 2 MB.
                    </p>
                </div>

                <div>
                    <div class="form-group">
                        <label>Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" />
                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="txtFullName"
                            ErrorMessage="Full name is required."
                            ValidationGroup="Details"
                            CssClass="alert alert-danger"
                            Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
                        <asp:RequiredFieldValidator runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email is required."
                            ValidationGroup="Details"
                            CssClass="alert alert-danger"
                            Display="Dynamic" />
                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            ErrorMessage="Please enter a valid email address."
                            ValidationGroup="Details"
                            CssClass="alert alert-danger"
                            Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>Bio</label>
                        <asp:TextBox ID="txtBio" runat="server"
                            TextMode="MultiLine" Rows="4"
                            placeholder="Tell other learners about yourself..." />
                    </div>

                    <div class="form-group">
                        <label>Theme Preference</label>
                        <asp:DropDownList ID="ddlTheme" runat="server">
                            <asp:ListItem Value="light" Text="Light" />
                            <asp:ListItem Value="dark" Text="Dark" />
                        </asp:DropDownList>
                    </div>

                    <asp:Button ID="btnSaveDetails" runat="server"
                        Text="Save Changes"
                        CssClass="btn btn-primary"
                        ValidationGroup="Details"
                        OnClick="btnSaveDetails_Click" />
                </div>

            </div>
        </div>

        <%-- Password change, kept separate so a details update does not
             require re-entering the password --%>
        <div class="card" style="margin-top:24px">
            <h2 class="section-title">Change Password</h2>

            <div class="form-group" style="margin-top:16px">
                <label>Current Password</label>
                <asp:TextBox ID="txtCurrentPwd" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtCurrentPwd"
                    ErrorMessage="Enter your current password."
                    ValidationGroup="Password"
                    CssClass="alert alert-danger"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <label>New Password</label>
                <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtNewPwd"
                    ErrorMessage="Enter a new password."
                    ValidationGroup="Password"
                    CssClass="alert alert-danger"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="txtNewPwd"
                    ValidationExpression=".{6,}"
                    ErrorMessage="Password must be at least 6 characters."
                    ValidationGroup="Password"
                    CssClass="alert alert-danger"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <label>Confirm New Password</label>
                <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password" />
                <asp:CompareValidator runat="server"
                    ControlToValidate="txtConfirmPwd"
                    ControlToCompare="txtNewPwd"
                    ErrorMessage="Passwords do not match."
                    ValidationGroup="Password"
                    CssClass="alert alert-danger"
                    Display="Dynamic" />
            </div>

            <asp:Button ID="btnChangePwd" runat="server"
                Text="Update Password"
                CssClass="btn btn-secondary"
                ValidationGroup="Password"
                OnClick="btnChangePwd_Click" />
        </div>

    </div>

</asp:Content>