<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AllData.aspx.cs" Inherits="Admin_Default5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        /* Menu Styling */
        .menu {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
            margin: 0;
            background-color: #1e293b;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .menu li {
            padding: 15px 25px;
            cursor: pointer;
            color: #ffffff;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .menu li:hover {
            background-color: #0f172a;
            color: #38bdf8;
        }

        .menu li.active {
            background-color: #38bdf8;
            color: #ffffff;
            border-bottom: 3px solid #0f172a;
        }

        /* Content Section Styling */
        .content-section {
            margin: 20px auto;
            padding: 20px;
            max-width: 90%;
            background: #f8fafc;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: none;
        }

        .content-section.active {
            display: block;
        }

        /* GridView Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0px;
            font-size: 16px;
            text-align: center;
        }

        table th,
        table td {
            padding: 5px 10px;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #38bdf8;
            color: #ffffff;
            font-weight: bold;
            text-transform: uppercase;
        }

        table tr:nth-child(even) {
            background-color: #f1f5f9;
        }

        table tr:hover {
            background-color: #e2e8f0;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .menu {
                flex-direction: column;
            }

            .menu li {
                text-align: center;
            }

            .content-section {
                padding: 15px;
                max-width: 95%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="menu" id="menu">
        <li data-target="studentSection">Students</li>
        <li data-target="facultySection">Faculty</li>
        <li data-target="gradeSection">Grades</li>
        <li data-target="courseSection">Courses</li>
    </ul>

    <div class="content-section" id="studentSection">
        <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="true"></asp:GridView>
    </div>
    <div class="content-section" id="facultySection">
        <asp:GridView ID="gvFaculty" runat="server" AutoGenerateColumns="true"></asp:GridView>
    </div>
    <div class="content-section" id="gradeSection">
        <asp:GridView ID="gvGrades" runat="server" AutoGenerateColumns="true"></asp:GridView>
    </div>
    <div class="content-section" id="courseSection">
        <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="true"></asp:GridView>
    </div>

    <script type="text/javascript">
    document.addEventListener("DOMContentLoaded", () => {
        const menuItems = document.querySelectorAll(".menu li");
        const sections = document.querySelectorAll(".content-section");

        menuItems.forEach(item => {
            item.addEventListener("click", () => {
                // Reset all menu items and sections
                menuItems.forEach(i => i.classList.remove("active"));
                sections.forEach(section => section.classList.remove("active"));

                // Activate the clicked menu and corresponding section
                item.classList.add("active");
                document.getElementById(item.getAttribute("data-target")).classList.add("active");
            });
        });

        // Show the first section by default
        menuItems[0].click();
    });
</script>
</asp:Content>