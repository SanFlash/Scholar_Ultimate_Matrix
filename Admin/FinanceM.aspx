<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="FinanceM.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .filter-container {
            text-align: center;
            margin: 20px 0;
        }
        .grid-container {
            margin: 20px auto;
            width: 95%;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .grid-title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
        }
        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .gridview th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="filter-container">
        <asp:Label ID="lblCourse" runat="server" Text="Filter by Course: " CssClass="filter-label"></asp:Label>
        <asp:DropDownList ID="ddlCourses" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged">
        </asp:DropDownList>
    </div>

    <div class="grid-container">
        <div class="grid-title">Fee Payment Details</div>
        <asp:GridView ID="gvFeeDetails" runat="server" CssClass="gridview" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvFeeDetails_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="PaymentId" HeaderText="Payment ID" />
                <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                <asp:BoundField DataField="InstallmentAmount" HeaderText="Installment Amount" DataFormatString="{0:C}" />
                <asp:BoundField DataField="CourseId" HeaderText="Course ID" />
                <asp:BoundField DataField="InstallmentPlan" HeaderText="Installment Plan" />
                <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" DataFormatString="{0:dd-MM-yyyy}" />
            </Columns>
        </asp:GridView>
    </div>
    <br /><br /><br /><br />
</asp:Content>