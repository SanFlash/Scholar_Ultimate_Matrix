using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TDS"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAdd_Click1(object sender, EventArgs e)
    {
        try
        {
            // Check if a file is uploaded
            byte[] fileData = null;
            if (FileUpload1.HasFile)
            {
                using (var binaryReader = new System.IO.BinaryReader(FileUpload1.PostedFile.InputStream))
                {
                    fileData = binaryReader.ReadBytes(FileUpload1.PostedFile.ContentLength);
                }
            }

            // Create SQL parameters for the stored procedure
            SqlParameter[] p =
        {
    new SqlParameter("@Sname", txtSname.Text),
    new SqlParameter("@Dob", Convert.ToDateTime(txtDob.Text)), // Assuming you have a textbox for Date of Birth
    new SqlParameter("@Father", txtFather.Text),
    new SqlParameter("@Mother", txtMother.Text),
    new SqlParameter("@Address", txtAddress.Text),
    new SqlParameter("@Course", txtCourse.Text),
    new SqlParameter("@Email", txtEmail.Text),
    new SqlParameter("@photo", (object)fileData ?? DBNull.Value), // Handle file data
    new SqlParameter("@S10", txtS10.Text), // Assuming you have a textbox for 10th grade result
    new SqlParameter("@S12", txtS12.Text), // Assuming you have a textbox for 12th grade result
    new SqlParameter("@Enrolled", txtEnrolled.Checked) // Assuming you have a checkbox for Enrolled status
};

            // Create and configure SQL command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertStudent"; // Ensure this matches your stored procedure name

            // Add parameters to the command
            foreach (SqlParameter para in p)
            {
                cmd.Parameters.Add(para);
            }

            // Execute the command
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            // Check if the insert was successful
            if (i > 0)
            {
                lblmsg.Text = "Inserted Successfully!";
                reset();

            }
            else
            {
                lblmsg.Text = "Not Inserted";
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message; // Display the error message
        }
    }
    public void reset() 
    {
        txtSname.Text = string.Empty;
        txtDob.Text = string.Empty;
        txtFather.Text = string.Empty;
        txtMother.Text = string.Empty;
        txtAddress.Text = string.Empty;
        txtCourse.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtS10.Text = string.Empty;
        txtS12.Text = string.Empty;
        txtEnrolled.Checked = false;
        FileUpload1.Attributes.Clear();
 
    }

    protected void btnRest_Click(object sender, EventArgs e)
    {
        reset();
    }
}
