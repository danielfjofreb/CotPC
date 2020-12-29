using System;
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
            if (this.Session["user"] != null && this.Session["pass"] != null)
            {
                txtUser.Text = this.Session["user"].ToString();
                txtPass.Text = this.Session["pass"].ToString();
                SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader datos;
                datos = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (datos.Read())
                {
                    ventanaLogin.Visible = false;
                    txtUser.Enabled = false;
                    txtPass.Enabled = false;
                    HPLAdd.Enabled = true;
                    DropDownList1.Enabled = true;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Seleccion de productos: Habilita los paneles correspondientes
            switch (DropDownList1.SelectedItem.Value)
            {
                case "Procesador":
                    pnlProcesador.Visible = true;
                    pnlPlaca.Visible = false;
                    pnlTarjetaVideo.Visible = false;
                    pnlFuentePoder.Visible = false;
                    pnlRAM.Visible = false;
                    pnlDisipador.Visible = false;
                    pnlGabinete.Visible = false;
                    pnlDisco.Visible = false;
                    pnlEquipo.Visible = false;
                    break;
                case "Placa":
                    pnlProcesador.Visible = false;
                    pnlPlaca.Visible = true;
                    pnlTarjetaVideo.Visible = false;
                    pnlFuentePoder.Visible = false;
                    pnlRAM.Visible = false;
                    pnlDisipador.Visible = false;
                    pnlGabinete.Visible = false;
                    pnlDisco.Visible = false;
                    pnlEquipo.Visible = false;
                    break;
                case "Tarjeta de Video":
                    pnlProcesador.Visible = false;
                    pnlPlaca.Visible = false;
                    pnlTarjetaVideo.Visible = true;
                    pnlFuentePoder.Visible = false;
                    pnlRAM.Visible = false;
                    pnlDisipador.Visible = false;
                    pnlGabinete.Visible = false;
                    pnlDisco.Visible = false;
                    pnlEquipo.Visible = false;
                    break;
                case "Fuente de Poder":
                    pnlProcesador.Visible = false;
                    pnlPlaca.Visible = false;
                    pnlTarjetaVideo.Visible = false;
                    pnlFuentePoder.Visible = true;
                    pnlRAM.Visible = false;
                    pnlDisipador.Visible = false;
                    pnlGabinete.Visible = false;
                    pnlDisco.Visible = false;
                    pnlEquipo.Visible = false;
                    break;
                case "RAM":
                    pnlProcesador.Visible = false;
                    pnlPlaca.Visible = false;
                    pnlTarjetaVideo.Visible = false;
                    pnlFuentePoder.Visible = false;
                    pnlRAM.Visible = true;
                    pnlDisipador.Visible = false;
                    pnlGabinete.Visible = false;
                    pnlDisco.Visible = false;
                    pnlEquipo.Visible = false;
                    break;
                case "Disipador":
                    pnlProcesador.Visible = false;
                    pnlPlaca.Visible = false;
                    pnlTarjetaVideo.Visible = false;
                    pnlFuentePoder.Visible = false;
                    pnlRAM.Visible = false;
                    pnlDisipador.Visible = true;
                    pnlGabinete.Visible = false;
                    pnlDisco.Visible = false;
                    pnlEquipo.Visible = false;
                    break;
                case "Gabinete":
                    pnlProcesador.Visible = false;
                    pnlPlaca.Visible = false;
                    pnlTarjetaVideo.Visible = false;
                    pnlFuentePoder.Visible = false;
                    pnlRAM.Visible = false;
                    pnlDisipador.Visible = false;
                    pnlGabinete.Visible = true;
                    pnlDisco.Visible = false;
                    pnlEquipo.Visible = false;
                    break;
                case "Disco Duro":
                    pnlProcesador.Visible = false;
                    pnlPlaca.Visible = false;
                    pnlTarjetaVideo.Visible = false;
                    pnlFuentePoder.Visible = false;
                    pnlRAM.Visible = false;
                    pnlDisipador.Visible = false;
                    pnlGabinete.Visible = false;
                    pnlDisco.Visible = true;
                    pnlEquipo.Visible = false;
                    break;
                case "Equipo Preestablecido":
                    pnlProcesador.Visible = false;
                    pnlPlaca.Visible = false;
                    pnlTarjetaVideo.Visible = false;
                    pnlFuentePoder.Visible = false;
                    pnlRAM.Visible = false;
                    pnlDisipador.Visible = false;
                    pnlGabinete.Visible = false;
                    pnlDisco.Visible = false;
                    pnlEquipo.Visible = true;


                    ddlProcesadorE.DataBind();
                    ddlProcesadorE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                    ddlPlacaE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                    ddlRAME.Items.Insert(0, new ListItem("---Seleccione---", ""));
                    ddlDisipadorE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                    ddlGPUE.DataBind();
                    ddlGPUE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                    ddlPSUE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                    ddlDiscoDuroE.DataBind();
                    ddlDiscoDuroE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                    ddlGabineteE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                    break;


                default:
                    pnlProcesador.Visible = false;
                    pnlPlaca.Visible = false;
                    pnlTarjetaVideo.Visible = false;
                    pnlFuentePoder.Visible = false;
                    pnlRAM.Visible = false;
                    pnlDisipador.Visible = false;
                    pnlGabinete.Visible = false;
                    pnlDisco.Visible = false;
                    pnlEquipo.Visible = false;
                    break;
            }
        }

        protected void btnIngresarPr_Click(object sender, EventArgs e)
        {
            // Declarar arreglo de bytes para convertir las imagenes a bytes que se guarden en base de datos
            byte[] ImagenOriginal = null;
            if (FUProcesador.HasFile)
            {
                //Se rescata la imagen en bytes
                ImagenOriginal = FUProcesador.FileBytes;
                if (!FUProcesador.FileName.EndsWith(".svg"))
                {
                    FUProcesador.PostedFile.InputStream.Read(ImagenOriginal, 0, FUProcesador.PostedFile.ContentLength);
                    Bitmap imagenbinaria = new Bitmap(FUProcesador.PostedFile.InputStream);
                    System.Drawing.Image imgThumbnail;
                    int TamThumbnail = 300;
                    imgThumbnail = Redimensionar(imagenbinaria, TamThumbnail);
                    byte[] bImagenThumbnail = new byte[TamThumbnail];

                    ImageConverter Convertidor = new ImageConverter();
                    bImagenThumbnail = (byte[])Convertidor.ConvertTo(imgThumbnail, typeof(byte[]));

                    // Llama al metodo que usa el procedimiento almacenado "InsertarProcesador" con la imagen cargada
                    if (RegistrarProcesador(txtNucleos.Text.Trim(), txtFrecCPU.Text.Replace(',', '.'), ddlMarcaPr.SelectedItem.Value, txtModeloPr.Text.Trim(), txtGeneracionPr.Text.Trim(), txtSocketPr.Text.Trim(), txtChipsetPr.Text.Trim(), txtFrecGPUIntegrada.Text.Trim(), txtTDPProcesador.Text.Trim(), txtconAlimentacionPr.Text.Trim(), txtNombreProductoPr.Text.Trim(), txtPrecioPr.Text.Trim(), bImagenThumbnail))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                        txtNombreProductoPr.Text = "";
                        txtNucleos.Text = "";
                        txtChipsetPr.Text = "";
                        txtModeloPr.Text = "";
                        txtPrecioPr.Text = "";
                        txtconAlimentacionPr.Text = "";
                        txtFrecCPU.Text = "";
                        txtFrecGPUIntegrada.Text = "";
                        txtGeneracionPr.Text = "";
                        txtTDPProcesador.Text = "";
                    }
                }
                else
                {
                    // Llama al metodo que usa el procedimiento almacenado "InsertarProcesador" con la imagen svg cargada
                    if (RegistrarProcesador(txtNucleos.Text.Trim(), txtFrecCPU.Text.Replace(',', '.'), ddlMarcaPr.SelectedItem.Value, txtModeloPr.Text.Trim(), txtGeneracionPr.Text.Trim(), txtSocketPr.Text.Trim(), txtChipsetPr.Text.Trim(), txtFrecGPUIntegrada.Text.Trim(), txtTDPProcesador.Text.Trim(), txtconAlimentacionPr.Text.Trim(), txtNombreProductoPr.Text.Trim(), txtPrecioPr.Text.Trim(), ImagenOriginal))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen svg incluida)')", true);
                        txtNombreProductoPr.Text = "";
                        txtNucleos.Text = "";
                        txtChipsetPr.Text = "";
                        txtModeloPr.Text = "";
                        txtPrecioPr.Text = "";
                        txtconAlimentacionPr.Text = "";
                        txtFrecCPU.Text = "";
                        txtFrecGPUIntegrada.Text = "";
                        txtGeneracionPr.Text = "";
                        txtTDPProcesador.Text = "";
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }

            }
            else
            {
                // Llama al metodo que usa el procedimiento almacenado "InsertarProcesador" con la imagen vacia o null
                if (RegistrarProcesador(txtNucleos.Text.Trim(), txtFrecCPU.Text.Replace(',', '.'), ddlMarcaPr.SelectedItem.Value, txtModeloPr.Text.Trim(), txtGeneracionPr.Text.Trim(), txtSocketPr.Text.Trim(), txtChipsetPr.Text.Trim(), txtFrecGPUIntegrada.Text.Trim(), txtTDPProcesador.Text.Trim(), txtconAlimentacionPr.Text.Trim(), txtNombreProductoPr.Text.Trim(), txtPrecioPr.Text.Trim(), ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                    txtNombreProductoPr.Text = "";
                    txtNucleos.Text = "";
                    txtChipsetPr.Text = "";
                    txtModeloPr.Text = "";
                    txtPrecioPr.Text = "";
                    txtconAlimentacionPr.Text = "";
                    txtFrecCPU.Text = "";
                    txtFrecGPUIntegrada.Text = "";
                    txtGeneracionPr.Text = "";
                    txtTDPProcesador.Text = "";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                }
            }
        }

        protected void btnIngresarPlaca_Click(object sender, EventArgs e)
        {
            byte[] ImagenOriginal = null;
            // Variables que rescatan las selecciones de los radio buttons, se hacen booleanas por fines de compatibilidad con gabinete
            bool eatx = rbE_ATX_Placa.Checked;
            bool atx = rbATX_Placa.Checked;
            bool microatx = rbMicro_ATX_Placa.Checked;
            bool itx = rbITX_Placa.Checked;

            if (!eatx && !atx && !microatx && !itx)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Por favor, seleccione tipo de placa')", true);
                return;
            }
            if (FUPlaca.HasFile)
            {
                ImagenOriginal = FUPlaca.FileBytes;
                if (!FUPlaca.FileName.EndsWith(".svg"))
                {
                    FUPlaca.PostedFile.InputStream.Read(ImagenOriginal, 0, FUPlaca.PostedFile.ContentLength);
                    Bitmap imagenbinaria = new Bitmap(FUPlaca.PostedFile.InputStream);
                    System.Drawing.Image imgThumbnail;
                    int TamThumbnail = 300;
                    imgThumbnail = Redimensionar(imagenbinaria, TamThumbnail);
                    byte[] bImagenThumbnail = new byte[TamThumbnail];

                    ImageConverter Convertidor = new ImageConverter();
                    bImagenThumbnail = (byte[])Convertidor.ConvertTo(imgThumbnail, typeof(byte[]));

                    if (RegistrarPlaca(eatx, atx, microatx, itx, txtSocketPl.Text.Trim(), txtChipsetPl.Text.Trim(), ddlTipoRAM_Pl.SelectedItem.Value, txtFrecMinRAM.Text, txtFrecMaxRAM.Text, ddlConfigRAM_Pl.SelectedItem.Value, chkPCIExpressx16Pl.Checked, txtconA_Placa.Text.Trim(), txtNombreProductoPl.Text.Trim(), txtPrecioPl.Text, bImagenThumbnail))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }
                else
                {
                    if (RegistrarPlaca(eatx, atx, microatx, itx, txtSocketPl.Text.Trim(), txtChipsetPl.Text.Trim(), ddlTipoRAM_Pl.SelectedItem.Value, txtFrecMinRAM.Text, txtFrecMaxRAM.Text, ddlConfigRAM_Pl.SelectedItem.Value, chkPCIExpressx16Pl.Checked, txtconA_Placa.Text.Trim(), txtNombreProductoPl.Text.Trim(), txtPrecioPl.Text, ImagenOriginal))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }
            }
            else
            {
                if (RegistrarPlaca(eatx, atx, microatx, itx, txtSocketPl.Text.Trim(), txtChipsetPl.Text.Trim(), ddlTipoRAM_Pl.SelectedItem.Value, txtFrecMinRAM.Text, txtFrecMaxRAM.Text, ddlConfigRAM_Pl.SelectedItem.Value, chkPCIExpressx16Pl.Checked, txtconA_Placa.Text.Trim(), txtNombreProductoPl.Text.Trim(), txtPrecioPl.Text, ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                }
            }

        }

        protected bool RegistrarPlaca(bool E_ATX, bool ATX, bool Micro_ATX, bool ITX, string Socket, string Chipset, string TipoRAM, string frecMinRAM, string frecMaxRAM, string confRAM, bool PCIExpressx16, string conAlPlaca, string NombreProd, string precio, byte[] img)
        {
            try
            {
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
                cmd.Parameters.AddWithValue("@E_ATX", E_ATX).SqlDbType = System.Data.SqlDbType.Bit;
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
                int cont = cmd.ExecuteNonQuery();
                conexion.Close();
                if (cont > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }

            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Ha habido un error al ingresar la placa madre, comuniquese con el administrador<br>\n" + ex + "')", true);
                return false;
            }
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
                int cont = cmd.ExecuteNonQuery();
                conexion.Close();
                if (cont > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (SqlException e)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Ha habido un error al ingresar el procesador, comuniquese con el administrador<br>\n" + e + "')", true);
                return false;
            }
        }

        protected void btnIngresarGPU_Click(object sender, EventArgs e)
        {
            byte[] ImagenOriginal = null;
            if (FUGPU.HasFile)
            {
                ImagenOriginal = FUGPU.FileBytes;

                if (!FUGPU.FileName.EndsWith(".svg"))
                {
                    FUGPU.PostedFile.InputStream.Read(ImagenOriginal, 0, FUGPU.PostedFile.ContentLength);
                    Bitmap imagenbinaria = new Bitmap(FUGPU.PostedFile.InputStream);
                    System.Drawing.Image imgThumbnail;
                    int TamThumbnail = 300;
                    imgThumbnail = Redimensionar(imagenbinaria, TamThumbnail);
                    byte[] bImagenThumbnail = new byte[TamThumbnail];

                    ImageConverter Convertidor = new ImageConverter();
                    bImagenThumbnail = (byte[])Convertidor.ConvertTo(imgThumbnail, typeof(byte[]));

                    if (RegistrarGPU(txtMarcaGPU.Text, txtModeloGPU.Text, int.Parse(txtTDPGPU.Text), int.Parse(txtMedidaGPU.Text), int.Parse(txtVRAM.Text), ddlTipoVRAM.Text, txtPSURecomendadaGPU.Text.Trim(), txtconAlGPU.Text.Trim(), txtNombreProductoGPU.Text.Trim(), txtPrecioGPU.Text, bImagenThumbnail))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }
                else
                {
                    if (RegistrarGPU(txtMarcaGPU.Text, txtModeloGPU.Text, int.Parse(txtTDPGPU.Text), int.Parse(txtMedidaGPU.Text), int.Parse(txtVRAM.Text), ddlTipoVRAM.Text, txtPSURecomendadaGPU.Text.Trim(), txtconAlGPU.Text.Trim(), txtNombreProductoGPU.Text.Trim(), txtPrecioGPU.Text, ImagenOriginal))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }

            }
            else
            {
                if (RegistrarGPU(txtMarcaGPU.Text, txtModeloGPU.Text, int.Parse(txtTDPGPU.Text), int.Parse(txtMedidaGPU.Text), int.Parse(txtVRAM.Text), ddlTipoVRAM.Text, txtPSURecomendadaGPU.Text.Trim(), txtconAlGPU.Text.Trim(), txtNombreProductoGPU.Text.Trim(), txtPrecioGPU.Text, ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                }
            }
        }


        public bool RegistrarGPU(string marca, string modelo, int tdpGPU, int medidasmm, int VRAM, string TipoVRAM, string PSURecomendada, string conAGPU, string nombreProd, string precio, byte[] img)
        {
            try
            {
                string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion"].ConnectionString;
                string query;
                if (img != null)
                {
                    query = "exec insertarGPU @marca, @modelo, @tdpGPU, @medidasmm, @VRAM, @TipoVRAM, @PSURecomendada, @conAGPU, @nombreProd, @precio, @Imagen";
                }
                else
                {
                    query = "exec insertarGPU @marca, @modelo, @tdpGPU, @medidasmm, @VRAM, @TipoVRAM, @PSURecomendada, @conAGPU, @nombreProd, @precio, null";
                }


                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@marca", marca);
                cmd.Parameters.AddWithValue("@modelo", modelo);
                cmd.Parameters.AddWithValue("@tdpGPU", tdpGPU);
                cmd.Parameters.AddWithValue("@medidasmm", medidasmm);
                cmd.Parameters.AddWithValue("@VRAM", VRAM);
                cmd.Parameters.AddWithValue("@TipoVRAM", TipoVRAM);
                cmd.Parameters.AddWithValue("@PSURecomendada", PSURecomendada);
                cmd.Parameters.AddWithValue("@conAGPU", conAGPU);
                cmd.Parameters.AddWithValue("@nombreProd", nombreProd);
                cmd.Parameters.AddWithValue("@precio", precio);
                if (img != null)
                {
                    cmd.Parameters.AddWithValue("@Imagen", img);
                }
                int cont = cmd.ExecuteNonQuery();
                conexion.Close();
                if (cont > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (SqlException e)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Ha habido un error al ingresar la tarjeta de video, comuniquese con el administrador<br>\n" + e + "')", true);
                return false;
            }
        }

        protected void btnIngresarFuentePoder_Click(object sender, EventArgs e)
        {
            byte[] ImagenOriginal = null;
            if (FUFuentePoder.HasFile)
            {
                ImagenOriginal = FUFuentePoder.FileBytes;
                if (!FUFuentePoder.FileName.EndsWith(".svg"))
                {
                    FUFuentePoder.PostedFile.InputStream.Read(ImagenOriginal, 0, FUFuentePoder.PostedFile.ContentLength);
                    Bitmap imagenbinaria = new Bitmap(FUFuentePoder.PostedFile.InputStream);
                    System.Drawing.Image imgThumbnail;
                    int TamThumbnail = 300;
                    imgThumbnail = Redimensionar(imagenbinaria, TamThumbnail);
                    byte[] bImagenThumbnail = new byte[TamThumbnail];

                    ImageConverter Convertidor = new ImageConverter();
                    bImagenThumbnail = (byte[])Convertidor.ConvertTo(imgThumbnail, typeof(byte[]));

                    if (RegistrarFP(txtDescripcionFP.Text.Trim(), txtConAlCPU_FP.Text.Trim(), txtConAlPlaca_FP.Text.Trim(), txtConAlGPU_FP.Text.Trim(), txtPotenciaFP.Text.Trim(), ddlCertificacionFP.SelectedItem.Value, txtNombreProductoFP.Text.Trim(), int.Parse(txtPrecioFP.Text), bImagenThumbnail))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }
                else
                {
                    if (RegistrarFP(txtDescripcionFP.Text.Trim(), txtConAlCPU_FP.Text.Trim(), txtConAlPlaca_FP.Text.Trim(), txtConAlGPU_FP.Text.Trim(), txtPotenciaFP.Text.Trim(), ddlCertificacionFP.SelectedItem.Value, txtNombreProductoFP.Text.Trim(), int.Parse(txtPrecioFP.Text), ImagenOriginal))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }

            }
            else
            {
                if (RegistrarFP(txtDescripcionFP.Text.Trim(), txtConAlCPU_FP.Text.Trim(), txtConAlPlaca_FP.Text.Trim(), txtConAlGPU_FP.Text.Trim(), txtPotenciaFP.Text.Trim(), ddlCertificacionFP.SelectedItem.Value, txtNombreProductoFP.Text.Trim(), int.Parse(txtPrecioFP.Text), ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                }
            }
        }

        public bool RegistrarFP(string Descripcion, string conAlPr, string conAlPl, string conAlGPU, string Potencia, string Certificacion, string NombreProd, int precio, byte[] img)
        {
            try
            {
                string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion"].ConnectionString;
                string query;
                if (img != null)
                {
                    query = "exec InsertarFuentePoder @Descripcion, @conAlPr, @conAlPl, @conAlGPU, @Potencia, @Certificacion, @nombreProd, @precio, @Imagen";
                }
                else
                {
                    query = "exec InsertarFuentePoder @Descripcion, @conAlPr, @conAlPl, @conAlGPU, @Potencia, @Certificacion, @nombreProd, @precio, null";
                }


                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@Descripcion", Descripcion);
                cmd.Parameters.AddWithValue("@conAlPr", conAlPr);
                cmd.Parameters.AddWithValue("@conAlPl", conAlPl);
                cmd.Parameters.AddWithValue("@conAlGPU", conAlGPU);
                cmd.Parameters.AddWithValue("@Potencia", Potencia + " W");
                cmd.Parameters.AddWithValue("@Certificacion", Certificacion);
                cmd.Parameters.AddWithValue("@nombreProd", NombreProd);
                cmd.Parameters.AddWithValue("@precio", precio);
                if (img != null)
                {
                    cmd.Parameters.AddWithValue("@Imagen", img);
                }
                int cont = cmd.ExecuteNonQuery();
                conexion.Close();
                if (cont > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (SqlException e)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Ha habido un error al ingresar la fuente de poder, comuniquese con el administrador<br>\n" + e + "')", true);
                return false;
            }
        }


        public System.Drawing.Image Redimensionar(System.Drawing.Image imagen, int alto)
        {
            double Radio = (double)alto / imagen.Height;
            var NuevoAncho = (int)(imagen.Width * Radio);
            var NuevoAlto = (int)(imagen.Height * Radio);
            Bitmap NuevaImagenRedimensionada = new Bitmap(NuevoAncho, NuevoAlto);
            var g = Graphics.FromImage(NuevaImagenRedimensionada);
            g.DrawImage(imagen, 0, 0, NuevoAncho, NuevoAlto);
            return NuevaImagenRedimensionada;
        }

        protected void btnIngresarRAM_Click(object sender, EventArgs e)
        {
            byte[] ImagenOriginal = null;
            if (FURAM.HasFile)
            {
                ImagenOriginal = FURAM.FileBytes;
                if (!FURAM.FileName.EndsWith(".svg"))
                {
                    FURAM.PostedFile.InputStream.Read(ImagenOriginal, 0, FURAM.PostedFile.ContentLength);
                    Bitmap imagenbinaria = new Bitmap(FURAM.PostedFile.InputStream);
                    System.Drawing.Image imgThumbnail;
                    int TamThumbnail = 400;
                    imgThumbnail = Redimensionar(imagenbinaria, TamThumbnail);
                    byte[] bImagenThumbnail = new byte[TamThumbnail];

                    ImageConverter Convertidor = new ImageConverter();
                    bImagenThumbnail = (byte[])Convertidor.ConvertTo(imgThumbnail, typeof(byte[]));

                    if (RegistrarRAM(ddlTipoRAM.SelectedItem.Value, int.Parse(txtFrecRAM.Text), int.Parse(txtMemoriaRAM.Text), txtNombreProductoRAM.Text.Trim(), int.Parse(txtPrecioRAM.Text), bImagenThumbnail))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }
                else
                {
                    if (RegistrarRAM(ddlTipoRAM.SelectedItem.Value, int.Parse(txtFrecRAM.Text), int.Parse(txtMemoriaRAM.Text), txtNombreProductoRAM.Text.Trim(), int.Parse(txtPrecioRAM.Text), ImagenOriginal))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }

            }
            else
            {
                if (RegistrarRAM(ddlTipoRAM.SelectedItem.Value, int.Parse(txtFrecRAM.Text), int.Parse(txtMemoriaRAM.Text), txtNombreProductoRAM.Text.Trim(), int.Parse(txtPrecioRAM.Text), ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                }
            }
        }

        public bool RegistrarRAM(string TipoRAM, int FrecRAM, int Memoria, string NombreProd, int precio, byte[] img)
        {
            try
            {
                string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion"].ConnectionString;
                string query;
                if (img != null)
                {
                    query = "exec InsertarRAM @TipoRAM,@FrecRAM, @Memoria, @nombreProd, @precio, @Imagen";
                }
                else
                {
                    query = "exec InsertarRAM @TipoRAM,@FrecRAM, @Memoria, @nombreProd, @precio, null";
                }


                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@TipoRAM", TipoRAM);
                cmd.Parameters.AddWithValue("@FrecRAM", FrecRAM);
                cmd.Parameters.AddWithValue("@Memoria", Memoria);
                cmd.Parameters.AddWithValue("@nombreProd", NombreProd);
                cmd.Parameters.AddWithValue("@precio", precio);
                if (img != null)
                {
                    cmd.Parameters.AddWithValue("@Imagen", img);
                }
                int cont = cmd.ExecuteNonQuery();
                conexion.Close();
                if (cont > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (SqlException e)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Ha habido un error al ingresar la RAM, comuniquese con el administrador<br>\n" + e + "')", true);
                return false;
            }
        }

        protected void btnIngresarDisipador_Click(object sender, EventArgs e)
        {
            byte[] ImagenOriginal = null;
            if (FUDisipador.HasFile)
            {
                ImagenOriginal = FUDisipador.FileBytes;
                if (!FUDisipador.FileName.EndsWith(".svg"))
                {
                    FUDisipador.PostedFile.InputStream.Read(ImagenOriginal, 0, FUDisipador.PostedFile.ContentLength);
                    Bitmap imagenbinaria = new Bitmap(FUDisipador.PostedFile.InputStream);
                    System.Drawing.Image imgThumbnail;
                    int TamThumbnail = 400;
                    imgThumbnail = Redimensionar(imagenbinaria, TamThumbnail);
                    byte[] bImagenThumbnail = new byte[TamThumbnail];

                    ImageConverter Convertidor = new ImageConverter();
                    bImagenThumbnail = (byte[])Convertidor.ConvertTo(imgThumbnail, typeof(byte[]));

                    if (RegistrarDisipador(ddlTipoDisipador.SelectedItem.Value, txtSocketDisipador.Text,int.Parse(txtmedidaDisipador.Text), txtNombreProductoDisipador.Text.Trim(), int.Parse(txtPrecioDisipador.Text), bImagenThumbnail))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }
                else
                {
                    if (RegistrarDisipador(ddlTipoDisipador.SelectedItem.Value, txtSocketDisipador.Text, int.Parse(txtmedidaDisipador.Text), txtNombreProductoDisipador.Text.Trim(), int.Parse(txtPrecioDisipador.Text), ImagenOriginal))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }

            }
            else
            {
                if (RegistrarDisipador(ddlTipoDisipador.SelectedItem.Value, txtSocketDisipador.Text, int.Parse(txtmedidaDisipador.Text), txtNombreProductoDisipador.Text.Trim(), int.Parse(txtPrecioDisipador.Text), ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                }
            }
        }

        public bool RegistrarDisipador(string TipoDisipador, string Socket, int Medida, string NombreProd, int precio, byte[] img)
        {
            try
            {
                string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion"].ConnectionString;
                string query;
                if (img != null)
                {
                    query = "exec InsertarDisipador @TipoDisipador, @socket, @Medida_mm, @nombreProd, @precio, @Imagen";
                }
                else
                {
                    query = "exec InsertarDisipador @TipoDisipador, @socket, @Medida_mm, @nombreProd, @precio, null";
                }


                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@TipoDisipador", TipoDisipador);
                cmd.Parameters.AddWithValue("@socket", Socket);
                cmd.Parameters.AddWithValue("@Medida_mm", Medida);
                cmd.Parameters.AddWithValue("@nombreProd", NombreProd);
                cmd.Parameters.AddWithValue("@precio", precio);
                if (img != null)
                {
                    cmd.Parameters.AddWithValue("@Imagen", img);
                }
                int cont = cmd.ExecuteNonQuery();
                conexion.Close();
                if (cont > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (SqlException e)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Ha habido un error al ingresar el disipador, comuniquese con el administrador<br>\n" + e + "')", true);
                return false;
            }
        }

        protected void btnIngresarGabinete_Click(object sender, EventArgs e)
        {
            byte[] ImagenOriginal = null;
            if(!chkE_ATX_Gab.Checked && !chkATX_Gab.Checked && !chkMicro_ATX_Gab.Checked && !chkITX_Gab.Checked)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Seleccione al menos un tipo de placa compatible')", true);
                return;
            }
            if(!chkHDD.Checked && !chkSSD.Checked)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Seleccione al menos un tipo de almacenamiento')", true);
                return;
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
            if (FUGabinete.HasFile)
            {
                ImagenOriginal = FUGabinete.FileBytes;
                if (!FUGabinete.FileName.EndsWith(".svg"))
                {
                    FUGabinete.PostedFile.InputStream.Read(ImagenOriginal, 0, FUGabinete.PostedFile.ContentLength);
                    Bitmap imagenbinaria = new Bitmap(FUGabinete.PostedFile.InputStream);
                    System.Drawing.Image imgThumbnail;
                    int TamThumbnail = 300;
                    imgThumbnail = Redimensionar(imagenbinaria, TamThumbnail);
                    byte[] bImagenThumbnail = new byte[TamThumbnail];

                    ImageConverter Convertidor = new ImageConverter();
                    bImagenThumbnail = (byte[])Convertidor.ConvertTo(imgThumbnail, typeof(byte[]));

                    if (RegistrarGabinete (chkE_ATX_Gab.Checked,chkATX_Gab.Checked,chkMicro_ATX_Gab.Checked,chkITX_Gab.Checked,int.Parse(txtMedidaMaxGPU.Text),int.Parse(txtMedidaMaxDisipador.Text),chkHDD.Checked,int.Parse(txtCantidadHDD.Text),chkSSD.Checked,int.Parse(txtCantidadSSD.Text),txtColorGabinete.Text,txtIluminacionGabinete.Text,chkventPreins.Checked,txtCaracteristicasVentiladorPreinstalado.Text,txtNombreProductoGabinete.Text.Trim(), int.Parse(txtPrecioGabinete.Text), bImagenThumbnail))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }
                else
                {
                    if (RegistrarGabinete(chkE_ATX_Gab.Checked, chkATX_Gab.Checked, chkMicro_ATX_Gab.Checked, chkITX_Gab.Checked, int.Parse(txtMedidaMaxGPU.Text), int.Parse(txtMedidaMaxDisipador.Text), chkHDD.Checked, int.Parse(txtCantidadHDD.Text), chkSSD.Checked, int.Parse(txtCantidadSSD.Text), txtColorGabinete.Text, txtIluminacionGabinete.Text, chkventPreins.Checked, txtCaracteristicasVentiladorPreinstalado.Text, txtNombreProductoGabinete.Text.Trim(), int.Parse(txtPrecioGabinete.Text), ImagenOriginal))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }

            }
            else
            {
                if (RegistrarGabinete(chkE_ATX_Gab.Checked, chkATX_Gab.Checked, chkMicro_ATX_Gab.Checked, chkITX_Gab.Checked, int.Parse(txtMedidaMaxGPU.Text), int.Parse(txtMedidaMaxDisipador.Text), chkHDD.Checked, int.Parse(txtCantidadHDD.Text), chkSSD.Checked, int.Parse(txtCantidadSSD.Text), txtColorGabinete.Text, txtIluminacionGabinete.Text, chkventPreins.Checked, txtCaracteristicasVentiladorPreinstalado.Text, txtNombreProductoGabinete.Text.Trim(), int.Parse(txtPrecioGabinete.Text), ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                }
            }
        }

        public bool RegistrarGabinete(bool E_ATX, bool ATX, bool Micro_ATX, bool ITX, int medidaMaxGPU, int medidaMaxDisipador, bool HDD, int cantidad_HDD, bool SSD, int cantidad_SSD, string color, string iluminacion, bool ventiladorPreinstal, string caracVentilador, string NombreProd, int precio, byte[] img)
        {
            try
            {
                string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion"].ConnectionString;
                string query;
                if (img != null)
                {
                    if (HDD && SSD && ventiladorPreinstal)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, @cantidad_HDD, @SSD, @cantidad_SSD, @color, @iluminacion, @ventiladorPreinstal, @caracVentilador, @nombreProd, @precio, @Imagen";
                    }
                    else if (HDD && SSD)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, @cantidad_HDD, @SSD, @cantidad_SSD, @color, @iluminacion, @ventiladorPreinstal, null, @nombreProd, @precio, @Imagen";
                    }
                    else if (HDD && ventiladorPreinstal)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, @cantidad_HDD, @SSD, null, @color, @iluminacion, @ventiladorPreinstal, @caracVentilador, @nombreProd, @precio, @Imagen";
                    }
                    else if (SSD && ventiladorPreinstal)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, null, @SSD, @cantidad_SSD, @color, @iluminacion, @ventiladorPreinstal, @caracVentilador, @nombreProd, @precio, @Imagen";
                    }
                    else if (HDD)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, @cantidad_HDD, @SSD, null, @color, @iluminacion, @ventiladorPreinstal, null, @nombreProd, @precio, @Imagen";
                    }
                    else if (SSD)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, null, @SSD, @cantidad_SSD, @color, @iluminacion, @ventiladorPreinstal, null, @nombreProd, @precio, @Imagen";
                    }
                    else if (ventiladorPreinstal)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, null, @SSD, null, @color, @iluminacion, @ventiladorPreinstal, @caracVentilador, @nombreProd, @precio, @Imagen";
                    }
                    else
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, null, @SSD, null, @color, @iluminacion, @ventiladorPreinstal, null, @nombreProd, @precio, @Imagen";
                    }
                }
                else
                {
                    if (HDD && SSD && ventiladorPreinstal)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, @cantidad_HDD, @SSD, @cantidad_SSD, @color, @iluminacion, @ventiladorPreinstal, @caracVentilador, @nombreProd, @precio, null";
                    }
                    else if (HDD && SSD)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, @cantidad_HDD, @SSD, @cantidad_SSD, @color, @iluminacion, @ventiladorPreinstal, null, @nombreProd, @precio, null";
                    }
                    else if (HDD && ventiladorPreinstal)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, @cantidad_HDD, @SSD, null, @color, @iluminacion, @ventiladorPreinstal, @caracVentilador, @nombreProd, @precio, null";
                    }
                    else if (SSD && ventiladorPreinstal)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, null, @SSD, @cantidad_SSD, @color, @iluminacion, @ventiladorPreinstal, @caracVentilador, @nombreProd, @precio, null";
                    }
                    else if (HDD)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, @cantidad_HDD, @SSD, null, @color, @iluminacion, @ventiladorPreinstal, null, @nombreProd, @precio, null";
                    }
                    else if (SSD)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, null, @SSD, @cantidad_SSD, @color, @iluminacion, @ventiladorPreinstal, null, @nombreProd, @precio, null";
                    }
                    else if (ventiladorPreinstal)
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, null, @SSD, null, @color, @iluminacion, @ventiladorPreinstal, @caracVentilador, @nombreProd, @precio, null";
                    }
                    else
                    {
                        query = "exec InsertarGabinete @E_ATX, @ATX, @Micro_ATX, @ITX, @medidaMaxGPU, @medidaMaxDisipador, @HDD, null, @SSD, null, @color, @iluminacion, @ventiladorPreinstal, null, @nombreProd, @precio, null";
                    }
                }


                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@E_ATX", E_ATX);
                cmd.Parameters.AddWithValue("@ATX", ATX);
                cmd.Parameters.AddWithValue("@Micro_ATX", Micro_ATX);
                cmd.Parameters.AddWithValue("@ITX", ITX);
                cmd.Parameters.AddWithValue("@medidaMaxGPU", medidaMaxGPU);
                cmd.Parameters.AddWithValue("@medidaMaxDisipador", medidaMaxDisipador);
                cmd.Parameters.AddWithValue("@HDD", HDD);
                cmd.Parameters.AddWithValue("@SSD", SSD);
                cmd.Parameters.AddWithValue("@color", color);
                cmd.Parameters.AddWithValue("@iluminacion", iluminacion);
                cmd.Parameters.AddWithValue("@ventiladorPreinstal", ventiladorPreinstal);
                if (HDD)
                {
                    cmd.Parameters.AddWithValue("@cantidad_HDD", cantidad_HDD);
                }
                if (SSD)
                {
                    cmd.Parameters.AddWithValue("cantidad_SSD", cantidad_SSD);
                }
                if (ventiladorPreinstal)
                {
                    cmd.Parameters.AddWithValue("@caracVentilador", caracVentilador);
                }
                cmd.Parameters.AddWithValue("@nombreProd", NombreProd);
                cmd.Parameters.AddWithValue("@precio", precio);
                if (img != null)
                {
                    cmd.Parameters.AddWithValue("@Imagen", img);
                }
                int cont = cmd.ExecuteNonQuery();
                conexion.Close();
                if (cont > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (SqlException e)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Ha habido un error al ingresar el gabinete, comuniquese con el administrador<br>\n" + e + "')", true);
                return false;
            }
        }

        protected void btnIngresarDisco_Click(object sender, EventArgs e)
        {
            byte[] ImagenOriginal = null;
            if (FUDisco.HasFile)
            {
                ImagenOriginal = FUDisco.FileBytes;
                if (!FUDisco.FileName.EndsWith(".svg"))
                {
                    FUDisco.PostedFile.InputStream.Read(ImagenOriginal, 0, FUDisco.PostedFile.ContentLength);
                    Bitmap imagenbinaria = new Bitmap(FUDisco.PostedFile.InputStream);
                    System.Drawing.Image imgThumbnail;
                    int TamThumbnail = 300;
                    imgThumbnail = Redimensionar(imagenbinaria, TamThumbnail);
                    byte[] bImagenThumbnail = new byte[TamThumbnail];

                    ImageConverter Convertidor = new ImageConverter();
                    bImagenThumbnail = (byte[])Convertidor.ConvertTo(imgThumbnail, typeof(byte[]));

                    if (RegistrarDisco(ddlTipoDisco.SelectedItem.Value, int.Parse(txtMemoriaDisco.Text), txtNombreProductoDisco.Text.Trim(), int.Parse(txtPrecioDisco.Text), bImagenThumbnail))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }
                else
                {
                    if (RegistrarDisco(ddlTipoDisco.SelectedItem.Value, int.Parse(txtMemoriaDisco.Text), txtNombreProductoDisco.Text.Trim(), int.Parse(txtPrecioDisco.Text), ImagenOriginal))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado! (Con imagen incluida)')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                    }
                }

            }
            else
            {
                if (RegistrarDisco(ddlTipoDisco.SelectedItem.Value, int.Parse(txtMemoriaDisco.Text), txtNombreProductoDisco.Text.Trim(), int.Parse(txtPrecioDisco.Text), ImagenOriginal))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto Registrado!')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto')", true);
                }
            }
        }

        public bool RegistrarDisco(string TipoDisco, int Memoria, string NombreProd, int precio, byte[] img)
        {
            double medida = 0;
            try
            {
                if (TipoDisco.Equals("HDD"))
                {
                    medida = 3.5;
                }
                else if (TipoDisco.Equals("SSD"))
                {
                    medida = 2.5;
                }
                string con = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion"].ConnectionString;
                string query;
                if (img != null)
                {
                    query = "exec InsertarDisco @TipoDisco, @Memoria, @Medida, @nombreProd, @precio, @Imagen";
                }
                else
                {
                    query = "exec InsertarDisco @TipoDisco, @Memoria, @Medida, @nombreProd, @precio, null";
                }


                SqlConnection conexion = new SqlConnection(con);
                conexion.Open();
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@TipoDisco", TipoDisco);
                cmd.Parameters.AddWithValue("@Memoria", Memoria);
                cmd.Parameters.AddWithValue("@Medida", medida);
                cmd.Parameters.AddWithValue("@nombreProd", NombreProd);
                cmd.Parameters.AddWithValue("@precio", precio);
                if (img != null)
                {
                    cmd.Parameters.AddWithValue("@Imagen", img);
                }
                int cont = cmd.ExecuteNonQuery();
                conexion.Close();
                if (cont > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (SqlException e)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Ha habido un error al ingresar el disco duro, comuniquese con el administrador<br>\n" + e + "')", true);
                return false;
            }
        }

        protected void ddlProcesadorE_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddlPlacaE.DataBind();
            ddlPlacaE.Items.Insert(0, new ListItem("---Seleccione---", ""));
            ddlRAME.ClearSelection();
            ddlRAME.Items.Clear();
            ddlRAME.DataBind();
            ddlRAME.Items.Insert(0, new ListItem("---Seleccione---", ""));
            ddlDisipadorE.ClearSelection();
            ddlDisipadorE.Items.Clear();
            ddlDisipadorE.DataBind();
            ddlDisipadorE.Items.Insert(0, new ListItem("---Seleccione---", ""));
            ddlPSUE.Items.Clear();
            ddlPSUE.DataBind();
            ddlPSUE.Items.Insert(0, new ListItem("---Seleccione---", ""));
            ddlGabineteE.Items.Clear();
            ddlGabineteE.Items.Insert(0, new ListItem("---Seleccione---", ""));
        }

        protected void ddlPlacaE_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRAME.ClearSelection();
            ddlRAME.DataBind();
            ddlRAME.Items.Insert(0, new ListItem("---Seleccione---", ""));
            ddlPSUE.Items.Clear();
            ddlPSUE.DataBind();
            ddlPSUE.Items.Insert(0, new ListItem("---Seleccione---", ""));
            ddlGabineteE.Items.Clear();
            ddlGabineteE.DataBind();
            ddlGabineteE.Items.Insert(0, new ListItem("---Seleccione---", ""));
        }

        protected void ddlDisipadorE_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlGabineteE.Items.Clear();
            ddlGabineteE.DataBind();
            ddlGabineteE.Items.Insert(0, new ListItem("---Seleccione---", ""));
        }

        protected void ddlDiscoDuroE_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlGabineteE.Items.Clear();
            ddlGabineteE.DataBind();
            ddlGabineteE.Items.Insert(0, new ListItem("---Seleccione---", ""));
        }

        protected void ddlGPUE_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlPSUE.Items.Clear();
            ddlPSUE.DataBind();
            ddlPSUE.Items.Insert(0, new ListItem("---Seleccione---", ""));
            ddlGabineteE.Items.Clear();
            ddlGabineteE.DataBind();
            ddlGabineteE.Items.Insert(0, new ListItem("---Seleccione---", ""));
        }

        protected void btnIngresarE_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.Insert();

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Equipo ingresado correctamente')", true);
            }
            catch(SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Error al ingresar el producto'<br>"+ex+"');", true);
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ventanaLogin.Visible = false;
            txtUser.Enabled = false;
            txtPass.Enabled = false;
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader datos;
            datos = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                this.Session["user"] = txtUser.Text;
                this.Session["pass"] = txtPass.Text;
                ventanaLogin.Visible = false;
                txtUser.Enabled = false;
                txtPass.Enabled = false;
                DropDownList1.Enabled = true;
                HPLAdd.Enabled = true;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Combinacion de usuario/contraseña incorrectos')", true);
            }
        }


        protected void Button1_ServerClick(object sender, EventArgs e)
        {
            //Borra los datos de la sesión y recarga la página
            this.Session.Clear();
            Response.Redirect("Inserciones_Solo_Administradores.aspx");
        }
    }
    
}