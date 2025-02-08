<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true"
    CodeFile="Payment.aspx.cs" Inherits="Student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Main container */
        .payment-section {
            margin: 20px auto;
            padding: 40px;
            max-width: 900px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Header styling */
        .payment-section h2 {
            text-align: center;
            font-size: 2em;
            color: #333;
            font-family: 'Arial', sans-serif;
            margin-bottom: 20px;
        }

        /* Labels */
        .payment-section label {
            font-weight: bold;
            font-size: 1.1em;
            color: #555;
        }

        /* Dropdown styling */
        .payment-section select, .payment-section input[type="button"], .payment-section input[type="radio"] {
            padding: 8px 12px;
            font-size: 1em;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-top: 8px;
            width: 100%;
            max-width: 300px;
            display: inline-block;
        }

        /* Gridview styling */
        .payment-section .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .payment-section .table th, .payment-section .table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .payment-section .table th {
            background-color: #f4f4f4;
        }

        /* Button styling */
        .payment-section .btnProceed {
            background-color: #4CAF50;
            color: white;
            font-size: 1.1em;
            border: none;
            padding: 12px 25px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 20px;
            width: 100%;
            max-width: 250px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        /* Button hover effect */
        .payment-section .btnProceed:hover {
            background-color: #45a049;
        }

        /* Installment dropdown */
        .payment-section .installment {
            margin-top: 20px;
        }

        /* Fee and installment info */
        .payment-section .fee-info, .payment-section .installment-info {
            font-size: 1.2em;
            color: #333;
            margin-top: 10px;
        }

        /* Radio button styling */
        .payment-section .radio-button {
            margin-left: 15px;
        }

        /* General text */
        .payment-section .note {
            font-size: 1.1em;
            color: #888;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="payment-section">
        <h2>Select Course and Make Payment</h2>

        <!-- Dropdown for selecting courses -->
        <asp:Label ID="lblSelectCourse" runat="server" Text="Select Course:" AssociatedControlID="ddlCourses"></asp:Label>
        <asp:DropDownList ID="ddlCourses" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged">
        </asp:DropDownList>
        <br /><br />

        <!-- GridView for displaying students -->
        <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" CssClass="table" GridLines="None">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:RadioButton ID="rbSelect" runat="server" GroupName="StudentSelector" CssClass="radio-button" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Sname" HeaderText="Student Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
            </Columns>
        </asp:GridView>
        <br />

        <!-- Fee and installment section -->
        <div class="fee-info">
            <asp:Label ID="lblFee" runat="server" Text="Course Fee: "></asp:Label>
            <asp:Label ID="lblCourseFee" runat="server" Text="0.00"></asp:Label>
        </div>
        <br />
        <div class="installment">
            <asp:Label ID="lblInstallment" runat="server" Text="Installment:" AssociatedControlID="ddlInstallment"></asp:Label>
            <asp:DropDownList ID="ddlInstallment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlInstallment_SelectedIndexChanged">
                <asp:ListItem Text="Full Payment" Value="1"></asp:ListItem>
                <asp:ListItem Text="Half Payment" Value="0.5"></asp:ListItem>
                <asp:ListItem Text="Quarter Payment" Value="0.25"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <div class="installment-info">
            <asp:Label ID="lblCalculatedInstallment" runat="server" Text="Calculated Installment: 0.00"></asp:Label>
        </div>
        <br />

        <!-- Button to navigate -->
        <asp:Button ID="btnProceed" runat="server" Text="Proceed to Payment" OnClick="btnProceed_Click" CssClass="btnProceed" />
    </div>
    <br /><br /><br /><br /><br /><br />
</asp:Content>