<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="~/Student/HelpM.aspx.cs" Inherits="Student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .form-container {
            width: 60%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }

        .form-container h2 {
            text-align: center;
            color: #333;
        }

        .form-container label {
            font-weight: bold;
        }

        .form-container input,
        .form-container textarea,
        .form-container select {
            width: 100%;
            margin-bottom: 15px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-container button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-container button:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-container">
        <h2>Help/Leave Request Form</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        <asp:TextBox ID="txtStudentID" runat="server" Placeholder="Enter your Student ID" Required="true"></asp:TextBox>

        <asp:Label ID="lblRequestType" runat="server" Text="Request Type:"></asp:Label>
        <asp:DropDownList ID="ddlRequestType" runat="server">
            <asp:ListItem Text="Select Request Type" Value="" />
            <asp:ListItem Text="General Help" Value="Help" />
            <asp:ListItem Text="Leave Request" Value="Leave" />
        </asp:DropDownList>

        <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>

        <asp:Label ID="lblDocument" runat="server" Text="Upload Supporting Document (if any):"></asp:Label>
        <asp:FileUpload ID="fuDocument" runat="server" />

        <asp:Button ID="btnSubmit" runat="server" Text="Submit Request" OnClick="btnSubmit_Click" />
    </div>
    <br /><br /><br /><br />
</asp:Content>

