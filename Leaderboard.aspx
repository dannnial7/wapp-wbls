<%@ Page Title="Leaderboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Leaderboard.aspx.cs" Inherits="Atelier.Leaderboard" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .rank-badge {
            display: inline-block;
            width: 36px;
            height: 36px;
            line-height: 36px;
            text-align: center;
            border-radius: 50%;
            font-weight: 600;
            background: #F0F4F9;
            color: #6B1A2A;
        }
        .rank-1 { background: #D4AF37; color: #FFFFFF; }
        .rank-2 { background: #B8B8B8; color: #FFFFFF; }
        .rank-3 { background: #CD7F32; color: #FFFFFF; }

        .leaderboard-row {
            display: grid;
            grid-template-columns: 60px 1fr 120px 100px;
            align-items: center;
            gap: 16px;
            padding: 14px 20px;
            border-bottom: 1px solid #E8E0E2;
        }
        .leaderboard-row.is-you {
            background: #F0F4F9;
            border-radius: 10px;
            font-weight: 600;
        }
        .leaderboard-head {
            display: grid;
            grid-template-columns: 60px 1fr 120px 100px;
            gap: 16px;
            padding: 12px 20px;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #5A3A42;
        }
        @media (max-width: 600px) {
            .leaderboard-row, .leaderboard-head {
                grid-template-columns: 44px 1fr 80px;
            }
            .hide-mobile { display: none; }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top:40px">

        <h1>Leaderboard</h1>
        <p style="color:var(--muted-colour)">
            Learners ranked by experience points earned across all courses.
        </p>

        <%-- Where the current learner stands --%>
        <asp:Panel ID="pnlYourRank" runat="server" Visible="false"
                   CssClass="card" style="margin:24px 0">
            <div class="grid-stats">
                <div class="stat-card">
                    <asp:Label ID="lblYourRank" runat="server" CssClass="stat-number" />
                    <div class="stat-label">Your Rank</div>
                </div>
                <div class="stat-card">
                    <asp:Label ID="lblYourXP" runat="server" CssClass="stat-number" />
                    <div class="stat-label">Your XP</div>
                </div>
                <div class="stat-card">
                    <asp:Label ID="lblTotalLearners" runat="server" CssClass="stat-number" />
                    <div class="stat-label">Total Learners</div>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
            <div class="alert alert-info">
                No experience points have been earned yet. Complete a module to
                appear on the leaderboard.
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlBoard" runat="server" CssClass="card" style="padding:0">

            <div class="leaderboard-head">
                <div>Rank</div>
                <div>Learner</div>
                <div class="hide-mobile">Badges</div>
                <div>XP</div>
            </div>

            <asp:Repeater ID="rptLeaderboard" runat="server">
                <ItemTemplate>
                    <div class='<%# Convert.ToInt32(Eval("UserID")) == CurrentUserId
                                    ? "leaderboard-row is-you"
                                    : "leaderboard-row" %>'>
                        <div>
                            <span class='<%# GetRankClass(Container.ItemIndex + 1) %>'>
                                <%# Container.ItemIndex + 1 %>
                            </span>
                        </div>
                        <div>
                            <%# Eval("FullName") %>
                            <%# Convert.ToInt32(Eval("UserID")) == CurrentUserId
                                ? " <span class='badge badge-primary'>You</span>"
                                : "" %>
                        </div>
                        <div class="hide-mobile course-meta">
                            <%# Eval("BadgeCount") %>
                        </div>
                        <div style="font-weight:600;color:#6B1A2A">
                            <%# Eval("TotalXP") %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </asp:Panel>

    </div>

</asp:Content>