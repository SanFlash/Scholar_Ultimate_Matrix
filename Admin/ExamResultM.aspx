<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ExamResultM.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .result-container {
            padding: 20px;
            background-color: #f9f9f9;
            margin: auto;
            max-width: 90%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
        }

        .gridview th, .gridview td {
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .gridview th {
            background-color: #007BFF;
            color: white;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="result-container">
        <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="false" CssClass="gridview">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Student ID" />
                <asp:BoundField DataField="Sname" HeaderText="Student Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="subject1" HeaderText="Subject 1" />
                <asp:BoundField DataField="subject2" HeaderText="Subject 2" />
                <asp:BoundField DataField="subject3" HeaderText="Subject 3" />
                <asp:BoundField DataField="subject4" HeaderText="Subject 4" />
                <asp:BoundField DataField="subject5" HeaderText="Subject 5" />
                <asp:TemplateField HeaderText="Total Marks">
                    <ItemTemplate>
                        <%# Eval("subject1") != null && Eval("subject2") != null && Eval("subject3") != null && Eval("subject4") != null && Eval("subject5") != null ? (Convert.ToInt32(Eval("subject1")) + Convert.ToInt32(Eval("subject2")) + Convert.ToInt32(Eval("subject3")) + Convert.ToInt32(Eval("subject4")) + Convert.ToInt32(Eval("subject5"))).ToString() : "0" %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Percentage">
                    <ItemTemplate>
                        <%# Eval("subject1") != null && Eval("subject2") != null && Eval("subject3") != null && Eval("subject4") != null && Eval("subject5") != null ? ((Convert.ToInt32(Eval("subject1")) + Convert.ToInt32(Eval("subject2")) + Convert.ToInt32(Eval("subject3")) + Convert.ToInt32(Eval("subject4")) + Convert.ToInt32(Eval("subject5"))) / 5.0).ToString("F2") + "%" : "0%" %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

