<%@ Page Title="Assessment Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuizResults.aspx.cs" Inherits="Atelier.QuizResults" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top:40px">

        <asp:Panel ID="pnlNoResults" runat="server" Visible="false">
            <div class="alert alert-info">
                You have not attempted this assessment yet.
                <asp:HyperLink ID="lnkTakeQuiz" runat="server" Text="Take it now" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlResults" runat="server">

            <p class="course-meta">
                <asp:HyperLink ID="lnkBackToCourse" runat="server" Text="&larr; Back to course" />
            </p>

            <h1><asp:Literal ID="litTitle" runat="server" /></h1>

            <%-- Most recent attempt --%>
            <div class="card" style="margin-top:24px">
                <h2 class="section-title">Your Latest Attempt</h2>

                <div class="grid-stats" style="margin:20px 0">
                    <div class="stat-card">
                        <asp:Label ID="lblScore" runat="server" CssClass="stat-number" />
                        <div class="stat-label">Your Score</div>
                    </div>
                    <div class="stat-card">
                        <asp:Label ID="lblPassMark" runat="server" CssClass="stat-number" />
                        <div class="stat-label">Pass Mark</div>
                    </div>
                    <div class="stat-card">
                        <asp:Label ID="lblAttempt" runat="server" CssClass="stat-number" />
                        <div class="stat-label">Attempt Number</div>
                    </div>
                </div>

                <p style="text-align:center;margin:20px 0">
                    <asp:Literal ID="litOutcome" runat="server" />
                </p>

                <p class="course-meta" style="text-align:center">
                    Taken on <asp:Literal ID="litTakenAt" runat="server" />
                </p>
            </div>

            <%-- Retake or certificate, depending on the outcome --%>
            <div style="text-align:center;margin-top:24px">
                <asp:HyperLink ID="lnkRetake" runat="server"
                    Visible="false"
                    CssClass="btn btn-primary"
                    Text="Try Again"
                    style="color:#BFCFE8 !important;background-color:#6B1A2A !important;" />

                <asp:HyperLink ID="lnkCertificate" runat="server"
                    Visible="false"
                    CssClass="btn btn-primary"
                    Text="View Certificate"
                    style="color:#BFCFE8 !important;background-color:#6B1A2A !important;" />

                <asp:Label ID="lblNoAttemptsLeft" runat="server"
                    Visible="false"
                    CssClass="course-meta"
                    Text="You have used all your attempts for this assessment." />
            </div>

            <%-- Every attempt, so the learner can see improvement --%>
            <h2 class="section-title" style="margin-top:40px">Attempt History</h2>

            <asp:Repeater ID="rptHistory" runat="server">
                <HeaderTemplate>
                    <table class="table" style="width:100%">
                        <tr>
                            <th>Attempt</th>
                            <th>Score</th>
                            <th>Outcome</th>
                            <th>Date</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("AttemptNumber") %></td>
                        <td><%# Eval("Score") %>%</td>
                        <td>
                            <%# Convert.ToBoolean(Eval("Passed"))
                                ? "<span class='badge badge-success'>Passed</span>"
                                : "<span class='badge badge-danger'>Failed</span>" %>
                        </td>
                        <td><%# Eval("TakenAt", "{0:dd MMM yyyy, h:mm tt}") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

        </asp:Panel>

    </div>

</asp:Content>