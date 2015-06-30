using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.Common;



public partial class uti : System.Web.UI.Page
{
    [WebMethod]
    public static string buscarRegistro(string llave, string tabla)
    {
        string retorna = string.Empty;
        string sql = string.Empty;
        string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
        string[] llavea = llave.Split('=');

        if (Convert.ToInt32(intVal(llavea[1])) == 0)
        {
            llave = llavea[0] + " = '" + llavea[1] + "'";

        }
        sql = "SELECT * FROM " + tabla + " WHERE " + llave;

        int i = 0;
        SqlConnection conn = new SqlConnection(conexion);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();

        }

        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            retorna += "modo = 2;";
            for (i = 0; i <= dr.FieldCount - 1; i++)
            {
                string nombre = dr.GetName(i);

                if (dr[i].GetType() == typeof(DateTime))
                {
                    string dia = Convert.ToString(Convert.ToDateTime(dr[i]).Day);
                    string mes = Convert.ToString(Convert.ToDateTime(dr[i]).Month);
                    string ano = "0000";

                    if (Convert.ToInt32(dia) < 10)
                    {
                        dia = "0" + dia;
                    }
                    if (Convert.ToInt32(mes) < 10)
                    {
                        mes = "0" + mes;
                    }
                    ano = Convert.ToString(Convert.ToDateTime(dr[i]).Year);
                    retorna += "ponerValor('" + nombre + "','" + dia + "/" + mes + "/" + ano + "');";
                }
                else
                {
                    retorna += "ponerValor('" + nombre + "','" + dr[i] + "');";
                }

            }
        }

        return retorna;
    }
    public static int intVal(string valor)
    {

        int num;

        if (int.TryParse(valor, out num))
        {
            valor = num.ToString();
        }
        else
        {
            valor = "0";
        }
        return Convert.ToInt32(valor);
    }

    [WebMethod]
    public static string GrabaDatosGeneral(int modo, string campo, string tabla)
    {
        string retorna = string.Empty;
        string CampoUsuario = tabla.Substring(1) + "Usuario";
        string sql = string.Empty;
        string Resto = string.Empty;
        string indica = string.Empty;
        string Nombre = string.Empty;
        string Valor = string.Empty;
        string cola = string.Empty;
        string NoSecuencia = "0";


        HttpContext.Current.Session["idUser"] = 1;


        string[] registro = campo.Split('|');
        for (int i = 0; i < (registro.Length - 1); i++)
        {
            string[] NombreValor = registro[i].Split('=');
            Nombre = AreglaNombre(NombreValor[0]);
            indica = AreglaIndica(NombreValor[0]);
            if (indica.ToUpper().IndexOf("_F") > -1)
            {
                if (NombreValor[1] == "")
                {
                    Valor = "NULL";
                }
                else
                {
                    Valor = "'" + FechaYYYYMMDD(NombreValor[1]) + "'";
                }
            }
            else if (indica.ToUpper().IndexOf("_N") > -1)
            {
                int num;
                if (int.TryParse(NombreValor[1], out num))
                {
                    Valor = NombreValor[1];
                }
                else
                {
                    Valor = "0";
                }
            }
            else if (indica.ToUpper().IndexOf("_M") > -1)
            {
                Valor = NombreValor[1].Replace(",", "");
                //else if (NombreValor[0].ToUpper().IndexOf("_") > -1 ){
                //    case "chk":
                //        // CASO chk : Valor = IIf((NombreValor(1)) = "on", 1, 0) 
                //        break;
                //    case "rdo":
                //        Valor = NombreValor[1];
                //        break;
                //    case "por":
                //        Valor = NombreValor[1].Replace("%", "");
                //        break;
            }
            else
            {
                Valor = "'" + NombreValor[1].Trim() + "'";
            }

            if (!(indica.ToUpper().IndexOf("_I") > 0 || indica.ToUpper().IndexOf("_S") > 0))
            {

                if (modo == 1)
                {
                    sql += Nombre + ",";
                    Resto += Valor + ",";
                }
                else
                {
                    if (indica.ToUpper().IndexOf("_C") == -1)
                    {
                        sql += Nombre + " = " + Valor + ",";
                    }
                    else
                    {
                        Resto += Nombre + " = " + Valor + " AND";
                    }
                }
            }
            else if (indica.ToUpper().IndexOf("_C") > 0)
            {
                if (modo != 1)
                {
                    Resto += Nombre + " = " + Valor + " AND";
                    NoSecuencia = Valor;
                }
            }
            else if (indica.ToUpper().IndexOf("_S") > -1)
            {
                if (modo == 1)
                {
                    sql += Nombre + ",";
                    NoSecuencia = BuscaSecuencia(Nombre);
                    Resto += NoSecuencia + ",";
                }
            }
            else if (indica.ToUpper().IndexOf("_I") > -1)
            {
                if (modo == 1)
                {
                    cola = "SELECT @@IDENTITY AS A";
                }
            }
        }

        sql = sql.Substring(0, sql.Length - 1);
        if (Resto.Length > 0)
        {
            if (modo == 1)
            {
                Resto = Resto.Substring(0, Resto.Length - 1);
            }

            else
            {
                Resto = Resto.Substring(0, Resto.Length - 3);
            }
        }

        if (modo == 1)
        {
            sql = "INSERT INTO " + tabla + "  (" + sql + "," + CampoUsuario + "," + tabla.Substring(1) + "FechaReg) SELECT " + Resto + "," + HttpContext.Current.Session["idUser"] + ",GETDATE(); " + cola;
        }
        else
        {
            sql = "UPDATE " + tabla + "  set " + sql + ", " + CampoUsuario + " = " + (HttpContext.Current.Session["idUser"]) + "," + tabla.Substring(1) + "FechaReg = GETDATE() WHERE " + Resto;
        }
        try
        {
            object a;
            string cone = ConfigurationManager.ConnectionStrings["conexionSql"].ConnectionString;
            SqlConnection sCnn = new SqlConnection(cone);

            sCnn.Open();

            SqlCommand oCmd = new SqlCommand(sql, sCnn);
            oCmd.CommandType = CommandType.Text;
            a = oCmd.ExecuteScalar();

            if (modo == 1 && cola != string.Empty)
            {
                NoSecuencia = a.ToString();
            }
            retorna = Convert.ToString(NoSecuencia);
        }

        catch (Exception)
        {
            retorna = "-1";
        }

        return retorna;
    }

    public static string BuscaSecuencia(string nombre)
    {
        string Retorna = "0";
        string Sql = string.Empty;
        Sql = "DECLARE @Secuencia INT;";
        Sql += " UPDATE Contadores SET Secuencia=ISNULL(Secuencia,0)+1,@Secuencia=ISNULL(Secuencia,0)+1";
        Sql += " WHERE  Campo = '" + nombre + "';";
        Sql += " SELECT @Secuencia Secuencia;";

        string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(conexion))
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            using (SqlCommand cmd2 = new SqlCommand(Sql, conn))
            {
                using (SqlDataReader dr = cmd2.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        Retorna = dr["Secuencia"].ToString();
                    }
                }
            }
        }

        return Retorna;
    }



    [WebMethod]
    public static string consultaPrg(string consulta)
    {
        string Retorna = string.Empty;
        string Sql = string.Empty;
        string Query = string.Empty;

        string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
        Sql = " SELECT query, Titulo FROM dadmrol WHERE campo = '" + consulta + "'";
        try
        {
            using (SqlConnection conn = new SqlConnection(conexion))
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                using (SqlCommand cmd = new SqlCommand(Sql, conn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                Query = dr["query"].ToString().Trim();
                            }
                        }
                    }
                }
                using (SqlCommand cmd = new SqlCommand(Query, conn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            Retorna += "<table id='tbPrincipal' class='table table-striped table-bordered table-hover'>";
                            Retorna += "<thead>";
                            Retorna += "<tr class='table_heading'>";

                            for (int i = 0; i < dr.FieldCount; i++)
                            {
                                if (i == 0)
                                {
                                    Retorna += "<th></th>";
                                }
                                Retorna += "<th nowrap >" + dr.GetName(i) + "</th>";
                            }
                            Retorna += "</tr>";
                        }
                        Retorna += "</thead>";
                        Retorna += "<tbody>";

                        while (dr.Read())
                        {
                            for (int i = 0; i < dr.FieldCount; i++)
                            {
                                if (i == 0)
                                {
                                    Retorna += "<tr><td> <input type='checkbox' value='" + dr[i].ToString() + "' id='chk_" + dr[i].ToString() + "' onclick=" + (char)34 + "javascript:verificaMarcado(this)" + (char)34 + "></td>";
                                }
                                if (dr.GetName(i).ToLower() == "estado")
                                {
                                    if (dr[i].ToString().ToLower() == "activo")
                                    {
                                        Retorna += "<td nowrap><span class='estado Activo'>Activo</span></td>";
                                    }
                                    else
                                    {
                                        Retorna += "<td nowrap><span class='estado Inactivo'>Inactivo</span></td>";
                                    }
                                }
                                else
                                {
                                    Retorna += "<td nowrap >" + dr[i].ToString() + "</td>";
                                }
                            }
                            Retorna += "</tr>";
                        }
                        Retorna += "</tbody>";
                        Retorna += "</table>";
                    }
                }
            }
        }
        catch (Exception)
        {

        }

        return Retorna;
    }


    [WebMethod]
    public static string consultaGral(string consulta)
    {

        string Retorna = string.Empty;
        string Sql = string.Empty;
        string Query = string.Empty;

        string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
        Sql = " SELECT query, Titulo FROM consulta WHERE campo = '" + consulta + "'";
        try
        {
            using (SqlConnection conn = new SqlConnection(conexion))
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                using (SqlCommand cmd2 = new SqlCommand(Sql, conn))
                {
                    using (SqlDataReader dr = cmd2.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            Retorna += "<table id='tbconsultaGeneral' class='table table-condensed table-hover table-bordered'>";
                            Retorna += "<thead>";
                            Retorna += "<tr>";
                            for (int i = 0; i < dr.FieldCount; i++)
                            {
                                if (i == 0)
                                {
                                    Retorna += "<th nowrap >Bto</th>";
                                }
                                Retorna += "<th nowrap >" + dr.GetName(i) + "</th>";
                            }
                            Retorna += "</tr>";
                        }
                        Retorna += "</thead>";
                        Retorna += "<tbody>";

                        while (dr.Read())
                        {
                            for (int i = 0; i < dr.FieldCount; i++)
                            {
                                if (i == 0)
                                {
                                    Retorna += "<tr><td><img src='Img/plain/application_enterprise_add.png' style='cursor:pointer' onclick=" + (char)34 + "javascript:ponerValorConsulta('" + dr[i].ToString() + "')" + (char)34 + "</td>";
                                }

                                Retorna += "<td nowrap >" + dr[i].ToString() + "</td>";
                            }
                            Retorna += "</tr>";
                        }
                        Retorna += "</tbody>";
                        Retorna += "</table>";
                    }
                }
            }
        }
        catch (Exception)
        {

        }

        return Retorna;

    }

    [WebMethod]
    public static string consultaPrincipal(string consulta)
    {

        string Retorna = string.Empty;
        string Sql = string.Empty;
        string Query = string.Empty;

        string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
        Sql = " SELECT query, Titulo FROM consulta WHERE campo = '" + consulta + "'";
        try
        {
            using (SqlConnection conn = new SqlConnection(conexion))
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                using (SqlCommand cmd = new SqlCommand(Sql, conn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                Query = dr["query"].ToString().Trim();
                            }
                        }
                    }
                }
                using (SqlCommand cmd = new SqlCommand(Query, conn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            Retorna += "<table id='tbPrincipal' class='table table-striped table-bordered table-hover'>";
                            Retorna += "<thead>";
                            Retorna += "<tr class='table_heading'>";

                            for (int i = 0; i < dr.FieldCount; i++)
                            {
                                if (i == 0)
                                {
                                    Retorna += "<th></th>";
                                }
                                Retorna += "<th nowrap >" + dr.GetName(i) + "</th>";
                            }
                            Retorna += "</tr>";
                        }
                        Retorna += "</thead>";
                        Retorna += "<tbody>";

                        while (dr.Read())
                        {
                            for (int i = 0; i < dr.FieldCount; i++)
                            {
                                if (i == 0)
                                {
                                    Retorna += "<tr><td> <input type='checkbox' value='" + dr[i].ToString() + "' id='chk_" + dr[i].ToString() + "' onclick=" + (char)34 + "javascript:verificaMarcado(this)" + (char)34 + "></td>";
                                }
                                if (dr.GetName(i).ToLower() == "estado")
                                {
                                    if (dr[i].ToString().ToLower() == "activo")
                                    {
                                        Retorna += "<td nowrap><span class='estado Activo'>Activo</span></td>";
                                    }//--Revisar
                                    else if (dr[i].ToString().ToLower() == "abierto")
                                    {
                                        Retorna += "<td nowrap><span class='estado Activo'>Abierto</span></td>";
                                    }
                                    else if (dr[i].ToString().ToLower() == "cerrado")
                                    {
                                        Retorna += "<td nowrap><span class='estado Inactivo'>Cerrado</span></td>";
                                    }//--Revisar
                                    else
                                    {
                                        Retorna += "<td nowrap><span class='estado Inactivo'>Inactivo</span></td>";
                                    }
                                }
                                else
                                {
                                    Retorna += "<td nowrap >" + dr[i].ToString() + "</td>";
                                }
                            }
                            Retorna += "</tr>";
                        }
                        Retorna += "</tbody>";
                        Retorna += "</table>";
                    }
                }
            }
        }
        catch (Exception)
        {

        }

        return Retorna;

    }

    [WebMethod]
    public static string buscarConsulta(string campo, string valor)
    {
        string Retorna = string.Empty;
        string Sql = string.Empty;
        string Query = string.Empty;
        string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
        Retorna += "limpiarConsulta('" + campo + "');";
        Sql = " SELECT query FROM consulta WHERE campo = '" + campo + "'";

        try
        {
            SqlConnection conn = new SqlConnection(conexion);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand(Sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Query = dr["query"].ToString().Trim() + " WHERE " + campo + " = " + valor;
            }

            conn.Close();

            if (Query != String.Empty)
            {
                SqlConnection conn2 = new SqlConnection(conexion);

                if (conn2.State == ConnectionState.Closed)
                {
                    conn2.Open();
                }
                SqlCommand cmd2 = new SqlCommand(Query, conn2);
                SqlDataReader dr2 = cmd2.ExecuteReader();

                while (dr2.Read())
                {
                    Retorna += "ponerValorConsultaSub('" + dr2.GetName(1) + "','" + dr2.ToString() + "');";
                }
                conn2.Close();
            }
        }
        catch (Exception)
        {
            throw;
        }
        return Retorna;
    }

    [WebMethod]
    public static ArrayList LlenaCombo(string combo, string where, string tabla)
    {
        string sql = string.Empty;
        string Retorna = string.Empty;
        ArrayList arrItems = new ArrayList();

        string query = string.Empty;
        string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

        sql = "SELECT query FROM consulta WHERE campo = '" + combo + "'";
        SqlConnection conn = new SqlConnection(conexion);
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            query = dr["query"].ToString();
        }

        if (query != string.Empty)
        {
            SqlConnection conn2 = new SqlConnection(conexion);
            if (conn2.State == ConnectionState.Closed)
            {
                conn2.Open();
            }

            if (combo.ToUpper() == "ADMSTSCODIGO")
            {
                query += " WHERE AdmstsTabla = '" + tabla + "' ORDER BY 2";
            }

            SqlCommand cmd2 = new SqlCommand(query, conn2);
            SqlDataReader dr2 = cmd2.ExecuteReader();
            while (dr2.Read())
            {

                arrItems.Add(new ListItem(dr2[1].ToString(), dr2[0].ToString()));
            }
        }

        return arrItems;
    }

    [WebMethod]
    public static string FechaYYYYMMDD(string Fecha)
    {

        string FechaReal = "";
        if (Fecha.Length == 10)
        {
            string[] fec = Fecha.Split('/');
            FechaReal = fec[2] + "/" + fec[1] + "/" + fec[0];

        }
        return FechaReal;
    }

    [WebMethod]
    public static string AreglaIndica(string campo)
    {
        if (campo.IndexOf(".") > 0)
        {
            campo = campo.Substring(campo.IndexOf("."));

        }
        return campo;

    }

    [WebMethod]
    public static string AreglaNombre(string campo)
    {
        if (campo.IndexOf(".") > 0)
        {
            campo = campo.Substring(0, campo.IndexOf("."));

        }
        return campo;

    }

    [WebMethod]
    public static string consultaGralParametro(string consulta, string where)
    {
        string Retorna = string.Empty;
        string Sql = string.Empty;
        string Query = string.Empty;
        string conexion = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

        Sql = " SELECT query,Titulo FROM consulta WHERE campo = '" + consulta + "'";
        try
        {

            using (SqlConnection conn = new SqlConnection(conexion))
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();

                }

                using (SqlCommand cmd = new SqlCommand(Sql, conn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Retorna = dr["Titulo"].ToString().Trim() + "|";
                            Query = dr["query"].ToString().Trim();
                        }
                    }
                    if (Query != string.Empty)
                    {
                        Query = Query + " WHERE " + where;
                        using (SqlConnection conn2 = new SqlConnection(conexion))
                        {
                            if (conn2.State == ConnectionState.Closed)
                            {
                                conn2.Open();
                            }
                            using (SqlCommand cmd2 = new SqlCommand(Query, conn2))
                            {
                                using (SqlDataReader dr1 = cmd2.ExecuteReader())
                                {
                                    if (dr1.HasRows)
                                    {
                                        Retorna += "<table id='tbconsultaGeneral' class='table table-condensed table-hover table-bordered'>";
                                        Retorna += "<thead>";
                                        Retorna += "<tr>";

                                        for (int i = 0; i < dr1.FieldCount; i++)
                                        {
                                            if (i == 0)
                                            {
                                                Retorna += "<th nowrap >Bto</th>";
                                            }
                                            Retorna += "<th nowrap >" + dr1.GetName(i) + "</th>";

                                        }
                                        Retorna += "</tr>";

                                    }
                                    Retorna += "</thead>";
                                    Retorna += "<tbody>";

                                    while (dr1.Read())
                                    {
                                        for (int i = 0; i < dr1.FieldCount; i++)
                                        {
                                            if (i == 0)
                                            {
                                                Retorna += "<tr><td><img src='Img/plain/application_enterprise_add.png' style='cursor:pointer' onclick=" + (char)34 + "javascript:ponerValorConsulta('" + dr1[i].ToString() + "')" + (char)34 + "</td>";

                                            }
                                            Retorna += "<td nowrap >" + dr1[i].ToString() + "</td>";

                                        }
                                        Retorna += "</tr>";

                                    }
                                    Retorna += "</tbody>";
                                    Retorna += "</table>";
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (Exception)
        {

        }
        return Retorna;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
