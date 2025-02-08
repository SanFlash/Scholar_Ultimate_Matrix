<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Faculty.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Faculty_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .container {
            margin-top: 50px;
        }

        .image-section img {
            max-width: 300px;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .image-section img:hover {
            transform: scale(1.05);
        }

        .otp-section {
            display: none;
            margin-top: 20px;
        }

        .otp-section label {
            font-size: 1.2em;
            color: #333;
            display: block;
            margin-bottom: 10px;
        }

        .otp-section input {
            padding: 10px;
            font-size: 1em;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .otp-section button {
            padding: 10px 20px;
            font-size: 1em;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .otp-section button:hover {
            background-color: #45a049;
        }
    </style>
    <script type="text/javascript">
        function scanImage() {
            // Simulate image scanning
            alert('Image scanned successfully! OTP section is now visible.');
            document.getElementById('otpSection').style.display = 'block';
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <!-- Image Section -->
        <div class="image-section">
            <img src="../Image/Courses/MBA.jpeg" alt="Scan Image" onclick="scanImage()" />
        </div>

        <!-- OTP Section -->
        <div class="otp-section" id="otpSection">
            <label for="otpInput">Enter OTP:</label>
            <input type="text" id="otpInput" placeholder="Enter OTP" />
            <br />
            <button type="button" onclick="alert('OTP Submitted')">Submit</button>
        </div>
    </div>
    <br /> <br /> <br />
</asp:Content>