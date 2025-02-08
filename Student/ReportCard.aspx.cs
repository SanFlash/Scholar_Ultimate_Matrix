using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Student_Default : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlMarksheet.Visible = false;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text;
        string rollId = txtRollId.Text;

        if (ValidateInput(email, rollId))
        {
            FetchStudentInfo(email);
            FetchGrades(email);
        }
        else
        {
            // Handle invalid input
            // You can show an error message here
        }
    }

    private bool ValidateInput(string email, string rollId)
    {
        // Perform input validation logic (like checking if fields are empty)
        return !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(rollId);
    }

    private void FetchStudentInfo(string email)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM Student WHERE email = @Email AND enrolled = 1";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Email", email);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblStudentName.Text = reader["Sname"].ToString();
                lblDob.Text = reader["Dob"].ToString();
                lblDepartment.Text = reader["course"].ToString();
                lblCourse.Text = reader["course"].ToString();
                imgStudentPhoto.ImageUrl = "~/StudentPhotos/" + reader["photo"].ToString(); // Assuming photo is saved as filename
            }
            else
            {
                // Handle case where no student is found
                // You can show a "Student not found" message here
            }
            reader.Close();
        }
    }

    private void FetchGrades(string email)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM Grade WHERE Email = @Email";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Email", email);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblSubject1.Text = reader["Subject1"].ToString();
                lblSubject2.Text = reader["Subject2"].ToString();
                lblSubject3.Text = reader["Subject3"].ToString();
                lblSubject4.Text = reader["Subject4"].ToString();
                lblSubject5.Text = reader["Subject5"].ToString();
                lblTotal.Text = reader["Total"].ToString();
                lblPercentage.Text = reader["Percentage"].ToString();
                pnlMarksheet.Visible = true;
            }
            else
            {
                // Handle case where grades are not found
                // You can show a "No grades found" message here
            }
            reader.Close();
        }
    }
}