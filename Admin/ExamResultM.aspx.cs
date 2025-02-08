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
            BindGridView();
        }
    }

    private void BindGridView()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT id, Sname, email, subject1, subject2, subject3, subject4, subject5 FROM grade";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvResults.DataSource = dt;
            gvResults.DataBind();
        }
    }
}