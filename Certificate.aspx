<%@ Page Title="Certificate" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Certificate.aspx.cs" Inherits="Atelier.Certificate" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .certificate {
            background: #FFFFFF;
            border: 8px double #6B1A2A;
            padding: 56px 48px;
            text-align: center;
            max-width: 800px;
            margin: 0 auto;
        }
        .cert-heading {
            font-family: var(--heading-font);
            font-size: 15px;
            letter-spacing: 0.28em;
            text-transform: uppercase;
            color: #5A3A42;
        }
        .cert-name {
            font-family: var(--heading-font);
            font-size: 42px;
            color: #6B1A2A;
            margin: 20px 0 8px;
            border-bottom: 1px solid #E8E0E2;
            display: inline-block;
            padding: 0 32px 8px;
        }
        .cert-course {
            font-family: var(--heading-font);
            font-size: 26px;
            color: #1A0A0E;
            margin: 20px 0;
        }
        .cert-footer {
            display: flex;
            justify-content: space-between;
            margin-top: 48px;
            font-size: 13px;
            color: #5A3A42;
        }
        .cert-id {
            font-family: monospace;
            letter-spacing: 0.1em;
        }
        @media print {
            #navbar, #footer, .no-print { display: none !important; }
            .certificate { border-color: #000; }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top:40px">

        <%-- Shown when the learner has not yet met the requirements --%>
        <asp:Panel ID="pnlNotEligible" runat="server" Visible="false">
            <div class="alert alert-warning">
                <h4>Certificate not yet available</h4>
                <p>To earn your certificate for this course you must:</p>
                <ul style="margin:12px 0 12px 20px">
                    <li>
                        Complete all modules
                        &mdash; <asp:Literal ID="litModuleProgress" runat="server" />
                    </li>
                    <li>
                        Pass the course assessment
                        &mdash; <asp:Literal ID="litAssessmentStatus" runat="server" />
                    </li>
                </ul>
                <asp:HyperLink ID="lnkBackToCourse" runat="server"
                    Text="Back to course" CssClass="btn btn-secondary btn-sm" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlCertificate" runat="server" Visible="false">

            <div class="certificate">
                <p class="cert-heading">Certificate of Completion</p>

                <p style="margin-top:32px;color:#5A3A42">This is to certify that</p>

                <div class="cert-name"><asp:Literal ID="litLearnerName" runat="server" /></div>

                <p style="color:#5A3A42;margin-top:16px">
                    has successfully completed the course
                </p>

                <p class="cert-course"><asp:Literal ID="litCourseTitle" runat="server" /></p>

                <p class="course-meta">
                    <asp:Literal ID="litCategory" runat="server" />
                    &nbsp;&middot;&nbsp;
                    <asp:Literal ID="litDifficulty" runat="server" />
                    &nbsp;&middot;&nbsp;
                    Assessment score: <asp:Literal ID="litScore" runat="server" />%
                </p>

                <div class="cert-footer">
                    <div>
                        <strong>Date of completion</strong><br />
                        <asp:Literal ID="litCompletedDate" runat="server" />
                    </div>
                    <div style="text-align:right">
                        <strong>Certificate ID</strong><br />
                        <span class="cert-id"><asp:Literal ID="litCertId" runat="server" /></span>
                    </div>
                </div>

                <p style="margin-top:36px;font-size:12px;color:#5A3A42">
                    Atelier &mdash; One Platform. Endless Creativity.
                </p>
            </div>

            <div style="text-align:center;margin-top:24px" class="no-print">
                <button type="button" class="btn btn-primary" onclick="window.print()"
                        style="color:#BFCFE8;background-color:#6B1A2A">
                    Print Certificate
                </button>
                <asp:HyperLink ID="lnkBack" runat="server"
                    Text="Back to course" CssClass="btn btn-secondary" />
            </div>

        </asp:Panel>

    </div>

</asp:Content>