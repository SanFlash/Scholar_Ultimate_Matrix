<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }
        
        .home-title {
            font-size: 32px;
            color: #333;
            text-align: center;
            margin-top: 30px;
            animation: fadeIn 2s ease-in-out;
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }
        
        .hero-section h1,p
        {
            color:Black;
            }
        
        .hero-section {
            background-image: url('Image/neww.jpg');
            background-size: cover;
            background-position: center;
            color: #fff;
            text-align: center;
            padding: 100px 20px;
        }

        .hero-section h1 {
            font-size: 48px;
            margin-bottom: 20px;
            
        }

        .hero-section p {
            font-size: 20px;
            margin-bottom: 30px;
        }

        .hero-section .btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        .about-us, .courses, .testimonials, .contact {
            padding: 50px 20px;
            text-align: center;
        }

        .about-us p, .courses p, .testimonials p, .contact p {
            max-width: 800px;
            margin: 0 auto;
            margin-bottom: 30px;
        }
        .about-us h1 , .course h1
        {
            font-size:30px;
            }
        .course-card 
        {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 20px;
            margin: 20px;
            display: inline-block;
            border-radius: 10px;
            width: 30%;
            vertical-align: top;
        }

        .course-card img {
            max-width: 100%;
            height: auto;
        }

        .testimonial {
            background-color: #f9f9f9;
            padding: 20px;
            margin: 20px auto;
            max-width: 600px;
            border-radius: 10px;
        }

         
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <!-- Hero Section -->
    <div class="hero-section">
        <h1>Welcome to Scholar Ultimate Matrix (SUM)</h1>
        <p>Your Path to a Brighter Future Starts Here</p>
        <a href="OTPLogin.aspx" class="btn">Get Started</a>
    </div>

    <!-- About Us Section -->
    <div class="about-us">
        <h1>About Us</h1>
        <p>Scholar Ultimate Matrix is a comprehensive management system designed to streamline the administrative and academic processes of educational institutions. It efficiently manages student enrollments, faculty records, course schedules, attendance tracking, and exam grading. Key features include financial management for fees, communication tools for students and faculty, and reporting for data-driven decisions, providing a seamless experience for all users.</p>
    </div>

    <!-- Courses Section -->
    <div class="courses">
        <h1>SUM Facilities</h1>
        <div class="course-card">
            <img src="Image/Students.png" alt="Course 1" style="width:150px" />
            <h3>Student and Faculty Management</h3>
            <p>Manage student enrollments, faculty records, and track attendance, ensuring efficient administration of educational processes.</p>
            
        </div>
        <div class="course-card">
            <img src="Image/Course.png" alt="Course 2" style="width:150px"/>
            <h3>Course and Examination Management</h3>
            <p>Efficiently schedule courses, oversee exams and grading, and manage student assessments to ensure smooth academic operations.</p>
            
        </div>
        <div class="course-card">
            <img src="Image/Fee img.png" alt="Course 3" style="width:150px"/>
            <h3>Fee and Financial Management</h3>
            <p>Oversee tuition fees, process payments, and generate financial reports to maintain smooth financial operations.</p>
            
        </div>
        <div class="course-card">
            <img src="Image/Communication.png" alt="Course 3" style="width:150px"/>
            <h3>Communication and Reporting</h3>
            <p>Facilitate internal communication through notifications and messaging, and generate reports and analytics for data-driven decision-making.</p>
            
        </div>
    </div>

    <!-- Testimonials Section -->
    <div class="testimonials">
        <h2>Features</h2>
        <div class="testimonial" style="width:80%">
            <p><b>Student Management:</b>Manage enrollments, attendance, and performance.</p>
            <p><b>Faculty Management:</b>Organize faculty records, schedules, and communication.</p>
            <p><b>Course and Examination Management:</b>Schedule courses, manage exams, and grading.</p>
            <p><b>Financial Management:</b>Handle fees, payments, and invoices.</p>
            <p><b>Communication Tools:</b>Facilitate communication among students, faculty, and administrators.</p>
            <p><b>Reporting and Analytics:</b>Data-driven insights for effective decision-making.</p>
            <h4>- Satyendra Kumar Namdeo</h4>
            <h4>- Abhishek Sahare</h4>
            <h4>- Shraddha Pateriya</h4>
        </div>
    </div>

    <!-- Contact Section -->
    <div class="contact">
        <h2>Contact Us</h2>
        <p>Have questions? Feel free to reach out to us.</p>
        
    </div>
</asp:Content>

