<%@ Page Title="Faculty Home" Language="C#" MasterPageFile="~/Faculty/Faculty.master" AutoEventWireup="true" CodeFile="Faculty.aspx.cs" Inherits="Faculty_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
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
        <h2>Welcome to the Faculty Portal</h2>
        <p>Manage courses, students, grades, and more. Access all faculty-related services in one place.</p>
    </div>

    <!-- Service Cards Section -->
    <div class="services-section">
        <div class="service-card">
            <h3>Attendance Management</h3>
            <p>View and manage student information and academic progress.</p>
            <a href="Attendance.aspx" class="service-link">Go to Student Management</a>
        </div>
        <div class="service-card">
            <h3>Grade Submission</h3>
            <p>Submit and update student grades for the courses you teach.</p>
            <a href="GradeM.aspx" class="service-link">Submit Grades</a>
        </div>
        <div class="service-card">
            <h3>Assignments/Notes</h3>
            <p>Upload assignments, set deadlines, and track student submissions.</p>
            <a href="StudyM.aspx" class="service-link">Manage Assignments</a>
        </div>
        <div class="service-card">
            <h3>Notifications</h3>
            <p>Stay informed about announcements and institutional updates.</p>
            <a href="Notice.aspx" class="service-link">Check Notifications</a>
        </div>
        <div class="service-card">
            <h3>Pay Fee</h3>
            <p>View payroll details, track payments, and manage financial information.</p>
            <a href="FeeDetails.aspx" class="service-link">Go to Payroll</a>
        </div>
        <div class="service-card">
            <h3>Student Doubts</h3>
            <p>Provide and view feedback from students and faculty peers.</p>
            <a href="StudentHelp.aspx" class="service-link">View Feedback</a>
        </div>
        
    </div>
    <br /><br /><br />
</asp:Content>
