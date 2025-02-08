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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CalculateAttendanceSummary();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string searchQuery = txtSearch.Text.Trim();
        SqlDataSource1.SelectCommand = "SELECT * FROM [Attendance] WHERE StudentID LIKE @SearchQuery OR CourseID LIKE @SearchQuery";
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add("SearchQuery", "%" + searchQuery + "%");

        GridView1.DataBind();
        CalculateAttendanceSummary();
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string status = ddlStatus.SelectedValue;

        if (status == "All")
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [Attendance]";
            SqlDataSource1.SelectParameters.Clear();
        }
        else
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [Attendance] WHERE AttendanceStatus = @AttendanceStatus";
            SqlDataSource1.SelectParameters.Clear();
            SqlDataSource1.SelectParameters.Add("AttendanceStatus", status);
        }

        GridView1.DataBind();
        CalculateAttendanceSummary();
    }

    protected void btnDateFilter_Click(object sender, EventArgs e)
    {
        string dateFilter = txtDate.Text.Trim();
        SqlDataSource1.SelectCommand = "SELECT * FROM [Attendance] WHERE CAST(AttendanceDate AS DATE) = @AttendanceDate";
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add("AttendanceDate", dateFilter);

        GridView1.DataBind();
        CalculateAttendanceSummary();
    }

    private void CalculateAttendanceSummary()
    {
        int totalPresent = 0, totalAbsent = 0, totalLeave = 0, totalCount = 0;

        foreach (GridViewRow row in GridView1.Rows)
        {
            string status = row.Cells[3].Text; // Assuming AttendanceStatus is in the 4th column
            totalCount++;
            if (status == "Present") totalPresent++;
            else if (status == "Absent") totalAbsent++;
            else if (status == "Leave") totalLeave++;
        }

        lblTotalPresent.Text = "Total Present: " + totalPresent;
        lblTotalAbsent.Text = "Total Absent: " + totalAbsent;
        lblTotalLeave.Text = "Total Leave: " + totalLeave;

        if (totalCount > 0)
        {
            double attendancePercentage = ((double)totalPresent / totalCount) * 100;
            lblIndividualAttendance.Text = string.Format("Individual Attendance: {0:F2}%", attendancePercentage);
        }
        else
        {
            lblIndividualAttendance.Text = "Individual Attendance: N/A";
        }
    }
}