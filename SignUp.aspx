<%@ Page Title="" Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        body {
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 10%;
            font-family: 'Arial', sans-serif;
        }

        .signup-container {
            background-color: #fff;
            margin:10% 10% 10% 15%; 
            border-radius: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 933px;
            max-width: 100%; /* Ensure responsiveness */
            animation: slide-in 0.8s ease-out; /* Animation */
            display: flex; /* Center content within the container */
            flex-direction: column; /* Arrange children vertically */
            align-items: center; /* Center children horizontally */
        }

        @keyframes slide-in {
            from {
                transform: translateY(-30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .signup-container h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .signup-container input[type="text"],
        .signup-container input[type="password"],
        .signup-container input[type="email"] {
            padding: 10px;
            margin: 10px 0;
            border: 2px solid #ccc;
            border-radius: 15px;
            font-size: 16px;
        }

        .signup-container input[type="text"]:focus,
        .signup-container input[type="password"]:focus,
        .signup-container input[type="email"]:focus {
            border-color: #4a90e2;
            outline: none;
            box-shadow: 0 0 5px rgba(74, 144, 226, 0.5);
        }

        .signup-container button {
            width: 100%;
            padding: 10px;
            background-color: #4a90e2;
            border: none;
            border-radius: 10px;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 15px;
        }

        .signup-container button:hover {
            background-color: #357abd;
        }

        .signup-container .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .signup-container .login-link a {
            color: #4a90e2;
            text-decoration: none;
        }

        .signup-container .login-link a:hover {
            text-decoration: underline;
        }
        
        .btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 10px;
            text-align:center;
            margin-left: 1.5px;
        }
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="signup-container" style="width:60%">
        <div style="width:100%">
            <h2>Create Account</h2>
            <asp:DropDownList ID="DropDownList1" runat="server" style="margin-left: 0px" 
                Width="100%" class="form-control">
                
                <asp:ListItem>Faculty</asp:ListItem>
                <asp:ListItem>Student</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtUsername" runat="server" class="form-control" 
                placeholder="Username" TextMode="SingleLine" Width="98%"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" class="form-control" 
                placeholder="Email" TextMode="Email" Width="98%"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" class="form-control" 
                placeholder="Password" TextMode="Password" Width="98%"></asp:TextBox>
            <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control" 
                placeholder="Confirm Password" TextMode="Password" Width="98%"></asp:TextBox>
            <asp:TextBox ID="txtsecurityquestion" runat="server" class="form-control" 
                placeholder="Securityquestion" TextMode="SingleLine" Width="98%"></asp:TextBox>
             <asp:TextBox ID="txtsecurityanswer" runat="server" class="form-control" 
                placeholder="Securityanswer" TextMode="SingleLine" Width="98%"></asp:TextBox>
            <asp:TextBox ID="txtnumber" runat="server" class="form-control" 
                placeholder="Number" TextMode="SingleLine" Width="98%"></asp:TextBox>
            <div>
                <asp:Label ID="lblmsg" runat="server" Text="Label" Visible=false></asp:Label>
            </div>
            <br />
            <div style="text-align:center; margin-left: 16px;">
                <asp:Button ID="btnSignUp" runat="server" class="btn" Text="Sign Up" 
                    OnClick="btnSignUp_Click" Width="100%" />
            </div>

            <div class="login-link">
                <a href="Login.aspx">Already have an account? Log in</a>
            </div>
        </div>
    </div>
    
</asp:Content>
