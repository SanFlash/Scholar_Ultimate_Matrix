<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="PaymentDetail.aspx.cs" Inherits="Student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Main container styling */
        .payment-detail {
            margin: 20px auto;
            padding: 40px;
            max-width: 900px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Header styling */
        .payment-detail h2 {
            text-align: center;
            font-size: 2em;
            color: #333;
            font-family: 'Arial', sans-serif;
            margin-bottom: 30px;
        }

        /* Paragraph styling for detail labels */
        .payment-detail p {
            font-size: 1.2em;
            color: #555;
            margin-bottom: 15px;
        }

        .payment-detail strong {
            font-weight: bold;
            color: #333;
        }

        /* Button styling */
        .payment-detail .btnConfirmPayment {
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
        .payment-detail .btnConfirmPayment:hover {
            background-color: #45a049;
        }

        /* General text */
        .payment-detail .note {
            font-size: 1.1em;
            color: #888;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="payment-detail">
        <h2>Payment Details</h2>

        <p><strong>Selected Student:</strong> <asp:Label ID="lblSelectedStudent" runat="server"></asp:Label></p>
        <p><strong>Installment Type:</strong> <asp:Label ID="lblInstallment" runat="server"></asp:Label></p>
        <p><strong>Calculated Installment:</strong> <asp:Label ID="lblCalculatedInstallment" runat="server"></asp:Label></p>
        
    <div style="text-align:center"><asp:Image ID="Image1" runat="server" ImageUrl="../Image/Courses/MBA.jpeg"/></div>
        
        <!-- Confirm Payment Button -->
        <asp:Button ID="btnConfirmPayment" runat="server" Text="Complete Payment" OnClick="btnConfirmPayment_Click" CssClass="btnConfirmPayment" />
    </div>
</asp:Content>