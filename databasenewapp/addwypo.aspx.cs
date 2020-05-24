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
            sb1.Append("select Wypozyczenie.idWypozyczenie,Wypozyczenie.idPlacowka,Wypozyczenie.termidOd,Wypozyczenie.terminDo,Wypozyczenie.IdKlienci,Wypozyczenie.idFilm," +
                "Placowka.Adres,Klienci.Nazwisko,Film.Nazwa from dbo.Wypozyczenie Left Join dbo.Placowka on Placowka.IdPlacowka=Wypozyczenie.idPlacowka left join dbo.Film on Film.IdFilm=Wypozyczenie.IdFilm left join dbo.Klienci on Klienci.IdKlienci=Wypozyczenie.IdKlienci WHERE idWypozyczenie=@idWypozyczenie");
            //sb1.Append("getEmployee"); ;
            SqlCommand cmd = new SqlCommand(sb1.ToString(), con);
            //cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandType = CommandType.Text;
            string idStr = id.ToString();
            cmd.Parameters.Add(new SqlParameter("@idWypozyczenie", idStr));
            con.Open();

            SqlCommand com = new SqlCommand("select *from dbo.Placowka", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            m_plac.DataTextField = ds.Tables[0].Columns["Adres"].ToString(); // text field name of table dispalyed in dropdown
            m_plac.DataValueField = ds.Tables[0].Columns["idPlacowka"].ToString();             // to retrive specific  textfield name 
            m_plac.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            m_plac.DataBind();  //binding dropdownlist

            SqlCommand com2 = new SqlCommand("select *from dbo.Klienci", con); // table name 
            SqlDataAdapter da2 = new SqlDataAdapter(com2);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);  // fill dataset
            m_klienci.DataTextField = ds2.Tables[0].Columns["Nazwisko"].ToString(); // text field name of table dispalyed in dropdown
            m_klienci.DataValueField = ds2.Tables[0].Columns["idKlienci"].ToString();             // to retrive specific  textfield name 
            m_klienci.DataSource = ds2.Tables[0];      //assigning datasource to the dropdownlist
            m_klienci.DataBind();  //binding dropdownlist

            SqlCommand com3 = new SqlCommand("select *from dbo.Film", con); // table name 
            SqlDataAdapter da3 = new SqlDataAdapter(com3);
            DataSet ds3 = new DataSet();
            da3.Fill(ds3);  // fill dataset
            m_film.DataTextField = ds3.Tables[0].Columns["Nazwa"].ToString(); // text field name of table dispalyed in dropdown
            m_film.DataValueField = ds3.Tables[0].Columns["idFilm"].ToString();             // to retrive specific  textfield name 
            m_film.DataSource = ds3.Tables[0];      //assigning datasource to the dropdownlist
            m_film.DataBind();  //binding dropdownlist

            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {

                m_id.Text = rdr["idWypozyczenie"].ToString().Trim();
                m_plac.Text = rdr["idPlacowka"].ToString().Trim();
                m_date.Text = rdr["termidOd"].ToString().Trim();
                m_date2.Text = rdr["terminDo"].ToString().Trim();
                m_klienci.Text = rdr["IdKlienci"].ToString().Trim();
                m_film.Text = rdr["idFilm"].ToString().Trim();

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

            SqlCommand cmd = new SqlCommand("sp_addWypo", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter parameter1 = new SqlParameter("@idWypozyczenie", m_id.Text);
            cmd.Parameters.Add(parameter1);
            SqlParameter parameter2 = new SqlParameter("@idPlacowka", m_plac.Text);
            cmd.Parameters.Add(parameter2);
            SqlParameter parameter3 = new SqlParameter("@termidOd", m_date.Text);
            cmd.Parameters.Add(parameter3);
            SqlParameter parameter4 = new SqlParameter("@terminDo", m_date2.Text);
            cmd.Parameters.Add(parameter4);
            SqlParameter parameter5 = new SqlParameter("@IdKlienci", m_klienci.Text);
            cmd.Parameters.Add(parameter5);
            SqlParameter parameter6 = new SqlParameter("@idFilm", m_film.Text);
            cmd.Parameters.Add(parameter6);


            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("mypage - wypozyczenia.aspx");

    }

    protected void m_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("mypage - wypozyczenia.aspx");
    }
}