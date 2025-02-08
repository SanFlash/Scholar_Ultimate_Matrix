<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin/Admin.master"
    AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .admin-container
        {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 100px;
        }
        .service-cards-container
        {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }
        .service-card
        {
            background-color: #f1f1f1;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
            text-align: center;
            padding: 20px;
            min-height: 180px;
        }
        .service-card:hover
        {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }
        .card-content h3
        {
            font-size: 24px;
            color: #333;
        }
        .service-image
        {
            width: 100%; /* Make the image take full width of the card */
            height: auto; /* Maintain the aspect ratio */
            object-fit: cover; /* Cover the area without distorting the image */
            border-radius: 10px; /* Optional: Add rounded corners for aesthetics */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="admin-container">
        <!-- Service Cards Container -->
        <div class="service-cards-container">
            <!-- Card Structure -->
            <div class="service-card" onclick="window.location.href='StudentM.aspx';">
                <div class="card-content">
                    <h3>
                        Student Management</h3>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Image/Studentssa-remo.png" CssClass="service-image" />
                </div>
            </div>
            <div class="service-card" onclick="window.location.href='FacultyM.aspx';">
                <div class="card-content">
                    <h3>
                        Faculty Management</h3>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Image/facult-remo.png" CssClass="service-image" />
                </div>
            </div>
            <div class="service-card" onclick="window.location.href='CourseM.aspx';">
                <div class="card-content">
                    <h3>
                        Course and Curriculum Management</h3>
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/course-remo.png" CssClass="service-image" />
                </div>
            </div>
            <div class="service-card" onclick="window.location.href='NotificationM.aspx';">
                <div class="card-content">
                    <h3>
                        Notifications</h3>
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Image/noifi-remo.png" CssClass="service-image" />
                </div>
            </div>
            <div class="service-card" onclick="window.location.href='ExamResultM.aspx';">
                <div class="card-content">
                    <h3>
                        Examination and Grading</h3>
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Image/examytn.png" CssClass="service-image" />
                </div>
            </div>
            <!-- Repeat for other services up to 9 or more -->
            <div class="service-card" onclick="window.location.href='AllData.aspx';">
                <div class="card-content">
                    <h3>
                        All Data</h3>
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Image/AllDat.png" CssClass="service-image" />
                </div>
            </div>
            <div class="service-card" onclick="window.location.href='FinanceM.aspx';">
                <div class="card-content">
                    <h3>
                        Fee Details</h3>
                    <asp:Image ID="Image7" runat="server" ImageUrl="~/Image/finance-remo.png" CssClass="service-image" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
