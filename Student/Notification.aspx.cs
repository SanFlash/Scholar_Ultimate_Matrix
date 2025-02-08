using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class Student_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadNotifications("Student Dashboard");
        }
    }

    private void LoadNotifications(string pageName)
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDS"].ToString();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT Title, Msg, PostedDate FROM Notice WHERE Sts = 1 AND CHARINDEX(@PageName, Pages) > 0 ORDER BY PostedDate DESC";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@PageName", pageName);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridViewNotifications.DataSource = dt;
            GridViewNotifications.DataBind();
        }
    }
}