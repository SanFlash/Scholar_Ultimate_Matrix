<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Faculty.master" AutoEventWireup="true" CodeFile="StudyM.aspx.cs" Inherits="Faculty_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
        .upload-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .upload-container h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        .form-group input[type="text"], .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-group input[type="checkbox"] {
            margin-right: 5px;
        }
        .upload-btn {
            background-color: #5cb85c;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .upload-btn:hover {
            background-color: #4cae4c;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="upload-container">
        <h2>Upload Study Material</h2>
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
        <div class="form-group">
            <label for="txtTitle">Title</label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtInstructions">Instructions</label>
            <asp:TextBox ID="txtInstructions" TextMode="MultiLine" runat="server" CssClass="form-control" Rows="4"></asp:TextBox>
        </div>
        <div class="form-group" style="text-align:center">
        <table align=center>
            <tr>
                <td >
                    <asp:CheckBox ID="chkAssignment" runat="server" Text="Assignment" />
                </td>

                <td>
                    <asp:CheckBox ID="chkNotes" runat="server" Text="Notes" />
                </td>
            </tr>
        </table>
        </div>
        <div class="form-group">
            <label for="fileUpload">Select File</label>
            <asp:FileUpload ID="fileUpload" runat="server" />
        </div>
        <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="upload-btn" OnClick="btnUpload_Click" />
    </div>
    <br /><br /><br /><br />
</asp:Content>

