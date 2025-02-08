<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="AllAttendance.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Center the GridView and sections */
        .grid-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        /* Style for the GridView */
        .custom-gridview {
            border-collapse: collapse;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
            margin: 0 auto;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .custom-gridview th {
            background-color: #3A6EA5;
            color: white;
            padding: 10px;
            text-align: center;
            font-weight: bold;
        }

        .custom-gridview td {
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
        }

        .custom-gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .custom-gridview tr:hover {
            background-color: #ddd;
        }

        .section {
            width: 80%;
            margin-bottom: 20px;
        }

        .section h3 {
            color: #3A6EA5;
            margin-bottom: 10px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .btn {
            background-color: #3A6EA5;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #2c578c;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="grid-container">
        <!-- Search Section -->
        <div class="section">
            <h3>Search Attendance</h3>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Enter Student ID or Course ID"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" CssClass="btn" Text="Search" OnClick="btnSearch_Click" />
        </div>

        <!-- Filter Section -->
        <div class="section">
            <h3>Filter by Attendance Status</h3>
            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                <asp:ListItem Text="All" Value="All" />
                <asp:ListItem Text="Present" Value="Present" />
                <asp:ListItem Text="Absent" Value="Absent" />
                <asp:ListItem Text="Leave" Value="Leave" />
            </asp:DropDownList>
        </div>

        <!-- Date Filter Section -->
        <div class="section">
            <h3>Filter by Date</h3>
            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" Placeholder="Enter Date (yyyy-MM-dd)" TextMode="Date"></asp:TextBox>
            <asp:Button ID="btnDateFilter" runat="server" CssClass="btn" Text="Filter by Date" OnClick="btnDateFilter_Click" />
        </div>

        <!-- GridView Section -->
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CssClass="custom-gridview"
            DataKeyNames="AttendanceID" DataSourceID="SqlDataSource1" GridLines="None">
            <AlternatingRowStyle BackColor="#f2f2f2" />
            <Columns>
                <asp:BoundField DataField="AttendanceID" HeaderText="Attendance ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="AttendanceID" />
                <asp:BoundField DataField="StudentID" HeaderText="Student ID" 
                    SortExpression="StudentID" />
                <asp:BoundField DataField="CourseID" HeaderText="Course ID" 
                    SortExpression="CourseID" />
                <asp:BoundField DataField="AttendanceStatus" HeaderText="Attendance Status" 
                    SortExpression="AttendanceStatus" />
                <asp:BoundField DataField="AttendanceDate" HeaderText="Attendance Date" 
                    SortExpression="AttendanceDate" />
            </Columns>
        </asp:GridView>

        <!-- Attendance Count Section -->
        <div class="section">
            <h3>Attendance Summary</h3>
            <asp:Label ID="lblTotalPresent" runat="server" Text="Total Present: "></asp:Label><br />
            <asp:Label ID="lblTotalAbsent" runat="server" Text="Total Absent: "></asp:Label><br />
            <asp:Label ID="lblTotalLeave" runat="server" Text="Total Leave: "></asp:Label><br />
            <asp:Label ID="lblIndividualAttendance" runat="server" Text="Individual Attendance: "></asp:Label>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TouchSkyDesireConnectionString %>" 
        SelectCommand="SELECT * FROM [Attendance]"></asp:SqlDataSource>
</asp:Content>
