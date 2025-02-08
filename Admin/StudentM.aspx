<%@ Page Title="Student Management" Language="C#" MasterPageFile="~/Admin/Admin.master"
    AutoEventWireup="true" CodeFile="StudentM.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        /* Basic styling for the management page */
        .student-management {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
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
            gap: 10px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="student-management">
        <h2>
            Student Management</h2>
        <!-- Form for adding or updating student details -->
        <center>
            <table>
                <tr style="text-align: center">
                    <td style="text-align: center">
                        <label for="Sname">
                            Student Name:</label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtSname" runat="server" CssClass="form-control" Width="40%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <label for="Dob">
                            Date of Birth:</label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtDob" runat="server" CssClass="form-control" TextMode="Date" Width="40%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <label for="father">
                            Father's Name:</label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtFather" runat="server" CssClass="form-control" Width="40%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <label for="mother">
                            Mother's Name:</label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtMother" runat="server" CssClass="form-control" Width="40%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <label for="address">
                            Address:</label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control"
                            Width="40%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <label for="course">
                            Course:</label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtCourse" runat="server" CssClass="form-control" Width="40%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <label for="email">
                            Email:</label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"
                            Width="40%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <label for="photo">
                            Upload Photo:</label>
                    </td>
                    <td style="text-align: center">
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" Width="40%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; padding-right: 10px;">
                        <label for="txtS10">
                            10th Grade Score:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtS10" runat="server" CssClass="form-control" Width="40%" Placeholder="Enter 10th Grade Score"></asp:TextBox>
                    </td>
                </tr>
                <!-- 12th Grade Score (txtS12) -->
                <tr>
                    <td style="text-align: center; padding-right: 10px;">
                        <label for="txtS12">
                            12th Grade Score:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtS12" runat="server" CssClass="form-control" Width="40%" Placeholder="Enter 12th Grade Score"></asp:TextBox>
                    </td>
                </tr>
                <!-- Enrolled (Checkbox - txtEnrolled) -->
                <tr>
                    <td style="text-align: center; padding-right: 10px;">
                        <label for="txtEnrolled">
                            Enrolled:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:CheckBox ID="txtEnrolled" runat="server" CssClass="form-control" />
                    </td>
                </tr>
                <asp:Label ID="lblmsg" runat="server" Text="Label" ForeColor="Green"></asp:Label>
                <tr>
                    <td colspan="2" align="center">
                        <div class="buttons">
                            <asp:Button ID="btnAdd" runat="server" Text="Add Student" CssClass="btn" OnClick="btnAdd_Click1" />
                            <asp:Button ID="btnRest" runat="server" Text="Reset" CssClass="btn" OnClick="btnRest_Click" />
                            
                        </div>
                    </td>
                </tr>
            </table>
        </center>
        <!-- Table to display student records -->
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="Sname" HeaderText="Sname" SortExpression="Sname" />
                <asp:BoundField DataField="Dob" HeaderText="Dob" SortExpression="Dob" />
                <asp:BoundField DataField="father" HeaderText="father" SortExpression="father" />
                <asp:BoundField DataField="mother" HeaderText="mother" SortExpression="mother" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="course" HeaderText="course" SortExpression="course" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="s10" HeaderText="s10" SortExpression="s10" />
                <asp:BoundField DataField="s12" HeaderText="s12" SortExpression="s12" />
                <asp:CheckBoxField DataField="enrolled" HeaderText="enrolled" SortExpression="enrolled" />
                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TouchSkyDesireConnectionString %>"
            SelectCommand="SELECT * FROM [Student]" DeleteCommand="DELETE FROM [Student] WHERE id=@id"
            UpdateCommand="UPDATE [dbo].[Student] SET 
                        [Sname] = @Sname,
                        [Dob] = @Dob,
                        [father] = @father,
                        [mother] = @mother,
                        [address] = @address,
                        [course] = @course,
                        [email] = @Email,
                        [s10] = @s10,
                        [s12] = @s12,
                        [enrolled] = @enrolled
                    WHERE 
                        [id] = @id;">
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="Sname" Type="String" />
                <asp:Parameter Name="Dob" Type="DateTime" />
                <asp:Parameter Name="father" Type="String" />
                <asp:Parameter Name="mother" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="course" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="s10" Type="String" />
                <asp:Parameter Name="s12" Type="String" />
                <asp:Parameter Name="enrolled" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
