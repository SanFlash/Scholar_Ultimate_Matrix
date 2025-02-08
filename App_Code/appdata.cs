using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for appdata
/// </summary>
public class appdata
{
	public appdata()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static bool MyExecuteNonQuery(string Spname, SqlParameter[] para)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TDS"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = Spname;
        foreach (SqlParameter item in para)
        {
            cmd.Parameters.Add(item);
        }
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return (a > 0) ? true : false;
    }






}