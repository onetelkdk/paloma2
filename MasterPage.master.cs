using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{

    public string buscaTitulo()
    {

        string url = HttpContext.Current.Request.Url.AbsolutePath.Replace("/", "").Replace(".aspx", "");
        string sql = string.Empty;
        string opcion = string.Empty;


        sql = "SELECT P.PrgprgDescripcion Opcion";
        sql += " FROM mprgprg P";
        sql += " LEFT JOIN mAdmMod S ON P.AdmmodCodigo = S.admmodcodigo";
        sql += " LEFT JOIN mprgtip M ON P.prgtipcodigo = M.prgtipcodigo";
        sql += " WHERE P.PrgprgNombre = '" + url + "'";

        string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(conexion))
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            using (SqlCommand cmd2 = new SqlCommand(sql, conn))
            {
                using (SqlDataReader dr = cmd2.ExecuteReader())
                {
                    while (dr.Read())
                    {

                        opcion = dr["Opcion"].ToString();

                    }
                }

            }
        }

        return opcion;
    }
    public string buscaNombre()
    {
        string url = HttpContext.Current.Request.Url.AbsolutePath.Replace("/", "").Replace(".aspx", "");
        string sql = string.Empty;
        string opcion = string.Empty;


        sql = "SELECT S.admmodnombre + ' / ' + M.prgtipNombre + ' / ' +  P.PrgprgDescripcion Opcion";
        sql += " FROM mprgprg P";
        sql += " LEFT JOIN mAdmMod S ON P.AdmmodCodigo = S.admmodcodigo";
        sql += " LEFT JOIN mprgtip M ON P.prgtipcodigo = M.prgtipcodigo";
        sql += " WHERE P.PrgprgNombre = '" + url + "'";

        string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(conexion))
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            using (SqlCommand cmd2 = new SqlCommand(sql, conn))
            {
                using (SqlDataReader dr = cmd2.ExecuteReader())
                {
                    while (dr.Read())
                    {

                        opcion = dr["Opcion"].ToString();

                    }
                }

            }
        }

        return opcion;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string sql = string.Empty;
            string menu = string.Empty;
            string sistema = string.Empty;
            string modulo = string.Empty;

            int i = 0;

            sql = "SELECT S.admmodnombre Sistema,S.admmodicono,M.prgtipNombre Modulo,M.PrgtipIcono,";
            sql += " P.PrgprgNombre Programa,P.PrgprgDescripcion,P.PrgprgIcono ";
            sql += " FROM mprgprg P ";
            sql += " INNER JOIN mAdmMod S ON P.AdmmodCodigo = S.admmodcodigo  ";
            sql += " INNER JOIN mprgtip M ON P.prgtipcodigo = M.prgtipcodigo ";
            //sql += "WHERE P.admsts_codigo = 1 AND P.admsts_codigo = 1 AND  M.admsts_codigo = 1 ";
            sql += " WHERE S.admmodcodigo = 'modini'";
            sql += " ORDER BY S.admmodorden, M.prgtiporden,  P.prgprgorden ";

            string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(conexion))
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                using (SqlCommand cmd2 = new SqlCommand(sql, conn))
                {
                    using (SqlDataReader dr = cmd2.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            if (i == 0)
                            {
                                menu = "<div class='main_menu'>";
                                menu += "<div class='menuleft'>";
                                menu += "<div class='nombre_top_menu'>";
                                i = 1;
                            }
                            if (dr["sistema"].ToString() != sistema)
                            {
                                if (sistema == string.Empty)
                                {
                                    menu += "<a href='menues_iniciativas_legislativas.html'>";
                                    menu += "<img src='images/atras.png' style='margin-top: 17px; float: left' title='REGRESAR AL MENU ANTERIOR'>";
                                    menu += "<h2>" + dr["sistema"].ToString() + "</h2>";
                                    menu += "</a>";
                                    menu += "</div>";
                                }

                            }
                            if (dr["Modulo"].ToString() != modulo)
                            {
                                if (modulo != string.Empty)
                                {
                                    menu += "</ul>";
                                }
                                menu += "<ul id='accordion' class='accordion'>";
                                menu += "<li>";
                                menu += "<div class='link'>";
                                menu += "<img src='images/" + dr["prgtipicono"].ToString() + "'>" + dr["Modulo"].ToString() + "<i class='fa fa-chevron-down'></i>";
                                menu += "</div>";
                                menu += "<ul class='submenu'>";
                            }
                            menu += "<li><a href='" + dr["Programa"].ToString() + ".aspx'>" + dr["prgprgdescripcion"].ToString() + "</a></li>";
                            modulo = dr["Modulo"].ToString();
                            sistema = dr["sistema"].ToString();
                        }
                        menu += "</ul>";
                        menu += "</li>";
                        menu += "</div>";
                        menu += "</div>";
                       
                    }
                    dvMenu.InnerHtml = menu;
                }
            }
        }

    }
}
