using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Printing;
using System.Runtime.Remoting.Messaging;

namespace Usuario
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string mainconn = @"Data Source=database-segunda.csuvznav9scq.us-east-1.rds.amazonaws.com,1433;
                                Initial Catalog=aaronWander;
                                User ID=admin;
                                Password=Wanderjose2";

            SqlConnection sqlconn = new SqlConnection(mainconn);

            /* SqlCommand sqlcomm = new SqlCommand("[dbo].[listar_articulos]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure; */

            sqlconn.Open();

            string checkuser = "SELECT count(*) FROM dbo.Usuario WHERE UserName='" + Nombre.Text + "'";
            SqlCommand sqlcomm = new SqlCommand(checkuser, sqlconn);
            int temp = Convert.ToInt32(sqlcomm.ExecuteScalar().ToString());
            sqlconn.Close();

            if (temp == 1)
            {
                sqlconn.Open();
                string checkpassword = "SELECT Password FROM dbo.Usuario WHERE UserName='" + Nombre.Text + "'";
                SqlCommand sqlpasscomm = new SqlCommand(checkpassword, sqlconn);
                string password = sqlpasscomm.ExecuteScalar().ToString().Replace(" ", "");
                if (password == Contrasena.Text)
                {
                    Session["New"] = Nombre.Text;
                    Response.Write("Bienvenido");
                }
                else
                {
                    Response.Write("Combinación de usuario / password no existe en la BD");
                }
            }
            else
            {
                Response.Write("Combinación de usuario / password no existe en la BD");
            }

            /* SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gridArticulos.DataSource = dt;
            gridArticulos.DataBind(); */
        }

    }
}