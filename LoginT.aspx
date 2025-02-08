<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="LoginT.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>OTP Login</title>
    <style>
        /* General page styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom right, #007bff, #6c63ff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
            overflow: hidden;
        }

        /* Animation for the container */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Container for the login form */
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            animation: fadeIn 1s ease-out;
            text-align: center;
        }

        /* Heading */
        h2 {
            color: #007bff;
            margin-bottom: 20px;
            font-size: 24px;
        }

        /* Label styling */
        label {
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
            display: block;
            text-align: left;
        }

        /* Input field styling */
        .input-field {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
            transition: 0.3s;
        }

        .input-field:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* Button styling */
        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #007bff, #6c63ff);
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            text-transform: uppercase;
        }

        .btn:hover {
            background: linear-gradient(to right, #6c63ff, #007bff);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3);
        }

        .btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        /* Animation for OTP section */
        .otp-section {
            opacity: 1;
            transform: scale(0.9);
            transition: all 0.5s ease-in-out;
        }

        .otp-section.active {
            opacity: 1;
            transform: scale(1);
        }

        /* Responsive design */
        @media (max-width: 480px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2>Faculty Login</h2>

        <div>
            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field"></asp:TextBox>
        </div>

        <div>
            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
        </div>

        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn" />
        </div>

        <!-- OTP Section -->
        <div class="otp-section" id="otpSection" runat="server">
            <label for="txtOTP">Enter OTP:</label>
            <asp:TextBox ID="txtOTP" runat="server" CssClass="input-field"></asp:TextBox>
            <asp:Button ID="btnVerifyOTP" runat="server" Text="Verify OTP" OnClick="btnVerifyOTP_Click" CssClass="btn" />
        </div>
    </div>
    <script>
        // Example JavaScript for showing OTP Section
        document.getElementById('<%= btnSubmit.ClientID %>').onclick = function () {
            document.getElementById('otpSection').classList.add('active');
        };
    </script>
</asp:Content>