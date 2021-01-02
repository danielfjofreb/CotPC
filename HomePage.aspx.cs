using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CotPc
{
    public partial class HomePAg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["categoria"] as string))
            {
                if (Session["categoria"].ToString().Equals("Gamer"))
                {
                    lblSelecciónCategoria.Text = "* Uso: Jugar";
                }
                else
                {
                    lblSelecciónCategoria.Text = "* Uso: "+Session["categoria"].ToString();
                }
                pnlslide2.Visible = false;
                categoria.Value = Session["categoria"].ToString();
                pnlLimpiarSeleccion1.Visible = true;
            }
            if (!string.IsNullOrEmpty(Session["procesador"] as string))
            {
                lblPreferenciaPC.Text = "* Procesador de preferencia: " + Session["procesador"].ToString();
                pnlLimpiarSeleccion2.Visible = true;
                pnlslide3.Visible = false;
                procesador.Value = Session["procesador"].ToString();
            }
            if (!string.IsNullOrEmpty(Session["presupuesto"] as string))
            {
                lblPresupuesto.Text = "* Presupuesto: $" + Session["presupuesto"].ToString();
                Presupuesto.Value = Session["presupuesto"].ToString();
            }
        }

        protected void imgbtnOficina_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "window", "window.location='#slide3'", true);
            pnlslide2.Visible = false;
            pnlLimpiarSeleccion1.Visible = true;
            categoria.Value = "Oficina";
            this.Session["categoria"] = categoria.Value;
            lblSelecciónCategoria.Text = "* Uso: "+categoria.Value;
        }

        protected void imgbtnIntel_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "window", "window.location='#slide4'", true);
            procesador.Value = "Intel";
            lblPreferenciaPC.Text = "* Procesador de preferencia: "+procesador.Value;
            pnlLimpiarSeleccion2.Visible = true;
            pnlslide3.Visible = false;
        }

        protected void imgbtnDisenio_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "window", "window.location='#slide3'", true);
            pnlslide2.Visible = false;
            categoria.Value = "Diseño/Producción";
            this.Session["categoria"] = categoria.Value;
            pnlLimpiarSeleccion1.Visible = true;
            lblSelecciónCategoria.Text = "* Uso: "+categoria.Value;
        }

        protected void imgbtnGamer_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "window", "window.location='#slide3'", true);
            pnlslide2.Visible = false;
            categoria.Value = "Gamer";
            this.Session["categoria"] = categoria.Value;
            pnlLimpiarSeleccion1.Visible = true;
            lblSelecciónCategoria.Text = "* Uso: Jugar";
        }

        protected void btnLimpiarCategoria_ServerClick(object sender, EventArgs e)
        {
            lblSelecciónCategoria.Text = "";
            pnlslide2.Visible = true;
            pnlLimpiarSeleccion1.Visible = false;
            categoria.Value = "";
            this.Session["categoria"] = categoria.Value;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "window", "window.location='#slide2'", true);
        }

        protected void imgbtnAMD_Click(object sender, ImageClickEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "window", "window.location='#slide4'", true);
            procesador.Value = "AMD";
            lblPreferenciaPC.Text = "* Procesador de preferencia: "+procesador.Value;
            this.Session["procesador"] = procesador.Value;
            pnlLimpiarSeleccion2.Visible = true;
            pnlslide3.Visible = false;
        }

        protected void btnLimpiarPreferencia_ServerClick(object sender, EventArgs e)
        {
            lblPreferenciaPC.Text = "";
            pnlLimpiarSeleccion2.Visible = false;
            procesador.Value = "";
            pnlslide3.Visible = true;
            this.Session["procesador"] = procesador.Value;
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "window", "window.location='#slide3'", true);
        }

        protected void txtPresupuesto_TextChanged(object sender, EventArgs e)
        {
            if (!txtPresupuesto.Text.Equals("0") && !txtPresupuesto.Text.Equals(""))
            {
                Presupuesto.Value = int.Parse(txtPresupuesto.Text).ToString();
                lblPresupuesto.Text = "* Presupuesto: $" + (Presupuesto.Value);
                this.Session["presupuesto"] = Presupuesto.Value;
            }
            else if (txtPresupuesto.Text.Equals("0"))
            {
                Presupuesto.Value = "";
                lblPresupuesto.Text = "";
                this.Session["presupuesto"] = Presupuesto.Value;
            }
            else
            {
                Presupuesto.Value = "";
                lblPresupuesto.Text = "";
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "window", "window.location='#slide5'", true);
        }

        protected void btnir_Click(object sender, EventArgs e)
        {
            this.Session["categoria"] = categoria.Value;
            this.Session["procesador"] = procesador.Value;
            if (!txtPresupuesto.Text.Equals("0") && !txtPresupuesto.Text.Equals(""))
            {
                Presupuesto.Value = int.Parse(txtPresupuesto.Text).ToString();
                lblPresupuesto.Text = "* Presupuesto: $" + (Presupuesto.Value);
            }
            else if (txtPresupuesto.Text.Equals("0"))
            {
                Presupuesto.Value = "";
                lblPresupuesto.Text = "";
            }

            this.Session["presupuesto"] = (Presupuesto.Value);
            Response.Redirect("Comenzar.aspx");
        }
    }
}