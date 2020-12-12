﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CotPc
{
    public partial class Inserciones_Solo_Administradores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        /*protected void chkGPUIntegrada_CheckedChanged(object sender, EventArgs e)
        {
            if (chkGPUIntegrada.Checked)
            {
                lblFrecGpuIntegrada.Visible = true;
                txtFrecGPUIntegrada.Visible = true;
            }
            else
            {
                lblFrecGpuIntegrada.Visible = false;
                txtFrecGPUIntegrada.Visible = false;
            }
        }*/


        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value.Equals("Procesador"))
            {
                pnlProcesador.Visible = true;
                pnlPlaca.Visible = false;
            }
            if (DropDownList1.SelectedItem.Value.Equals("Placa"))
            {
                pnlProcesador.Visible = false;
                pnlPlaca.Visible = true;
            }
        }

        protected void btnIngresarPr_Click(object sender, EventArgs e)
        {
           
            byte[] ImagenOriginal = null;
            if (FUProcesador.HasFile)
            {
                ImagenOriginal = FUProcesador.FileBytes;
                
                if (RegistrarProcesador(txtNucleos.Text.Trim(),txtFrecCPU.Text.Replace(',','.'),ddlMarcaPr.SelectedItem.Value,txtModeloPr.Text.Trim(), txtGeneracionPr.Text.Trim(),txtSocketPr.Text.Trim(),txtChipsetPr.Text.Trim(),txtFrecGPUIntegrada.Text.Trim(),txtTDPProcesador.Text.Trim(),txtconAlimentacionPr.Text.Trim(),txtNombreProductoPr.Text.Trim(),txtPrecioPr.Text.Trim(), ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                }

            }
            else
            {
                if (RegistrarProcesador(txtNucleos.Text.Trim(), txtFrecCPU.Text.Replace(',', '.'), ddlMarcaPr.SelectedItem.Value, txtModeloPr.Text.Trim(), txtGeneracionPr.Text.Trim(), txtSocketPr.Text.Trim(), txtChipsetPr.Text.Trim(), txtFrecGPUIntegrada.Text.Trim(), txtTDPProcesador.Text.Trim(), txtconAlimentacionPr.Text.Trim(), txtNombreProductoPr.Text.Trim(), txtPrecioPr.Text.Trim(), ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                }
            }  
        }

        protected void btnIngresarPlaca_Click(object sender, EventArgs e)
        {
            byte[] ImagenOriginal = null;
            bool eatx = rbE_ATX_Placa.Checked;
            bool atx = rbATX_Placa.Checked;
            bool microatx = rbMicro_ATX_Placa.Checked;
            bool itx = rbITX_Placa.Checked;
            if(!eatx && !atx && !microatx && !itx)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Por favor, seleccione tipo de placa')", true);
            }
            if (FUPlaca.HasFile)
            {
                ImagenOriginal = FUPlaca.FileBytes;

                if (RegistrarPlaca(eatx, atx, microatx, itx, txtSocketPl.Text.Trim(), txtChipsetPl.Text.Trim(), ddlTipoRAM_Pl.SelectedItem.Value, txtFrecMinRAM.Text, txtFrecMaxRAM.Text, ddlConfigRAM_Pl.SelectedItem.Value, chkPCIExpressx16Pl.Checked, txtconA_Placa.Text.Trim(), txtNombreProductoPl.Text.Trim(), txtPrecioPl.Text, ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                }
            }
            else
            {
                if (RegistrarPlaca(eatx, atx, microatx, itx, txtSocketPl.Text.Trim(), txtChipsetPl.Text.Trim(), ddlTipoRAM_Pl.SelectedItem.Value, txtFrecMinRAM.Text, txtFrecMaxRAM.Text, ddlConfigRAM_Pl.SelectedItem.Value, chkPCIExpressx16Pl.Checked, txtconA_Placa.Text.Trim(), txtNombreProductoPl.Text.Trim(), txtPrecioPl.Text, ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                }
            }

        }

        protected bool RegistrarPlaca(bool E_ATX, bool ATX, bool Micro_ATX, bool ITX, string Socket, string Chipset, string TipoRAM, string frecMinRAM, string frecMaxRAM, string confRAM, bool PCIExpressx16, string conAlPlaca, string NombreProd, string precio, byte[] img)
        {
            /*try
            {*/
                string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion"].ConnectionString;
                string query;
                if (img != null)
                {
                    query = "exec InsertarPlaca @E_ATX, @ATX, @MicroATX, @ITX, @Socket, @Chipset, @TipoRAM, @frecMinRAM, @frecMaxRAM, @confRAM, @PCIExpressx16, @conAlPlaca, @NombreProd, @precio, @img";
                }
                else
                {
                    query = "exec InsertarPlaca @E_ATX, @ATX, @MicroATX, @ITX, @Socket, @Chipset, @TipoRAM, @frecMinRAM, @frecMaxRAM, @confRAM, @PCIExpressx16, @conAlPlaca, @NombreProd, @precio, null";
                }

                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand cmd = new SqlCommand(query, conexion);

                cmd.Parameters.AddWithValue("@NombreProd", NombreProd);
            cmd.Parameters.AddWithValue("@precio", precio);
                if (img != null)
                {
                    cmd.Parameters.AddWithValue("@img", img);
                }
                cmd.Parameters.AddWithValue("@E_ATX",E_ATX).SqlDbType = System.Data.SqlDbType.Bit;
                cmd.Parameters.AddWithValue("@ATX", ATX).SqlDbType = System.Data.SqlDbType.Bit;
                cmd.Parameters.AddWithValue("@MicroATX", Micro_ATX).SqlDbType = System.Data.SqlDbType.Bit;
                cmd.Parameters.AddWithValue("@ITX", ITX).SqlDbType = System.Data.SqlDbType.Bit;
                cmd.Parameters.AddWithValue("@Socket", Socket);
                cmd.Parameters.AddWithValue("@Chipset", Chipset);
                cmd.Parameters.AddWithValue("@TipoRAM", TipoRAM);
            cmd.Parameters.AddWithValue("@frecMinRAM", frecMinRAM);
            cmd.Parameters.AddWithValue("@frecMaxRAM", frecMaxRAM);
            cmd.Parameters.AddWithValue("@confRAM", confRAM);
            cmd.Parameters.AddWithValue("@PCIExpressx16", PCIExpressx16).SqlDbType = System.Data.SqlDbType.Bit;
                cmd.Parameters.AddWithValue("@conAlPlaca", conAlPlaca);
                cmd.ExecuteNonQuery();
                conexion.Close();

                return true;
            /*}
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Ha habido un error al ingresar la placa madre, comuniquese con el administrador<br>\n" + ex + "')", true);
                return false;
            }*/
        }

        public bool RegistrarProcesador(string nucleos, string frecpr, string marca, string modelo, string generacion, string socket, string chipset, string frecgpu, string tdp, string conApr, string nombreProd, string precio, byte[] img)
        {
            try
            {
                string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion"].ConnectionString;
                string query;
                if (frecgpu.Trim().Equals(null) || frecgpu.Trim().Equals("0") || frecgpu.Trim().Equals(""))
                {
                    if (img != null)
                    {
                        query = "exec InsertarProcesador @nucleos, @frecpr, @marca, @modelo, @generacion, @socket, @chipset, null, @tdp, " +
                            "@conApr, @nombreProd, @precio, @Imagen";
                    }
                    else
                    {
                        query = "exec InsertarProcesador @nucleos, @frecpr, @marca, @modelo, @generacion, @socket, @chipset, null, @tdp, " +
                            "@conApr, @nombreProd, @precio, null";
                    }
                }
                else
                {
                    if (img != null)
                    {
                        query = "exec InsertarProcesador @nucleos, @frecpr, @marca, @modelo, @generacion, @socket, @chipset, @frecgpu, @tdp, " +
                            "@conApr, @nombreProd, @precio, @Imagen";
                    }
                    else
                    {
                        query = "exec InsertarProcesador @nucleos, @frecpr, @marca, @modelo, @generacion, @socket, @chipset, @frecgpu, @tdp, " +
                            "@conApr, @nombreProd, @precio, null";
                    }
                }


                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@nucleos", nucleos);
                cmd.Parameters.AddWithValue("@frecpr", frecpr);
                cmd.Parameters.AddWithValue("@marca", marca);
                cmd.Parameters.AddWithValue("@modelo", modelo);
                cmd.Parameters.AddWithValue("@generacion", generacion);
                cmd.Parameters.AddWithValue("@socket", socket);
                cmd.Parameters.AddWithValue("@chipset", chipset);
                cmd.Parameters.AddWithValue("@frecgpu", frecgpu);
                cmd.Parameters.AddWithValue("@tdp", tdp);
                cmd.Parameters.AddWithValue("@conApr", conApr);
                cmd.Parameters.AddWithValue("@nombreProd", nombreProd);
                cmd.Parameters.AddWithValue("@precio", precio);
                if (img != null)
                {
                    cmd.Parameters.AddWithValue("@Imagen", img);
                }
                cmd.ExecuteNonQuery();
                conexion.Close();
                return true;
            }
            catch (SqlException e)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Ha habido un error al ingresar el procesador, comuniquese con el administrador<br>\n" + e + "')", true);
                return false;
            }
        }

        
    }
}