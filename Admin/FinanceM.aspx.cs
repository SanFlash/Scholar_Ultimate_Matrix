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
    string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCourses();
            BindFeeDetails();
        }
    }

    private void BindCourses()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT CourseId, CourseName FROM Course WHERE Status = 'Active'"; // Ensure courses are active
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                ddlCourses.DataSource = dr;
                ddlCourses.DataTextField = "CourseName"; // Display Course Name
                ddlCourses.DataValueField = "CourseId"; // Use CourseId as value
                ddlCourses.DataBind();
                ddlCourses.Items.Insert(0, new ListItem("All Courses", "0")); // Add default item
                con.Close();
            }
        }
    }

    private void BindFeeDetails()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT PaymentId, StudentName, InstallmentAmount, CourseId, InstallmentPlan, PaymentDate FROM FeePay";
            if (ddlCourses.SelectedValue != "0")
            {
                query += " WHERE CourseId = @CourseId";
            }

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                if (ddlCourses.SelectedValue != "0")
                {
                    cmd.Parameters.AddWithValue("@CourseId", ddlCourses.SelectedValue);
                }

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvFeeDetails.DataSource = dt;
                    gvFeeDetails.DataBind();
                }
            }
        }
    }

    protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindFeeDetails();
    }

    protected void gvFeeDetails_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
    {
        gvFeeDetails.PageIndex = e.NewPageIndex;
        BindFeeDetails();
    }
}