<%@ Page Title="Assessment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuizPage.aspx.cs" Inherits="Atelier.QuizPage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top:40px">

        <asp:Panel ID="pnlNotFound" runat="server" Visible="false">
            <div class="alert alert-danger">Assessment not found.</div>
        </asp:Panel>

        <asp:Panel ID="pnlNoAttempts" runat="server" Visible="false">
            <div class="alert alert-warning">
                <strong>No attempts remaining.</strong>
                <p>You have used all <asp:Literal ID="litMaxAttempts" runat="server" /> attempts for this assessment.</p>
                <asp:HyperLink ID="lnkBackNoAttempts" runat="server"
                    Text="Back to course" CssClass="btn btn-secondary btn-sm" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlQuiz" runat="server">

            <p class="course-meta">
                <asp:HyperLink ID="lnkBackToCourse" runat="server" Text="&larr; Back to course" />
            </p>

            <h1><asp:Literal ID="litTitle" runat="server" /></h1>

            <div class="card" style="margin-bottom:24px">
                <div class="grid-stats">
                    <div class="stat-card">
                        <asp:Label ID="lblQuestionCount" runat="server" CssClass="stat-number" />
                        <div class="stat-label">Questions</div>
                    </div>
                    <div class="stat-card">
                        <asp:Label ID="lblTimeLimit" runat="server" CssClass="stat-number" />
                        <div class="stat-label">Suggested Minutes</div>
                    </div>
                    <div class="stat-card">
                        <asp:Label ID="lblPassMark" runat="server" CssClass="stat-number" />
                        <div class="stat-label">Pass Mark %</div>
                    </div>
                    <div class="stat-card">
                        <asp:Label ID="lblAttemptsLeft" runat="server" CssClass="stat-number" />
                        <div class="stat-label">Attempts Left</div>
                    </div>
                </div>
            </div>

            <asp:Panel ID="pnlValidationMsg" runat="server" Visible="false">
                <div class="alert alert-danger">
                    Please answer every question before submitting.
                </div>
            </asp:Panel>

            <%-- Questions and their options are both read from the database, so an
                 assessment added by an administrator appears here without any change
                 to this page. --%>
            <asp:Repeater ID="rptQuestions" runat="server" OnItemDataBound="rptQuestions_ItemDataBound">
                <ItemTemplate>
                    <div class="card" style="margin-bottom:16px">
                        <h4><%# Container.ItemIndex + 1 %>. <%# Eval("QuestionText") %></h4>

                        <asp:HiddenField ID="hfQuestionID" runat="server"
                            Value='<%# Eval("QuestionID") %>' />

                        <asp:RadioButtonList ID="rblOptions" runat="server"
    RepeatLayout="Flow"
    RepeatDirection="Vertical"
    CssClass="quiz-options" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Button ID="btnSubmit" runat="server"
                Text="Submit Answers"
                CssClass="btn btn-primary btn-lg"
                OnClick="btnSubmit_Click"
                OnClientClick="return confirm('Submit your answers? You cannot change them afterwards.');" />

        </asp:Panel>

    </div>

</asp:Content>