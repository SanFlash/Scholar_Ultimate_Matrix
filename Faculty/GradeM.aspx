<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Faculty.master" AutoEventWireup="true" CodeFile="GradeM.aspx.cs" Inherits="Faculty_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Page styling */
        .page-content {
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            
            min-height: 100vh;
            background-color: #f5f5f5;
        }

        /* Dropdown styling */
        .dropdown {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 20px;
            text-align: center;
        }

        /* GridView container styling */
        .gridview-container {
            width: 100%;
            max-width: 1100px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        /* GridView styling */
        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th, .gridview td {
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .gridview th {
            background-color: #007BFF;
            color: #fff;
            font-weight: bold;
        }

        .gridview td {
            background-color: #f9f9f9;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview tr:hover {
            background-color: #f1f1f1;
        }

        /* Input styling for grades */
        .gridview input[type="text"] {
            width: 60px;
            text-align: center;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .submit-button {
        display: block;
        margin: 20px auto;
        padding: 10px 20px;
        background-color: #28a745;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
        text-align: center;
    }

    .submit-button:hover {
        background-color: #218838;
        transform: scale(1.05);
    }

    .submit-button:active {
        background-color: #1e7e34;
        transform: scale(1);
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-content">
        <!-- Dropdown for Course Selection -->
        <asp:DropDownList ID="ddlCourses" runat="server" CssClass="dropdown" AutoPostBack="true" 
            OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged">
            <asp:ListItem Text="Select Course" Value="" />
        </asp:DropDownList>

        <!-- GridView to Display Students -->
        <div class="gridview-container">
            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" 
                CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Student ID" />
                    <asp:BoundField DataField="Sname" HeaderText="Student Name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:TemplateField HeaderText="Subject 1">
                        <ItemTemplate>
                            <asp:TextBox ID="txtSubject1" runat="server" Text="0" CssClass="textbox" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject 2">
                        <ItemTemplate>
                            <asp:TextBox ID="txtSubject2" runat="server" Text="0" CssClass="textbox" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject 3">
                        <ItemTemplate>
                            <asp:TextBox ID="txtSubject3" runat="server" Text="0" CssClass="textbox" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject 4">
                        <ItemTemplate>
                            <asp:TextBox ID="txtSubject4" runat="server" Text="0" CssClass="textbox" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subject 5">
                        <ItemTemplate>
                            <asp:TextBox ID="txtSubject5" runat="server" Text="0" CssClass="textbox" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Marks/100">
                <ItemTemplate>
                    <asp:Label ID="lblTotalMarks" runat="server" Text="0" CssClass="total-marks" />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Percentage">
                <ItemTemplate>
                    <asp:Label ID="lblPercentage" runat="server" Text="0%" CssClass="percentage" />
                </ItemTemplate>
            </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Grades" CssClass="submit-button" OnClick="btnSubmit_Click" />
        </div>
        <!-- Success Message -->
        <asp:Label ID="lblMessage" runat="server" CssClass="success-message" Visible="false"></asp:Label>
    </div>
    <br /><br /><br /><br />
</asp:Content>
