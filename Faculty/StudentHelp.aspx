<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Faculty.master" AutoEventWireup="true" CodeFile="StudentHelp.aspx.cs" Inherits="Faculty_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .table-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .table-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-family: Arial, sans-serif;
        }

        .styled-gridview {
            width: 100%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }

        .styled-gridview th, .styled-gridview td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .styled-gridview th {
            background-color: #007bff;
            color: white;
        }

        .styled-gridview tr:hover {
            background-color: #f1f1f1;
        }

        .styled-gridview a {
            color: #007bff;
            text-decoration: none;
        }

        .styled-gridview a:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="table-container">
        <h2>Student Help Leave Requests</h2>
        <asp:GridView ID="gridViewRequests" runat="server" CssClass="styled-gridview" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="RequestID" HeaderText="Request ID" />
                <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
                <asp:BoundField DataField="RequestType" HeaderText="Request Type" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:HyperLinkField DataTextField="DocumentPath" HeaderText="Document" DataNavigateUrlFields="DocumentPath" DataNavigateUrlFormatString="{0}" Text="View Document" />
                <asp:BoundField DataField="RequestDate" HeaderText="Request Date" DataFormatString="{0:MM/dd/yyyy}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

