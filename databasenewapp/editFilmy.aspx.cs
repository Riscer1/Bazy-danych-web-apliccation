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
            sb1.Append("select idFilm, Nazwa, idKategoria from dbo.Film  WHERE idFilm=@idFilm");
            //sb1.Append("getEmployee"); ;
            SqlCommand cmd = new SqlCommand(sb1.ToString(), con);
            //cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandType = CommandType.Text;
            string idStr = id.ToString();
            cmd.Parameters.Add(new SqlParameter("@idFilm", idStr));
            con.Open();


            SqlCommand com = new SqlCommand("select *from dbo.Kategoria", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset
            m_typ.DataTextField = ds.Tables[0].Columns["Gatunek"].ToString(); // text field name of table dispalyed in dropdown
            m_typ.DataValueField = ds.Tables[0].Columns["idKategoria"].ToString();             // to retrive specific  textfield name 
            m_typ.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            m_typ.DataBind();  //binding dropdownlist

            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {

                m_id.Text = rdr["idFilm"].ToString().Trim();
                m_typ.Text = rdr["idKategoria"].ToString().Trim();
                m_status.Text = rdr["Nazwa"].ToString().Trim();

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

            SqlCommand cmd = new SqlCommand("sp_UpdateFilmy", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter parameter1 = new SqlParameter("@idFilm", m_id.Text);
            cmd.Parameters.Add(parameter1);
            SqlParameter parameter2 = new SqlParameter("@idKategoria", m_typ.Text);
            cmd.Parameters.Add(parameter2);
            SqlParameter parameter3 = new SqlParameter("@Nazwa", m_status.Text);
            cmd.Parameters.Add(parameter3);



            con.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("mypage - filmy.aspx");

    }

    protected void m_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("mypage - filmy.aspx");
    }
}