using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


public partial class Student_Default : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCourses();
        }
    }

    // Bind courses to dropdown
    private void BindCourses()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT CourseId, CourseName FROM Course WHERE Status = 'Active'";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlCourses.DataSource = dt;
            ddlCourses.DataTextField = "CourseName";
            ddlCourses.DataValueField = "CourseId";
            ddlCourses.DataBind();
            ddlCourses.Items.Insert(0, new ListItem("--Select Course--", "0"));
        }
    }

    // Fetch students based on selected course
    protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCourses.SelectedValue != "0")
        {
            BindStudents(Convert.ToInt32(ddlCourses.SelectedValue));
            FetchCourseFee(Convert.ToInt32(ddlCourses.SelectedValue));
        }
        else
        {
            gvStudents.DataSource = null;
            gvStudents.DataBind();
            lblCourseFee.Text = "0.00";
            lblCalculatedInstallment.Text = "Calculated Installment: 0.00";
        }
    }

    private void BindStudents(int courseId)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT Sname, email FROM Student WHERE course = (SELECT CourseName FROM Course WHERE CourseId = @CourseId) AND enrolled = 1";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@CourseId", courseId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvStudents.DataSource = dt;
            gvStudents.DataBind();
        }
    }

    private void FetchCourseFee(int courseId)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT Fee FROM Course WHERE CourseId = @CourseId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@CourseId", courseId);

            con.Open();
            object fee = cmd.ExecuteScalar();
            lblCourseFee.Text = fee != null ? fee.ToString() : "0.00";

            // Update the installment calculation
            UpdateInstallmentAmount();
        }
    }

    protected void ddlInstallment_SelectedIndexChanged(object sender, EventArgs e)
    {
        UpdateInstallmentAmount();
    }

    private void UpdateInstallmentAmount()
    {
        decimal courseFee;
        decimal multiplier;

        // Check if the text can be parsed as decimals
        if (decimal.TryParse(lblCourseFee.Text, out courseFee) && decimal.TryParse(ddlInstallment.SelectedValue, out multiplier))
        {
            decimal installmentAmount = courseFee * multiplier;
            lblCalculatedInstallment.Text = "Calculated Installment: " + installmentAmount.ToString("0.00");
        }
    }

    protected void btnProceed_Click(object sender, EventArgs e)
    {
        // Get selected student name
        string selectedStudent = null;
        foreach (GridViewRow row in gvStudents.Rows)
        {
            RadioButton rb = (RadioButton)row.FindControl("rbSelect");
            if (rb != null && rb.Checked)
            {
                selectedStudent = row.Cells[1].Text;
                break;
            }
        }

        if (!string.IsNullOrEmpty(selectedStudent))
        {
            // Retrieve installment details
            string installmentPlan = ddlInstallment.SelectedItem.Text;
            decimal installmentAmount;
            decimal.TryParse(lblCalculatedInstallment.Text.Replace("Calculated Installment: ", ""), out installmentAmount);
            int courseId = Convert.ToInt32(ddlCourses.SelectedValue);

            // Insert into FeePay table
            SavePaymentToDatabase(selectedStudent, installmentAmount, courseId, installmentPlan);

            // Store session details and redirect
            Session["SelectedStudent"] = selectedStudent;
            Session["Installment"] = ddlInstallment.SelectedItem.Text;
            Session["CalculatedInstallment"] = lblCalculatedInstallment.Text;

            // Redirect to PaymentDetail.aspx
            Response.Redirect("PaymentDetail.aspx");
        }
        else
        {
            // Show error if no student is selected
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a student.');", true);
        }
    }

    private void SavePaymentToDatabase(string studentName, decimal installmentAmount, int courseId, string installmentPlan)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO FeePay (StudentName, InstallmentAmount, CourseId, InstallmentPlan) VALUES (@StudentName, @InstallmentAmount, @CourseId, @InstallmentPlan)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@StudentName", studentName);
            cmd.Parameters.AddWithValue("@InstallmentAmount", installmentAmount);
            cmd.Parameters.AddWithValue("@CourseId", courseId);
            cmd.Parameters.AddWithValue("@InstallmentPlan", installmentPlan);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }

}