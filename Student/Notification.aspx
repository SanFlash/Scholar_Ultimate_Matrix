<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="Notification.aspx.cs" Inherits="Student_Default" %>

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

        /* Fee reminder popup styling */
        .fee-reminder-popup {
            display: none; /* Hidden by default */
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 2px solid #4CAF50;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            width: 80%;
            max-width: 400px;
            text-align: center;
        }

        /* Background overlay for popup */
        .popup-overlay {
            display: none; /* Hidden by default */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .close-btn {
            margin-top: 15px;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
    </style>

    <script type="text/javascript">
        // Show fee reminder popup on the 1st of every month
        window.onload = function () {
            var today = new Date();
            if (today.getDate() === 1) {
                document.getElementById("popupOverlay").style.display = "block";
                document.getElementById("feeReminderPopup").style.display = "block";
            }
        };

        // Close the popup
        function closePopup() {
            document.getElementById("popupOverlay").style.display = "none";
            document.getElementById("feeReminderPopup").style.display = "none";
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="notification-container">
        <h2>Student Notifications</h2>
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

    <!-- Background overlay for popup -->
    <div id="popupOverlay" class="popup-overlay" onclick="closePopup()"></div>

    <!-- Fee Reminder Popup -->
    <div id="feeReminderPopup" class="fee-reminder-popup">
        <h3>Fee Reminder</h3>
        <p>This is a reminder that your fees are due. Please ensure payment is made promptly.</p>
        <button class="close-btn" onclick="closePopup()">Close</button>
    </div>
</asp:Content>
