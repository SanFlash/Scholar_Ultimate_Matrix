using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SelectedStudent"] != null && Session["Installment"] != null && Session["CalculatedInstallment"] != null)
        {
            lblSelectedStudent.Text = Session["SelectedStudent"].ToString();
            lblInstallment.Text = Session["Installment"].ToString();
            lblCalculatedInstallment.Text = Session["CalculatedInstallment"].ToString();
        }
        else
        {
            Response.Redirect("Payment.aspx");
        }
    }

    protected void btnConfirmPayment_Click(object sender, EventArgs e)
    {
        // You can add logic here to process the payment.
        // For now, you can show a confirmation message.

        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Payment Confirmed!');", true);
    }
}