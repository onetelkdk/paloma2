using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class MenuPrincipal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = string.Empty;
            string menu = string.Empty;
            string sistema = string.Empty;
            string modulo = string.Empty;
            string opcion = string.Empty;
            string prueba = string.Empty;
            int i = 0;
            int len;
            List<string> Course = new List<string>();

            sql = "SELECT AdmmodNombre";
            sql += " FROM mAdmMod";


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

                        while(dr.Read())
                        {
                            Course.Add(dr.GetString(0));
                        }

                        for (i = 0; i <= Course.Count-1; i++)
                        {
                            prueba = Course[i];
                            menu = " <div class='modulo_item item4x2 item_color1'>";
                            menu += " <a href='menues_iniciativas_legislativas.html'>";
                            menu += " <div class='item_contenido'>";
                            menu += " <div class='modulo_nombre' style='background: url('images/ic_iniciativas.png');'>";
                            menu += " <span>" + prueba + "</span>";
                            menu += " </div>";
                            menu += " </div>";
                            menu += " </a>";
                            menu += " </div>";
                            dvMenu.InnerHtml = menu;
                        }
                    }
                }

            }
        }
    }
}