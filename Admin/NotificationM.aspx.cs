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

public partial class Admin_Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // If necessary, you can bind GridView here to show notifications
    }

    protected void btnPostNotification_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text.Trim();
        string message = txtMessage.Text.Trim();
        bool status = chkStatus.Checked;

        // Gather selected pages from CheckBoxList
        StringBuilder selectedPages = new StringBuilder();
        foreach (ListItem item in chkListPages.Items)
        {
            if (item.Selected)
            {
                selectedPages.Append(item.Value + ",");
            }
        }

        // Remove trailing comma
        if (selectedPages.Length > 0)
        {
            selectedPages.Remove(selectedPages.Length - 1, 1);
        }

        // Insert into the database
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TDS"].ToString();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Notice (Title, Msg, Sts, Pages, PostedDate) VALUES (@Title, @Message, @Status, @Pages, @PostedDate)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Title", title);
            cmd.Parameters.AddWithValue("@Message", message);
            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@Pages", selectedPages.ToString());
            cmd.Parameters.AddWithValue("@PostedDate", DateTime.Now);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        // Provide feedback to the user
        lblMessageStatus.Text = "Notification Posted Successfully!";
        ResetFields();
    }

    private void ResetFields()
    {
        txtTitle.Text = string.Empty;
        txtMessage.Text = string.Empty;
        chkStatus.Checked = false;

        // Unselect all items in CheckBoxList
        foreach (ListItem item in chkListPages.Items)
        {
            item.Selected = false;
        }      
    }
}