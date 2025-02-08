using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Adapters;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        try
        {
            SqlParameter[] para =
            {
                new SqlParameter("@user",DropDownList1.SelectedValue),
                new SqlParameter("@uname",txtUsername.Text),
                new SqlParameter("@email",txtEmail.Text),
                new SqlParameter("@pass",txtPassword.Text),
                new SqlParameter("@cpass",txtConfirmPassword.Text),
                new SqlParameter("@sec",txtsecurityquestion.Text),
                new SqlParameter("@seqa",txtsecurityanswer.Text),  
                new SqlParameter("@phone",txtnumber.Text),            
            };
            bool x = appdata.MyExecuteNonQuery("sign_up", para);
            if (x)
            {
                
                lblmsg.Text = "Data inserted";
            }
            else
            {
                lblmsg.Text = "Not Data inserted";
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
}