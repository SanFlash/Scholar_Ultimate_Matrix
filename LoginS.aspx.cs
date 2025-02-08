using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;


public partial class _Default : System.Web.UI.Page
{
    private static string generatedOTP = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();

        if (IsValidUser(email, password))
        {
            // Generate OTP
            generatedOTP = GenerateOTP();

            // Send OTP to email
            SendOTPEmail(email, generatedOTP);

            // Hide login form and show OTP verification
            txtEmail.Enabled = false;
            txtPassword.Enabled = false;
            btnSubmit.Enabled = false;
            txtOTP.Visible = true;
            btnVerifyOTP.Visible = true;
        }
        else
        {
            // Invalid credentials
            Response.Write("<script>alert('Invalid email or password');</script>");
        }
    }

    private bool IsValidUser(string email, string password)
    {
        // Connect to database and check if user exists and is Admin
        string connectionString = ConfigurationManager.ConnectionStrings["TDS"].ToString();
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT COUNT(1) FROM SignUp WHERE email = @Email AND password = @Password AND [user] = 'Student'";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                conn.Open();
                int result = Convert.ToInt32(cmd.ExecuteScalar());
                return result > 0;
            }
        }
    }

    private string GenerateOTP()
    {
        // Generate a random 6-digit OTP
        Random random = new Random();
        return random.Next(100000, 999999).ToString();
    }

    private void SendOTPEmail(string email, string otp)
    {
        try
        {
            // Set up SMTP client and credentials
            var smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential("satyendranamdeo78130@gmail.com", "fatfhsejhegyjurm"),
                EnableSsl = true,
            };

            var mailMessage = new MailMessage
            {
                From = new MailAddress("satyendranamdeo78130@gmail.com"),
                Subject = "Your OTP Code",
                Body = "Your OTP code is: " + otp,  // Using string concatenation
                IsBodyHtml = false,
            };
            mailMessage.To.Add(email);

            // Send email
            smtpClient.Send(mailMessage);
        }
        catch (Exception ex)
        {
            // Handle errors (e.g., invalid email)
            Response.Write("<script>alert('Error sending OTP: " + ex.Message + "');</script>");
        }
    }

    protected void btnVerifyOTP_Click(object sender, EventArgs e)
    {
        string enteredOTP = txtOTP.Text.Trim();
        if (enteredOTP == generatedOTP)
        {
            // OTP is valid, redirect to another page
            Response.Redirect("Student/Student.aspx");
        }
        else
        {
            // Invalid OTP
            Response.Write("<script>alert('Invalid OTP');</script>");
        }
    }
}