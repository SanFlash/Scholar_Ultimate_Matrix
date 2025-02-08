<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="FacultyM.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        /* Basic styling for the management page */
        .faculty-management {
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
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
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
    <br />
    <div class="faculty-management">
        <h2>
            Faculty Management</h2>
        <!-- Form for adding or updating faculty details -->
        <center>
            <table>
            <tr>
            <td style="text-align:center">
                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
            </td>
            </tr>
                <!-- Faculty Name -->
                <tr>
                    <td style="text-align: center;">
                        <label for="Fname">
                            Faculty Name:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtFname" runat="server" CssClass="form-control" Width="80%" />
                    </td>
                </tr>
                <!-- Gender -->
                <tr>
                    <td style="text-align: center;">
                        <label for="gender">
                            Gender:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" Width="80%">
                            <asp:ListItem Text="Select" Value="" />
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <!-- Date of Birth -->
                <tr>
                    <td style="text-align: center;">
                        <label for="Dob">
                            Date of Birth:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtDob" runat="server" CssClass="form-control" TextMode="Date" Width="80%" />
                    </td>
                </tr>
                <!-- Address -->
                <tr>
                    <td style="text-align: center;">
                        <label for="address">
                            Address:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Width="80%" TextMode="MultiLine"
                            Rows="2" />
                    </td>
                </tr>
                <!-- Phone Number -->
                <tr>
                    <td style="text-align: center;">
                        <label for="phone">
                            Phone Number:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Width="80%" TextMode="Phone" />
                    </td>
                </tr>
                <!-- Email -->
                <tr>
                    <td style="text-align: center;">
                        <label for="email">
                            Email:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"
                            Width="80%" />
                    </td>
                </tr>
                <!-- Qualification -->
                <tr>
                    <td style="text-align: center;">
                        <label for="qualification">
                            Qualification:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control" Width="80%" />
                    </td>
                </tr>
                <!-- Department -->
                <tr>
                    <td style="text-align: center;">
                        <label for="department">
                            Department:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control" Width="80%" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <label for="department">
                            Course:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtCourse" runat="server" CssClass="form-control" Width="80%" />
                    </td>
                </tr>
                <!-- Faculty Type -->
                <tr>
                    <td style="text-align: center;">
                        <label for="facultyType">
                            Faculty Type:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:DropDownList ID="ddlFacultyType" runat="server" CssClass="form-control" Width="80%">
                            <asp:ListItem Text="Select" Value="" />
                            <asp:ListItem Text="Full-Time" Value="Full-Time" />
                            <asp:ListItem Text="Part-Time" Value="Part-Time" />
                            <asp:ListItem Text="Visiting" Value="Visiting" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <!-- Years of Experience -->
                <tr>
                    <td style="text-align: center;">
                        <label for="experience">
                            Years of Experience:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" TextMode="Number"
                            Width="80%" />
                    </td>
                </tr>
                <!-- Date of Joining -->
                <tr>
                    <td style="text-align: center;">
                        <label for="joiningDate">
                            Date of Joining:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="form-control" TextMode="Date"
                            Width="80%" />
                    </td>
                </tr>
                <!-- Salary -->
                <tr>
                    <td style="text-align: center;">
                        <label for="salary">
                            Salary:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" Width="80%" TextMode="Number" />
                    </td>
                </tr>
                <!-- Photo Upload -->
                <tr>
                    <td style="text-align: center;">
                        <label for="photo">
                            Photo:</label>
                    </td>
                    <td style="text-align: center;">
                        <asp:FileUpload ID="fileUploadPhoto" runat="server" CssClass="form-control" Width="80%" />
                    </td>
                </tr>
                <!-- Buttons -->
                <tr>
                    <td colspan="2" align="center">
                        <div class="buttons">
                            <asp:Button ID="btnAdd" runat="server" Text="Add Faculty" CssClass="btn" 
                                onclick="btnAdd_Click" />
                            <asp:Button ID="reset" runat="server" Text="Reset" CssClass="btn" 
                                onclick="reset_Click" />
                        </div>
                    </td>
                </tr>
            </table>
        </center>
        <!-- Table to display faculty records -->
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="FacultyID" DataSourceID="SqlDataSource1" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="FacultyID" HeaderText="FacultyID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="FacultyID" />
                <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" 
                    SortExpression="FacultyName" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" 
                    SortExpression="DateOfBirth" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" 
                    SortExpression="PhoneNumber" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Qualification" HeaderText="Qualification" 
                    SortExpression="Qualification" />
                <asp:BoundField DataField="Department" HeaderText="Department" 
                    SortExpression="Department" />
                <asp:BoundField DataField="FacultyType" HeaderText="FacultyType" 
                    SortExpression="FacultyType" />
                <asp:BoundField DataField="Experience" HeaderText="Experience" 
                    SortExpression="Experience" />
                <asp:BoundField DataField="DateOfJoining" HeaderText="DateOfJoining" 
                    SortExpression="DateOfJoining" />
                <asp:BoundField DataField="Salary" HeaderText="Salary" 
                    SortExpression="Salary" />
                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" 
                    ShowHeader="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>  
        <!-- SQL Data Source -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:TouchSkyDesireConnectionString %>" 
    SelectCommand="SELECT * FROM [Faculty]" 
    DeleteCommand="DELETE FROM [Faculty] WHERE FacultyID=@FacultyID" 
    UpdateCommand="UPDATE [dbo].[Faculty] SET 
                        [FacultyName] = @FacultyName,
                        [Gender] = @Gender,
                        [DateOfBirth] = @DateOfBirth,
                        [Address] = @Address,
                        [PhoneNumber] = @PhoneNumber,
                        [Email] = @Email,
                        [Qualification] = @Qualification,
                        [Department] = @Department,
                        [FacultyType] = @FacultyType,
                        [Experience] = @Experience,
                        [DateOfJoining] = @DateOfJoining,
                        [Salary] = @Salary
                    WHERE 
                        [FacultyID] = @FacultyID;">
    <UpdateParameters>
        <asp:Parameter Name="FacultyID" Type="Int32" />
        <asp:Parameter Name="FacultyName" Type="String" />
        <asp:Parameter Name="Gender" Type="String" />
        <asp:Parameter Name="DateOfBirth" Type="DateTime" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="PhoneNumber" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Qualification" Type="String" />
        <asp:Parameter Name="Department" Type="String" />
        <asp:Parameter Name="FacultyType" Type="String" />
        <asp:Parameter Name="Experience" Type="String" />
        <asp:Parameter Name="DateOfJoining" Type="DateTime" />
        <asp:Parameter Name="Salary" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>

    </div>
</asp:Content>
