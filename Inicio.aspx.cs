using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DdClaseList.Items.Count!=3)
            cargarClaseArticulos();
        string cantidad = Request.QueryString["cantidad"];
        if (cantidad != null)
            listarTabla(cantidad, 1);
        else
        {
            cantidad = Request.QueryString["nombre"];
            if (cantidad != null)
                listarTabla(cantidad, 0);
            else
            {
                cantidad = Request.QueryString["clase"];
                if (cantidad != null)
                    listarTabla(cantidad, 2);
                else
                {
                    listarTabla(cantidad, 3);
                }
            }
        }
        cantidad= Request.QueryString["result"];
        if (cantidad!=null) 
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Result", "alert('Se agrego el articulo')", true);
        
    }

    protected void btFiltNombre_Click(object sender, EventArgs e)
    {
        string nombre = tbfiltNombre.Text;
        if (nombre.Length > 0)
            Response.Redirect("Inicio.aspx?nombre=" + nombre);
        else
            Response.Redirect("Inicio.aspx");
    }
    
    protected void listarTabla(string dato, int accion)
    {
        string mainconn = @"Data Source=LAPTOP-N94K9UFB;Initial Catalog=Tarea2;Integrated Security=True";
        SqlConnection sqlconn = new SqlConnection(mainconn);
        if (accion == 0)
        {
            SqlCommand sqlcomm = new SqlCommand("[dbo].[filtrar_Nombre]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.AddWithValue("@InNombre", dato);
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridArticulos.DataSource = dt;
            GridArticulos.DataBind();
            sqlconn.Close();
        }
        else if (accion == 1)
        { 
            SqlCommand sqlcomm = new SqlCommand("[dbo].[Filtrar_Cantidad]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.AddWithValue("@InCantidad", int.Parse(dato));
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridArticulos.DataSource = dt;
            GridArticulos.DataBind();
            sqlconn.Close();
        }
        else if (accion == 2) 
        {
            SqlCommand sqlcomm = new SqlCommand("[dbo].[Filtrar_ClaseArticulo]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.AddWithValue("@InClaseArticulo", dato);
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridArticulos.DataSource = dt;
            GridArticulos.DataBind();
            sqlconn.Close();
        }
        else
        {
            SqlCommand sqlcomm = new SqlCommand("[dbo].[listar_Articulos]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridArticulos.DataSource = dt;
            GridArticulos.DataBind();
            sqlconn.Close();
        }

    }

    protected void cargarClaseArticulos()
    {
        string conxString = "Data Source=LAPTOP-N94K9UFB;Initial Catalog=Tarea2;Integrated Security=True";
        string query = "listar_claseArticulos";
        using (SqlConnection connection = new SqlConnection(conxString))
        {
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.CommandType = CommandType.StoredProcedure;
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string nombre = reader["Nombre"].ToString();
                DdClaseList.Items.Add(nombre);
            }
            reader.Close();
            reader.Dispose();
            connection.Close();
        }
    }

    protected void btSalir1_Click(object sender, EventArgs e)
    {
        string cantidad = tbfiltCant.Text;
        if (Regex.IsMatch(cantidad, @"\d") && int.Parse(cantidad) >= 0)
            Response.Redirect("Inicio.aspx?cantidad=" + cantidad);
        else if (cantidad== "")
        {
            Response.Redirect("Inicio.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "err_Cant", "alert('Tienes que introducir un numero entero')", true);
        }
    }
    protected void btFiltClase_Click(object sender, EventArgs e)
    {
        string clase = DdClaseList.SelectedValue;
        Response.Redirect("Inicio.aspx?clase=" + clase);
    }

    protected void btInsertar_Click(object sender, EventArgs e)
    {
        Response.Redirect("InsertarArtic.aspx");
    }
}