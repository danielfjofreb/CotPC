using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CotPc
{
    public partial class NuevoUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                if (VerificarExistencia())
                {
                    try
                    {
                        SqlDataSource1.Insert();
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Usuario registrado!')", true);

                        //Response.Redirect("HomeAdmin.aspx");
                    }
                    catch
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al registrar usuario')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('No se ha registrado al nuevo usuario, compruebe existencia')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('No se ha registrado al nuevo usuario, debe aceptar nuestros términos')", true);
            }
        }

        public bool VerificarExistencia()
        {
            bool ver = false;
            SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader datos;
            datos = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (!datos.Read())
            {
                ver = true;
            }
            return ver;
        }
    }
}