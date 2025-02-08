using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Admin_Default5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridViews();
        }
    }

    private void BindGridViews()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            // Bind Students
            using (SqlCommand cmd = new SqlCommand("SELECT  id, Sname, Dob, father, course, s10, s12 FROM Student", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvStudents.DataSource = dt;
                    gvStudents.DataBind();
                }
            }

            // Bind Faculty
            using (SqlCommand cmd = new SqlCommand("SELECT FacultyID, FacultyName, Gender, PhoneNumber, Course, Department, FacultyType, Salary FROM  Faculty", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvFaculty.DataSource = dt;
                    gvFaculty.DataBind();
                }
            }

            // Bind Grades
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Grade", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvGrades.DataSource = dt;
                    gvGrades.DataBind();
                }
            }

            // Bind Courses
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Course", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvCourses.DataSource = dt;
                    gvCourses.DataBind();
                }
            }
        }
    }
}