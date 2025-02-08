using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblmsg.Text = "";
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("InsertFaculty", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                // Adding parameters to the stored procedure
                cmd.Parameters.AddWithValue("@FacultyName", txtFname.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@DateOfBirth", txtDob.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
                cmd.Parameters.AddWithValue("@Department", txtDepartment.Text);
                cmd.Parameters.AddWithValue("@Course", txtCourse.Text);
                cmd.Parameters.AddWithValue("@FacultyType", ddlFacultyType.SelectedValue);
                cmd.Parameters.AddWithValue("@Experience", txtExperience.Text);
                cmd.Parameters.AddWithValue("@DateOfJoining", txtJoiningDate.Text);
                cmd.Parameters.AddWithValue("@Salary", txtSalary.Text);
                
                 

                // Handling file upload for the photo
                if (fileUploadPhoto.HasFile)
                {
                    byte[] photoData = fileUploadPhoto.FileBytes;
                    cmd.Parameters.AddWithValue("@Photo", photoData);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Photo", DBNull.Value);
                }

                // Opening the connection and executing the command
                conn.Open();
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    lblmsg.Text = "Faculty added successfully!";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    rst(); // Call reset to clear fields
                }
                else
                {
                    lblmsg.Text = "Error adding faculty.";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }

    public void rst()
    {
        txtFname.Text = string.Empty;
        ddlGender.SelectedIndex = 0;
        txtDob.Text = string.Empty;
        txtAddress.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtQualification.Text = string.Empty;
        txtDepartment.Text = string.Empty;
        ddlFacultyType.SelectedIndex = 0;
        txtExperience.Text = string.Empty;
        txtJoiningDate.Text = string.Empty;
        txtSalary.Text = string.Empty;
        fileUploadPhoto.Attributes.Clear();
        lblmsg.Text = string.Empty;
    }
    protected void reset_Click(object sender, EventArgs e)
    {
        rst();
    }
}