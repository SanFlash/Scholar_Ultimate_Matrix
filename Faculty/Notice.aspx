<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Faculty.master" AutoEventWireup="true" CodeFile="Notice.aspx.cs" Inherits="Faculty_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        /* Center the notification container */
        .notification-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        /* Style for the heading */
        .notification-container h2 {
            color: #333;
            font-size: 1.8em;
            margin-bottom: 15px;
            text-align: center;
            font-weight: bold;
        }

        /* Style the GridView */
        .gridview-container {
            margin: auto;
            border-collapse: collapse;
        }

        /* Styling each GridView header */
        .gridview-container th {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            font-size: 1em;
            text-align: center;
        }

        /* Styling each GridView cell */
        .gridview-container td {
            padding: 10px;
            border: 1px solid #ddd;
            font-size: 0.9em;
            text-align: center;
            color: #333;
        }

        /* Hover effect on rows */
        .gridview-container tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="notification-container">
        <h2>Faculty Notifications</h2>
        <asp:GridView ID="GridViewNotifications" runat="server" 
            AutoGenerateColumns="False" GridLines="None" CssClass="gridview-container" 
            Width="950px">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Msg" HeaderText="Message" />
                <asp:BoundField DataField="PostedDate" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

