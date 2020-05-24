using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editEmployee : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        string cs = ConfigurationManager.AppSettings["DBConnectionString"];

        int id = 1;
        try { id = Convert.ToInt32(Request.QueryString["id"]); }
        catch { id = 1; }
        if (id < 1) id = 1;

        using (SqlConnection con = new SqlConnection(cs))
        {
            StringBuilder sb1 = new StringBuilder();
            sb1.Append("select idKlienci,Imie,Nazwisko,Adres,Kontakt from dbo.Klienci WHERE idKlienci=@idKlienci");
            //sb1.Append("getEmployee"); ;
            SqlCommand cmd = new SqlCommand(sb1.ToString(), con);
            //cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandType = CommandType.Text;
            string idStr = id.ToString();
            cmd.Parameters.Add(new SqlParameter("@idKlienci", idStr));
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {

                m_id.Text = rdr["idKlienci"].ToString().Trim();
                m_first.Text = rdr["Imie"].ToString().Trim();
                m_name.Text = rdr["Nazwisko"].ToString().Trim();
                m_address.Text = rdr["Adres"].ToString().Trim();
                m_email.Text = rdr["Kontakt"].ToString().Trim();

                break;
            }
            con.Close();
        }

    }

    protected void m_update_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.AppSettings["DBConnectionString"];
        using (SqlConnection con = new SqlConnection(cs))
        {

            SqlCommand cmd = new SqlCommand("sp_addEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //SqlParameter parameter1 = new SqlParameter("@idKlienci", m_id.Text);
            //cmd.Parameters.Add(parameter1);
            SqlParameter parameter2 = new SqlParameter("@Imie", m_first.Text);
            cmd.Parameters.Add(parameter2);
            SqlParameter parameter3 = new SqlParameter("@Nazwisko", m_name.Text);
            cmd.Parameters.Add(parameter3);
            SqlParameter parameter4 = new SqlParameter("@Adres", m_address.Text);
            cmd.Parameters.Add(parameter4);
            SqlParameter parameter5 = new SqlParameter("@Kontakt", m_email.Text);
            cmd.Parameters.Add(parameter5);



            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("mypage.aspx");

    }

    protected void m_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("mypage.aspx");
    }
}