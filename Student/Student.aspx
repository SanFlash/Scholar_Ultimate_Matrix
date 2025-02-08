<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Welcome Section Styling */
.welcome-section {
    text-align: center;
    margin: 20px 0;
}

.welcome-section h2 {
    font-size: 24px;
    color: #333;
}

.welcome-section p {
    font-size: 16px;
    color: #555;
}

/* Services Section */
.services-section {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    margin-top: 30px;
}

.service-card {
    width: 280px;
    background-color: #f1f1f1;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    margin: 10px;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.service-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.service-card h3 {
    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
}

.service-card p {
    font-size: 14px;
    color: #777;
    margin-bottom: 15px;
}

.service-link {
    display: inline-block;
    padding: 8px 16px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    font-size: 14px;
    transition: background-color 0.3s ease;
}

.service-link:hover {
    background-color: #0056b3;
}

/* Responsive Design */
@media (max-width: 768px) {
    .services-section {
        flex-direction: column;
        align-items: center;
    }

    .service-card {
        width: 100%;
        margin-bottom: 20px;
    }
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Welcome Message Section -->
    <div class="welcome-section">
        <h2>Welcome to Your Student Portal</h2>
        <p>Manage your courses, assignments, grades, and more. Stay updated with all student-related services.</p>
    </div>

    <!-- Service Cards Section -->
    <div class="services-section">

        <div class="service-card">
            <h3>Result</h3>
            <p>View your grades and academic performance for the current semester and previous semesters.</p>
            <a href="ReportCard.aspx" class="service-link">Go to Grades</a>
        </div>

        <div class="service-card">
            <h3>Assignments</h3>
            <p>Submit assignments, check deadlines, and track your submission status.</p>
            <a href="StudyM.aspx" class="service-link">Go to Assignments</a>
        </div>

        <div class="service-card">
            <h3>Notifications</h3>
            <p>Stay updated with important announcements, events, and alerts.</p>
            <a href="Notification.aspx" class="service-link">Check Notifications</a>
        </div>

        <div class="service-card">
            <h3>Fee Payment</h3>
            <p>View and pay your tuition fees, track payment history, and manage outstanding balances.</p>
            <a href="Payment.aspx" class="service-link">Pay Fees</a>
        </div>

        <div class="service-card">
            <h3>Faculty Help</h3>
            <p>Ask teachers for clearing your doubts</p>
            <a href="HelpM.aspx" class="service-link">Go to Library</a>
        </div>
    </div>
    <br /><br /><br /><br />
</asp:Content>

