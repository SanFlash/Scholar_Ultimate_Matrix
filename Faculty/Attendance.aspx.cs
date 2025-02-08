using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Faculty_Default : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCourses();
        }
    }

    // Load courses into dropdown
    private void LoadCourses()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT CourseId, CourseName FROM Course WHERE Status = 'Active'", conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            ddlCourses.DataSource = reader;
            ddlCourses.DataTextField = "CourseName";
            ddlCourses.DataValueField = "CourseId";
            ddlCourses.DataBind();
        }
        ddlCourses.Items.Insert(0, new ListItem("--Select Course--", "0"));
    }

    // Load students when course is selected
    protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCourses.SelectedValue != "0")
        {
            LoadStudents(int.Parse(ddlCourses.SelectedValue));
        }
        else
        {
            pnlStudents.Visible = false;
        }
    }

    private void LoadStudents(int courseId)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT id, Sname FROM Student WHERE course = (SELECT CourseName FROM Course WHERE CourseId = @CourseId)",
                conn);
            cmd.Parameters.AddWithValue("@CourseId", courseId);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);

            if (dt.Rows.Count > 0)
            {
                rptStudents.DataSource = dt;
                rptStudents.DataBind();
                pnlStudents.Visible = true;
                lblMessage.Visible = true;
                lblMessage.Text = "Attendance:";
                lblError.Visible = false;
            }
            else
            {
                lblMessage.Visible = false;
                lblError.Visible = true;
                lblError.Text = "No students found for the selected course.";
                pnlStudents.Visible = false;
            }
        }
    }

    // Save attendance to the database
    protected void btnSaveAttendance_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                foreach (RepeaterItem item in rptStudents.Items)
                {
                    // Retrieve student ID and attendance status
                    HiddenField hfStudentID = item.FindControl("hfStudentID") as HiddenField;
                    RadioButtonList rblAttendance = item.FindControl("rblAttendance") as RadioButtonList;

                    if (hfStudentID != null && rblAttendance != null)
                    {
                        int studentId = int.Parse(hfStudentID.Value);
                        string attendanceStatus = rblAttendance.SelectedValue;

                        SqlCommand cmd = new SqlCommand(
                            "INSERT INTO Attendance (StudentID, CourseID, AttendanceStatus, AttendanceDate) VALUES (@StudentID, @CourseID, @AttendanceStatus, @AttendanceDate)",
                            conn);
                        cmd.Parameters.AddWithValue("@StudentID", studentId);
                        cmd.Parameters.AddWithValue("@CourseID", ddlCourses.SelectedValue);
                        cmd.Parameters.AddWithValue("@AttendanceStatus", attendanceStatus);
                        cmd.Parameters.AddWithValue("@AttendanceDate", DateTime.Now);

                        cmd.ExecuteNonQuery();
                    }
                }
                lblMessage.Text = "Attendance saved successfully.";
                lblError.Visible = false;
            }
        }
        catch (Exception ex)
        {
            lblError.Visible = true;
            lblError.Text = "Error: " + ex.Message;
        }
    }
}