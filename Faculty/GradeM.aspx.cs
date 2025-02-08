using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

public partial class Faculty_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCourses();
        }
    }

    private void BindCourses()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TDS"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT CourseId, CourseName FROM Course", conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            ddlCourses.DataSource = dr;
            ddlCourses.DataTextField = "CourseName";
            ddlCourses.DataValueField = "CourseId";
            ddlCourses.DataBind();
            ddlCourses.Items.Insert(0, new ListItem("Select Course", ""));
        }
    }

    protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlCourses.SelectedValue))
        {
            BindStudents();
        }
    }

    private void BindStudents()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TDS"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT id, Sname, email FROM Student WHERE course = @Course", conn);
            cmd.Parameters.AddWithValue("@Course", ddlCourses.SelectedItem.Text);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            gvStudents.DataSource = dr;
            gvStudents.DataBind();
        }
    }
    protected void gvStudents_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Get the TextBox controls for subjects
            TextBox txtSubject1 = (TextBox)e.Row.FindControl("txtSubject1");
            TextBox txtSubject2 = (TextBox)e.Row.FindControl("txtSubject2");
            TextBox txtSubject3 = (TextBox)e.Row.FindControl("txtSubject3");
            TextBox txtSubject4 = (TextBox)e.Row.FindControl("txtSubject4");
            TextBox txtSubject5 = (TextBox)e.Row.FindControl("txtSubject5");

            // Get the Label controls for total marks and percentage
            Label lblTotalMarks = (Label)e.Row.FindControl("lblTotalMarks");
            Label lblPercentage = (Label)e.Row.FindControl("lblPercentage");

            // Calculate total marks and percentage
            int subject1 = int.TryParse(txtSubject1.Text, out subject1) ? subject1 : 0;
            int subject2 = int.TryParse(txtSubject2.Text, out subject2) ? subject2 : 0;
            int subject3 = int.TryParse(txtSubject3.Text, out subject3) ? subject3 : 0;
            int subject4 = int.TryParse(txtSubject4.Text, out subject4) ? subject4 : 0;
            int subject5 = int.TryParse(txtSubject5.Text, out subject5) ? subject5 : 0;

            int totalMarks = subject1 + subject2 + subject3 + subject4 + subject5;
            double percentage = (totalMarks / 5.0); // Assuming total marks per subject = 100

            // Set the calculated values
            lblTotalMarks.Text = totalMarks.ToString();
            lblPercentage.Text = percentage.ToString("F2") + "%";
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataTable gradeTable = new DataTable();
        gradeTable.Columns.Add("CourseName", typeof(string));
        gradeTable.Columns.Add("Sname", typeof(string));
        gradeTable.Columns.Add("Email", typeof(string));
        gradeTable.Columns.Add("Subject1", typeof(int));
        gradeTable.Columns.Add("Subject2", typeof(int));
        gradeTable.Columns.Add("Subject3", typeof(int));
        gradeTable.Columns.Add("Subject4", typeof(int));
        gradeTable.Columns.Add("Subject5", typeof(int));
        gradeTable.Columns.Add("Total", typeof(int));
        gradeTable.Columns.Add("Percentage", typeof(decimal));

        foreach (GridViewRow row in gvStudents.Rows)
        {
            string studentName = row.Cells[1].Text;
            string email = row.Cells[2].Text;

            int subject1 = int.Parse(((TextBox)row.FindControl("txtSubject1")).Text);
            int subject2 = int.Parse(((TextBox)row.FindControl("txtSubject2")).Text);
            int subject3 = int.Parse(((TextBox)row.FindControl("txtSubject3")).Text);
            int subject4 = int.Parse(((TextBox)row.FindControl("txtSubject4")).Text);
            int subject5 = int.Parse(((TextBox)row.FindControl("txtSubject5")).Text);

            int total = subject1 + subject2 + subject3 + subject4 + subject5;
            decimal percentage = (decimal)total / 5;

            gradeTable.Rows.Add(ddlCourses.SelectedItem.Text, studentName, email, subject1, subject2, subject3, subject4, subject5, total, percentage);
        }

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TDS"].ConnectionString))
        {
            foreach (DataRow row in gradeTable.Rows)
            {
                SqlCommand cmd = new SqlCommand(@"INSERT INTO Grade 
                (CourseName, Sname, Email, Subject1, Subject2, Subject3, Subject4, Subject5, Total, Percentage) 
                VALUES (@CourseName, @Sname, @Email, @Subject1, @Subject2, @Subject3, @Subject4, @Subject5, @Total, @Percentage)", conn);

                cmd.Parameters.AddWithValue("@CourseName", row["CourseName"]);
                cmd.Parameters.AddWithValue("@Sname", row["Sname"]);
                cmd.Parameters.AddWithValue("@Email", row["Email"]);
                cmd.Parameters.AddWithValue("@Subject1", row["Subject1"]);
                cmd.Parameters.AddWithValue("@Subject2", row["Subject2"]);
                cmd.Parameters.AddWithValue("@Subject3", row["Subject3"]);
                cmd.Parameters.AddWithValue("@Subject4", row["Subject4"]);
                cmd.Parameters.AddWithValue("@Subject5", row["Subject5"]);
                cmd.Parameters.AddWithValue("@Total", row["Total"]);
                cmd.Parameters.AddWithValue("@Percentage", row["Percentage"]);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        // Clear input fields in the GridView
        foreach (GridViewRow row in gvStudents.Rows)
        {
            TextBox txtSubject1 = (TextBox)row.FindControl("txtSubject1");
            TextBox txtSubject2 = (TextBox)row.FindControl("txtSubject2");
            TextBox txtSubject3 = (TextBox)row.FindControl("txtSubject3");
            TextBox txtSubject4 = (TextBox)row.FindControl("txtSubject4");
            TextBox txtSubject5 = (TextBox)row.FindControl("txtSubject5");

            txtSubject1.Text = string.Empty;
            txtSubject2.Text = string.Empty;
            txtSubject3.Text = string.Empty;
            txtSubject4.Text = string.Empty;
            txtSubject5.Text = string.Empty;
        }

        lblMessage.Text = "Grades submitted successfully!";
        lblMessage.Visible = true;
    }
}