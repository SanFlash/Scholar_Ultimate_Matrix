<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="NotificationM.aspx.cs" Inherits="Admin_Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

        /* Notification animation */
        .notification {
            animation: slideIn 1s ease-in-out;
            border: 1px solid #007bff;
            border-radius: 5px;
            padding: 10px;
            margin-top: 10px;
            background-color: #e6f0ff;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        /* Centering the entire content area */
        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        /* Centering form panel items */
        .notification-form {
            width: 50%; /* Adjust width as needed */
            margin: auto;
        }

        /* Style the GridView to align to center */
        #GridViewNotifications {
            width: 80%; /* Adjust width as needed */
            margin: 20px auto;
        }
    </style>

    <div class="center-content">
        <h2>Admin - Create Notification</h2>

        <asp:Panel ID="NotificationPanel" runat="server" CssClass="notification-form">
            <asp:Label ID="lblTitle" runat="server" Text="Title:" AssociatedControlID="txtTitle"></asp:Label>
            <asp:TextBox ID="txtTitle" runat="server" Width="100%"></asp:TextBox>
            <br /><br />

            <asp:Label ID="lblMessage" runat="server" Text="Message:" AssociatedControlID="txtMessage"></asp:Label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" Width="100%"></asp:TextBox>
            <br /><br />

            <asp:Label ID="lblStatus" runat="server" Text="Status:" AssociatedControlID="chkStatus"></asp:Label>
            <asp:CheckBox ID="chkStatus" runat="server" Text="Active" />
            <br /><br />

            <asp:Label ID="lblPages" runat="server" Text="Select Pages to Display:" AssociatedControlID="chkListPages"></asp:Label>
            <asp:CheckBoxList ID="chkListPages" runat="server" RepeatDirection="Vertical">
                <asp:ListItem Value="Student Dashboard">Student Dashboard</asp:ListItem>
                <asp:ListItem Value="Teacher Dashboard">Teacher Dashboard</asp:ListItem>
            </asp:CheckBoxList>
            <br /><br />

            <asp:Button ID="btnPostNotification" runat="server" CssClass="btn" 
                Text="Post Notification" onclick="btnPostNotification_Click" />
            <br />
            <asp:Label ID="lblMessageStatus" runat="server" ForeColor="Green"></asp:Label>
        </asp:Panel>

        <h3>Posted Notifications</h3>
        <asp:GridView ID="GridViewNotifications" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="NiD" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="NiD" HeaderText="NiD" InsertVisible="False" 
                    ReadOnly="True" SortExpression="NiD" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Msg" HeaderText="Msg" SortExpression="Msg" />
                <asp:CheckBoxField DataField="Sts" HeaderText="Sts" SortExpression="Sts" />
                <asp:BoundField DataField="Pages" HeaderText="Pages" SortExpression="Pages" />
                <asp:BoundField DataField="PostedDate" HeaderText="PostedDate" 
                    SortExpression="PostedDate" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" 
                    ShowHeader="True" />
                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:TouchSkyDesireConnectionString %>" 
    SelectCommand="SELECT * FROM [Notice]" 
    DeleteCommand="DELETE FROM [Notice] WHERE NiD = @NiD" 
    UpdateCommand="UPDATE [Notice] SET Title = @Title, Msg = @Msg, Sts = @Sts, Pages = @Pages, PostedDate = @PostedDate WHERE NiD = @NiD">
    
    <DeleteParameters>
        <asp:Parameter Name="NiD" Type="Int32" />
    </DeleteParameters>
    
    <UpdateParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Msg" Type="String" />
        <asp:Parameter Name="Sts" Type="Boolean" />
        <asp:Parameter Name="Pages" Type="String" />
        <asp:Parameter Name="PostedDate" Type="DateTime" />
        <asp:Parameter Name="NiD" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    </div>
    <br /><br />
</asp:Content>
