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
    string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCourses();
            LoadFeeDetails(0); // Load all data initially
        }
    }

    private void LoadCourses()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT CourseId, CourseName FROM Course", conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            ddlCourses.Items.Clear();
            ddlCourses.Items.Add(new ListItem("All Courses", "0"));

            while (dr.Read())
            {
                ddlCourses.Items.Add(new ListItem(dr["CourseName"].ToString(), dr["CourseId"].ToString()));
            }

            conn.Close();
        }
    }

    private void LoadFeeDetails(int courseId)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT PaymentId, StudentName, InstallmentAmount, InstallmentPlan, PaymentDate FROM FeePay";
            if (courseId > 0)
            {
                query += " WHERE CourseId = @CourseId";
            }

            SqlCommand cmd = new SqlCommand(query, conn);
            if (courseId > 0)
            {
                cmd.Parameters.AddWithValue("@CourseId", courseId);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvFeeDetails.DataSource = dt;
            gvFeeDetails.DataBind();
        }
    }

    protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        int selectedCourseId = int.Parse(ddlCourses.SelectedValue);
        LoadFeeDetails(selectedCourseId);
    }
}