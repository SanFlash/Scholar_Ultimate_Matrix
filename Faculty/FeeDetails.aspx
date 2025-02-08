<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Faculty.master" AutoEventWireup="true" CodeFile="FeeDetails.aspx.cs" Inherits="Faculty_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* General Container Style */
        .container {
            margin: 40px auto;
            font-family: 'Roboto', sans-serif;
            max-width: 1200px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Heading Style */
        h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 600;
        }

        /* Dropdown Styling */
        .dropdown {
            width: 100%;
            max-width: 300px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            margin: 0 auto;
            display: block;
            transition: border-color 0.3s;
        }

        .dropdown:focus {
            outline: none;
            border-color: #007BFF;
        }

        /* GridView Styling */
        .fee-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        .fee-grid th, .fee-grid td {
            padding: 12px;
            text-align: left;
            font-size: 14px;
            color: #555;
        }

        /* Table Header Style */
        .fee-grid th {
            background-color: #007BFF;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
        }

        /* Table Data Row Style */
        .fee-grid td {
            background-color: #fff;
            border: 1px solid #ddd;
        }

        /* Hover Effect on Table Rows */
        .fee-grid tr:hover td {
            background-color: #f1f1f1;
        }

        /* Table Row Alternating Colors */
        .fee-grid tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        /* Custom Border for the GridView */
        .fee-grid {
            border: 2px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
        }

        /* Footer or Bottom Space */
        .container:after {
            content: '';
            display: block;
            clear: both;
        }

        /* Responsive Media Queries */
        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 15px;
            }

            h2 {
                font-size: 20px;
            }

            .dropdown {
                max-width: 100%;
            }

            .fee-grid th, .fee-grid td {
                font-size: 12px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2>Student Fee Details</h2>
        <asp:DropDownList ID="ddlCourses" CssClass="dropdown" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:GridView ID="gvFeeDetails" runat="server" AutoGenerateColumns="false" CssClass="fee-grid" HeaderStyle-BackColor="#f4f4f4">
            <Columns>
                <asp:BoundField DataField="PaymentId" HeaderText="Payment ID" />
                <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                <asp:BoundField DataField="InstallmentAmount" HeaderText="Installment Amount" DataFormatString="{0:C}" />
                <asp:BoundField DataField="InstallmentPlan" HeaderText="Installment Plan" />
                <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" DataFormatString="{0:dd/MM/yyyy}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>