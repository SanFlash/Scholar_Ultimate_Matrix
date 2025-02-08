<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Faculty.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Faculty_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    body {
        font-family: Arial, sans-serif;
    }

    .content-wrapper {
        display: flex;
        flex-direction: column;
        margin-top: 20px;
        align-items: center;
        min-height: 100vh;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .attendance-table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
    }

    .attendance-table th, .attendance-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    .attendance-table th {
        background-color: #f4f4f4;
    }

    .form-group {
        margin: 15px 0;
        margin-top:20px;
    }

    .btn-wrapper {
        text-align: center;
        margin-top: 20px;
    }

    asp:Label {
        margin-bottom: 10px;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
        <h2>Mark Attendance</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>

        <div class="form-group">
            <asp:Label ID="lblCourse" runat="server" Text="Select Course: "></asp:Label>
            <asp:DropDownList ID="ddlCourses" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

        <asp:Panel ID="pnlStudents" runat="server" Visible="false">
            <asp:Repeater ID="rptStudents" runat="server">
    <HeaderTemplate>
        <table class="attendance-table">
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Attendance</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <%# Eval("id") %>
                <asp:HiddenField ID="hfStudentID" runat="server" Value='<%# Eval("id") %>' />
            </td>
            <td><%# Eval("Sname") %></td>
            <td>
                <asp:RadioButtonList ID="rblAttendance" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Present" Value="Present"></asp:ListItem>
                    <asp:ListItem Text="Absent" Value="Absent"></asp:ListItem>
                    <asp:ListItem Text="Leave" Value="Leave"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
        <div class="btn-wrapper">
            <asp:Button ID="btnSaveAttendance" runat="server" Text="Save Attendance" OnClick="btnSaveAttendance_Click" />
        </div>
    </FooterTemplate>
</asp:Repeater>
        </asp:Panel>
    </div>
    <br /> <br /> <br /> <br />
</asp:Content>
