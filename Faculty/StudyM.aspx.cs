using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Faculty_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (fileUpload.HasFile)
        {
            string title = txtTitle.Text.Trim();
            string instructions = txtInstructions.Text.Trim();
            bool isAssignment = chkAssignment.Checked;
            bool isNotes = chkNotes.Checked;
            string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
            string contentType = fileUpload.PostedFile.ContentType;
            byte[] fileData;

            using (Stream fs = fileUpload.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    fileData = br.ReadBytes((int)fs.Length);
                }
            }

            string connString = ConfigurationManager.ConnectionStrings["TDS"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO StudyMaterial (Title, Instructions, IsAssignment, IsNotes, FileName, ContentType, FileData) " +
                               "VALUES (@Title, @Instructions, @IsAssignment, @IsNotes, @FileName, @ContentType, @FileData)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Instructions", instructions);
                    cmd.Parameters.AddWithValue("@IsAssignment", isAssignment);
                    cmd.Parameters.AddWithValue("@IsNotes", isNotes);
                    cmd.Parameters.AddWithValue("@FileName", fileName);
                    cmd.Parameters.AddWithValue("@ContentType", contentType);
                    cmd.Parameters.AddWithValue("@FileData", fileData);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "File uploaded successfully!";
                }
            }
        }
        else
        {
            lblMessage.Text = "Please select a file to upload.";
        }
    }
}