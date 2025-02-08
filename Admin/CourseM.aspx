<%@ Page Title="Course Management" Language="C#" MasterPageFile="~/Admin/Admin.master"
    AutoEventWireup="true" CodeFile="CourseM.aspx.cs" Inherits="Admin_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" href="StyleSheet.css" />
    <style type="text/css">
        /* Basic styling for the management page */
        body {
            max-width: 100%;
            margin: auto;
            padding: 0px;
            background-color: #f9f9f9;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        /* Animation for fading in the content */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Styling for input forms */
        form {
            display: flex;
            flex-direction: column;
            gap: 0px;
        }

        label {
            font-size: 16px;
            color: #555;
        }

        input, textarea, select {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: all 0.3s;
            margin-left: 0px;
        }

        input:focus, textarea:focus, select:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
        }

        /* Styling for buttons */
        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        /* Styling for data table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            animation: fadeIn 1s ease-in-out;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;
        width: 100%;">
        <h2>
            Course Management</h2>
        <table cellpadding="10" style="max-width: 600px;">
            <!-- Course ID -->
            <!-- Course Name -->
            <tr>
                <td>
                    <label for="courseName">
                        Course Name:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" Width="100%" />
                </td>
            </tr>
            <!-- Department -->
            <tr>
                <td>
                    <label for="department">
                        Department:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control" Width="100%" />
                </td>
            </tr>
            <!-- Course Duration -->
            <tr>
                <td>
                    <label for="duration">
                        Course Duration (months):</label>
                </td>
                <td>
                    <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" TextMode="Number"
                        Width="100%" />
                </td>
            </tr>
            <!-- Course Fee -->
            <tr>
                <td>
                    <label for="fee">
                        Course Fee (INR):</label>
                </td>
                <td>
                    <asp:TextBox ID="txtFee" runat="server" CssClass="form-control" TextMode="Number"
                        Width="100%" />
                </td>
            </tr>
            <!-- Course Description -->
            <tr>
                <td>
                    <label for="description">
                        Course Description:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"
                        Rows="4" Width="100%" />
                </td>
            </tr>
            <!-- Status -->
            <tr>
                <td>
                    <label for="status">
                        Status:</label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" Width="100%">
                        <asp:ListItem Text="Select" Value="" />
                        <asp:ListItem Text="Active" Value="Active" />
                        <asp:ListItem Text="Inactive" Value="Inactive" />
                    </asp:DropDownList>
                </td>
            </tr>
            <!-- Available Faculty -->
            <tr>
                <td>
                    <label for="availableFaculty">
                        Available Faculty:</label>
                </td>
                <td>
                    <asp:RadioButtonList ID="rblAvailableFaculty" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="rblAvailableFaculty_SelectedIndexChanged">
                        <asp:ListItem Text="Yes" Value="Yes" />
                        <asp:ListItem Text="No" Value="No" />
                    </asp:RadioButtonList>
                </td>
            </tr>
            <!-- Faculty Dropdown -->
            <tr id="facultyDropdownRow" runat="server" visible="false">
                <td>
                    <label for="facultyList">
                        Select Faculty:</label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlFacultyList" runat="server" CssClass="form-control" Width="100%">
                        <asp:ListItem Text="Select Faculty" Value="" />
                    </asp:DropDownList>
                </td>
            </tr>
            <!-- Buttons -->
            <tr>
                <td colspan="2" align="center" style="text-align: center">
                    <asp:Button ID="btnAddCourse" runat="server" Text="Add Course" CssClass="btn" OnClick="btnAddCourse_Click" />
                    <asp:Button ID="btnClearFields" runat="server" Text="Clear Fields" CssClass="btn" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblMessage" runat="server" CssClass="message" ForeColor="Green"></asp:Label>
                </td>
            </tr>
        </table>
        <!-- Displaying Course List -->
        <h3 style="text-align: center; margin-top: 20px;">
            Existing Courses</h3>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseId"
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="CourseId" HeaderText="CourseId" InsertVisible="False"
                        ReadOnly="True" SortExpression="CourseId" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                    <asp:BoundField DataField="Fee" HeaderText="Fee" SortExpression="Fee" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="FacultyId" HeaderText="FacultyId" SortExpression="FacultyId" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                    <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TouchSkyDesireConnectionString %>"
                SelectCommand="SELECT * FROM [Course]" DeleteCommand="DELETE FROM [Course] WHERE CourseId=@CourseId"
                UpdateCommand="UPDATE [Course] SET CourseName=@CourseName, Department=@Department, Duration=@Duration, Fee=@Fee, Description=@Description, Status=@Status, FacultyId=@FacultyId WHERE CourseId=@CourseId">
                <UpdateParameters>
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="Department" Type="String" />
                    <asp:Parameter Name="Duration" Type="String" />
                    <asp:Parameter Name="Fee" Type="Decimal" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="FacultyId" Type="Int32" />
                    <asp:Parameter Name="CourseId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
