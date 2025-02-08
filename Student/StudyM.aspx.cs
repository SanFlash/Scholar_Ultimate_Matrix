using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

public partial class Student_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Download"] != null)
        {
            int fileId;
            if (int.TryParse(Request.QueryString["Download"], out fileId))
            {
                ServeFile(fileId);
            }
        }
        else
        {
            BindMaterialRepeater();
        }
    }

    // Bind the Repeater to display materials
    private void BindMaterialRepeater()
    {
        string connString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connString))
        {
            string query = "SELECT Id, Title, Instructions FROM StudyMaterial";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                repeaterMaterials.DataSource = cmd.ExecuteReader();
                repeaterMaterials.DataBind();
            }
        }
    }

    // Serve the file for download or viewing
    private void ServeFile(int id)
    {
        string connString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connString))
        {
            string query = "SELECT FileName, ContentType, FileData FROM StudyMaterial WHERE Id = @Id";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Id", id);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string fileName = reader["FileName"].ToString();
                        string contentType = reader["ContentType"].ToString();
                        byte[] fileData = (byte[])reader["FileData"];

                        // Send the file to the browser
                        Response.Clear();
                        Response.ContentType = contentType;

                        // Check if the content type allows the file to be viewed in the browser
                        if (contentType.Contains("text") || contentType.Contains("pdf") || contentType.Contains("image"))
                        {
                            // Allow the file to be viewed in the browser
                            Response.AddHeader("Content-Disposition", "inline;filename=" + fileName);
                        }
                        else
                        {
                            // Force the file to be downloaded
                            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                        }

                        Response.BinaryWrite(fileData);
                        Response.End();
                    }
                }
            }
        }
    }
}
