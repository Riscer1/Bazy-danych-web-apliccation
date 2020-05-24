﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mypage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            String strSearch = this.m_search.Text;

            string cs = ConfigurationManager.AppSettings["DBConnectionString"];
            StringBuilder sb1 = new StringBuilder();
            sb1.Append("select idKlienci,Imie,Nazwisko,Adres,Kontakt from dbo.Klienci");
            if (strSearch.Length > 0)
            {
                //sb1.AppendFormat(" where LastName like '%{0}%'", strSearch);
                sb1.Append(" where Nazwisko like @LIKENAME");
            }
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(sb1.ToString(), con);
                cmd.CommandType = CommandType.Text;
                if (strSearch.Length > 0)
                {
                    string str = "%" + strSearch + "%";
                    cmd.Parameters.Add(new SqlParameter("@LIKENAME", str));
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                this.m_rptEmployees.DataSource = ds;

                this.m_rptEmployees.DataBind();
            }

        }
    }

    protected void m_refresh_Click(object sender, EventArgs e)
    {

    }
    protected void m_add_Click(object sender, EventArgs e)
    {
        Response.Redirect("addEmployee.aspx");
    }
}