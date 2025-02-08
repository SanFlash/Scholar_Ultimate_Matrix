<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true"
    CodeFile="ReportCard.aspx.cs" Inherits="Student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Student Report Card</title>
    <style>
        body
        {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }
        .container
        {
            width: 80%;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        h2
        {
            text-align: center;
            color: #333;
        }
        .input-group
        {
            margin-bottom: 20px;
            text-align: center;
        }
        .input-group input
        {
            padding: 10px;
            font-size: 16px;
            margin: 5px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .input-group button
        {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }
        .input-group button:hover
        {
            background-color: #45a049;
        }
        hr
        {
            margin-top: 30px;
            border-top: 2px solid #4CAF50;
        }
        .student-info
        {
            margin: 20px 0;
        }
        .student-info img
        {
            display: block;
            margin: 0 auto 10px;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 2px solid #ccc;
            object-fit: cover;
        }
        .student-details
        {
            text-align: center;
            font-size: 16px;
            color: #333;
        }
        .student-details p
        {
            margin: 5px 0;
        }
        .marksheet-table
        {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #f9f9f9;
        }
        .marksheet-table th, .marksheet-table td
        {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        .marksheet-table th, .marksheet-table td
        {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        
        .marksheet-table th
        {
            background-color: #4CAF50;
            color: white;
        }
        .marksheet-table td
        {
            color: #333;
        }
        
        
        
        
        
        .result-table
        {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #f9f9f9;
        }
        .result-table th, .result-table td
        {
            padding: 12px;
            text-align: center;
            border: 0px solid #ddd;
        }
        .result-table th, .result-table td
        {
            padding: 12px;
            text-align: center;
            border: 0px solid #ddd;
        }
        
        .result-table th
        {
            text-align:center;
            background-color: #4CAF50;
            color: white;
        }
        .result-table td
        {
            color: #333;
        }
        
        
        
        .panel-header
        {
            text-align: center;
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <h2>
            Student Report Card</h2>
        <div class="input-group">
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email"></asp:TextBox>
            <asp:TextBox ID="txtRollId" runat="server" placeholder="Enter Roll ID"></asp:TextBox>
            <asp:Button ID="btnSubmit" Text="View Marks" OnClick="btnSubmit_Click" runat="server" />
        </div>
        <hr />
        <asp:Panel ID="pnlMarksheet" runat="server" Visible="false">
            <div class="student-info">
                <asp:Image ID="imgStudentPhoto" runat="server" />
                <div class="student-details">
                    <p>
                        <strong>Name:</strong>
                        <asp:Label ID="lblStudentName" runat="server"></asp:Label></p>
                    <p>
                        <strong>Date of Birth:</strong>
                        <asp:Label ID="lblDob" runat="server"></asp:Label></p>
                    <p>
                        <strong>Department:</strong>
                        <asp:Label ID="lblDepartment" runat="server"></asp:Label></p>
                    <p>
                        <strong>Course:</strong>
                        <asp:Label ID="lblCourse" runat="server"></asp:Label></p>
                </div>
            </div>
            <table class="marksheet-table">
                <thead>
                    <tr>
                        <th>
                            Subject
                        </th>
                        <th>
                            Marks
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            Subject 1
                        </td>
                        <td>
                            <asp:Label ID="lblSubject1" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Subject 2
                        </td>
                        <td>
                            <asp:Label ID="lblSubject2" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Subject 3
                        </td>
                        <td>
                            <asp:Label ID="lblSubject3" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Subject 4
                        </td>
                        <td>
                            <asp:Label ID="lblSubject4" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Subject 5
                        </td>
                        <td>
                            <asp:Label ID="lblSubject5" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Total</strong>
                        </td>
                        <td>
                            <asp:Label ID="lblTotal" runat="server"></asp:Label>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
            <table class="result-table" border="0">
                <thead>
                <tr>
                    <th colspan='2'>
                        Result
                    </th>
                    
                 </tr>
                </thead>
                <tbody>
                <tr>
                        <td>
                            <strong>Percentage</strong>
                        </td>
                        <td>
                            <asp:Label ID="lblPercentage" runat="server"></asp:Label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel>
    </div>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
