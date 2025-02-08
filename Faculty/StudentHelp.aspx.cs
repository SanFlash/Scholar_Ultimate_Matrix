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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    private void BindGridView()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT RequestID, StudentID, RequestType, Description, DocumentPath, RequestDate FROM HelpLeaveRequests";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    gridViewRequests.DataSource = dt;
                    gridViewRequests.DataBind();
                }
            }
        }
    }
}