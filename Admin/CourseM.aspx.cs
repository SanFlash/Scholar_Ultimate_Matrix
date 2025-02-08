using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            facultyDropdownRow.Visible = false;
        }
    }
    protected void rblAvailableFaculty_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblAvailableFaculty.SelectedValue == "Yes")
        {
            facultyDropdownRow.Visible = true;
            LoadAvailableFaculty();
        }
        else
        {
            facultyDropdownRow.Visible = false;
            ddlFacultyList.Items.Clear();
        }
    }

    private void LoadAvailableFaculty()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT FacultyName FROM Faculty WHERE Course = @Course";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Course", txtCourseName.Text); // Assuming course name matches subject
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlFacultyList.Items.Clear();
                ddlFacultyList.Items.Add(new ListItem("Select Faculty", ""));

                while (reader.Read())
                {
                    ddlFacultyList.Items.Add(new ListItem(reader["FacultyName"].ToString()));
                }
            }
        }
    }
    protected void btnAddCourse_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("InsertCourse", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CourseName", txtCourseName.Text.Trim());
                cmd.Parameters.AddWithValue("@Department", txtDepartment.Text.Trim());
                cmd.Parameters.AddWithValue("@Duration", int.Parse(txtDuration.Text.Trim()));
                cmd.Parameters.AddWithValue("@Fee", decimal.Parse(txtFee.Text.Trim()));
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

                // Adding FacultyId parameter if the Available Faculty is "Yes"
                if (rblAvailableFaculty.SelectedValue == "Yes" && ddlFacultyList.SelectedValue != "")
                {
                    cmd.Parameters.AddWithValue("@FacultyId", int.Parse(ddlFacultyList.SelectedValue));
                }
                else
                {
                    cmd.Parameters.AddWithValue("@FacultyId", DBNull.Value);
                }

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    lblMessage.Text = "Course added successfully!";
                }
                else
                {
                    lblMessage.Text = "Error adding course.";
                }
            }
        }
    }
}