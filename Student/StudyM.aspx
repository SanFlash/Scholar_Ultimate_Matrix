<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true"
    CodeFile="StudyM.aspx.cs" Inherits="Student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .container
        {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            max-width: 1200px;
            margin: 20px auto;
        }
        .search-panels
        {
            flex: 1;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .search-panels h3
        {
            text-align: center;
            font-size: 20px;
            margin-bottom: 15px;
        }
        .search-panels form
        {
            display: flex;
            margin-bottom: 10px;
        }
        .search-panels input
        {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .search-panels button
        {
            padding: 8px 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }
        .search-panels button:hover
        {
            background-color: #0056b3;
        }
        .material-list
        {
            flex: 2;
            padding: 10px;
        }
        .material-item
        {
            padding: 10px;
            background-color: #f1f1f1;
            margin-bottom: 10px;
            border-radius: 5px;
        }
        .material-item h3
        {
            margin: 0;
            font-size: 18px;
        }
        .material-item a
        {
            color: #007bff;
            text-decoration: none;
        }
        .material-item a:hover
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <!-- Study Material List -->
        <div class="material-list">
            <asp:Repeater ID="repeaterMaterials" runat="server">
                <ItemTemplate>
                  s  <div class="material-item">
                        <h3>
                            <%# Eval("Title") %></h3>
                        <p>
                            <%# Eval("Instructions") %></p>
                        <a href='<%# "StudyM.aspx?Download=" + Eval("Id") %>' target="_blank">View / Download</a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
