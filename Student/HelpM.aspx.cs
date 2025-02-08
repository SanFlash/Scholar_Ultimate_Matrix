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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        string studentID = txtStudentID.Text;
        string requestType = ddlRequestType.SelectedValue;
        string description = txtDescription.Text;
        string documentPath = null;
        DateTime requestDate = DateTime.Now;

        if (fuDocument.HasFile)
        {
            string fileName = Guid.NewGuid() + "_" + fuDocument.FileName;
            documentPath = "~/Documents/" + fileName;
            fuDocument.SaveAs(Server.MapPath(documentPath));
        }

        string connStr = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "INSERT INTO HelpLeaveRequests (StudentID, RequestType, Description, DocumentPath, RequestDate) " +
                           "VALUES (@StudentID, @RequestType, @Description, @DocumentPath, @RequestDate)";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@StudentID", studentID);
                cmd.Parameters.AddWithValue("@RequestType", requestType);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@DocumentPath", (object)documentPath ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@RequestDate", requestDate);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        lblMessage.Text = "Request submitted successfully!";
    }
}

