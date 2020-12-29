using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CotPc
{
    public partial class Buscar : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string Categoria = " and e.Categoria = ";
            string sCategoria = "";

            if (!string.IsNullOrEmpty(Session["categoria"] as string))
            {
                sCategoria = this.Session["categoria"].ToString();
                SqlDSEquipos.SelectCommand = SqlDSEquipos.SelectCommand + Categoria + "'" + sCategoria + "'"; ;
                lblCategoria.Text = "* Categoria: " + sCategoria;
            }

            string Procesador = " and e.Procesador in (select id_Procesador from Procesador where Marca = '";
            string sProcesador = "";
            if(!string.IsNullOrEmpty(Session["procesador"] as string))
            {
                sProcesador = Session["procesador"].ToString();
                SqlDSEquipos.SelectCommand = SqlDSEquipos.SelectCommand + Procesador + sProcesador + "')";
                lblProcesador.Text = "* Procesador: " + sProcesador;
            }

            string Presupuesto = " and p.PrecioCLP <= '";
            string sPresupuesto = "";
            if (!string.IsNullOrEmpty(Session["presupuesto"] as string) && int.Parse(Session["presupuesto"].ToString()) > 0)
            {
                sPresupuesto = Session["presupuesto"].ToString();
                SqlDSEquipos.SelectCommand = SqlDSEquipos.SelectCommand + Presupuesto + sPresupuesto + "'";
                lblPresupuesto.Text = "* Presupuesto: $" + sPresupuesto;
            }



        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            pnlSeleccion.Visible = true;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "window", "window.location='#Detalles'", true);
        }
    }
}