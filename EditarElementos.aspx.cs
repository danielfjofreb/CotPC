using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CotPc
{
    public partial class EditarElementos : System.Web.UI.Page
    {
        int idProcesador = 0;
        string s = System.Configuration.ConfigurationManager.ConnectionStrings["cadenaconexion"].ConnectionString;
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
                    txtBuscar.Enabled = true;
                    GridView1.Visible = true;
                    btnBuscar.Enabled = true;
                }
            }
        }

        protected void Button1_ServerClick(object sender, EventArgs e)
        {
            //Borra los datos de la sesión y recarga la página
            this.Session.Clear();
            Response.Redirect("EditarElementos.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ventanaLogin.Visible = false;
            txtUser.Enabled = false;
            txtPass.Enabled = false;


        }
        

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            SqlDataSource1.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader datos;
            datos = (SqlDataReader)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                this.Session["user"] = txtUser.Text;
                this.Session["pass"] = txtPass.Text;
                ventanaLogin.Visible = false;
                txtUser.Enabled = false;
                txtPass.Enabled = false;
                HPLAdd.Enabled = true;
                txtBuscar.Enabled = true;
                GridView1.Visible = true;
                btnBuscar.Enabled = true;

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alert", "alert('Combinacion de usuario/contraseña incorrectos')", true);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtBuscar.Text = GridView1.SelectedRow.Cells[1].Text;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
        }

        public void refrescar()
        {
            //GridView de todos los productos
            SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader datos;
            datos = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                GridView1.DataSourceID = SqlDataSource2.ID;
                GridView1.DataBind();
            }
            //Procesador
            SqlDSProcesador.DataSourceMode = SqlDataSourceMode.DataReader;
            datos = (SqlDataReader)SqlDSProcesador.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                GVProcesador.DataSourceID = SqlDSProcesador.ID;
                GVProcesador.DataBind();
            }
            //Placa
            SqlDSPlaca.DataSourceMode = SqlDataSourceMode.DataReader;
            datos = (SqlDataReader)SqlDSPlaca.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                GVPlaca.DataSourceID = SqlDSPlaca.ID;
                GVPlaca.DataBind();
            }
            //RAM
            SqlDSRAM.DataSourceMode = SqlDataSourceMode.DataReader;
            datos = (SqlDataReader)SqlDSRAM.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                GVRAM.DataSourceID = SqlDSPlaca.ID;
                GVRAM.DataBind();
            }
            //Tarjeta de video
            SqlDSTarjetaVideo.DataSourceMode = SqlDataSourceMode.DataReader;
            datos = (SqlDataReader)SqlDSTarjetaVideo.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                GVTarjetaVideo.DataSourceID = SqlDSTarjetaVideo.ID;
                GVTarjetaVideo.DataBind();
            }
            //Equipo
            SqlDSEquipo.DataSourceMode = SqlDataSourceMode.DataReader;
            datos = (SqlDataReader)SqlDSEquipo.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                GVEquipos.DataSourceID = SqlDSEquipo.ID;
                GVEquipos.DataBind();
            }
            // Disco duro
            SqlDSDisco.DataSourceMode = SqlDataSourceMode.DataReader;
            datos = (SqlDataReader)SqlDSDisco.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                GVDisco.DataSourceID = SqlDSDisco.ID;
                GVDisco.DataBind();
            }
            //Disipador
            SqlDSDisipador.DataSourceMode = SqlDataSourceMode.DataReader;
            datos = (SqlDataReader)SqlDSDisipador.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                GVDisipador.DataSourceID = SqlDSDisipador.ID;
                GVDisipador.DataBind();
            }
            //Fuente de Poder
            SqlDSFuentePoder.DataSourceMode = SqlDataSourceMode.DataReader;
            datos = (SqlDataReader)SqlDSFuentePoder.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                GVFuentePoder.DataSourceID = SqlDSFuentePoder.ID;
                GVFuentePoder.DataBind();
            }
            //Gabinete
            SqlDSGabinete.DataSourceMode = SqlDataSourceMode.DataReader;
            datos = (SqlDataReader)SqlDSGabinete.Select(DataSourceSelectArguments.Empty);
            if (datos.Read())
            {
                GVGabinete.DataSourceID = SqlDSGabinete.ID;
                GVGabinete.DataBind();
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


        protected void btnEliminarCPU_Click(object sender, EventArgs e)
        {
            string ID = GVProcesador.Rows[0].Cells[1].Text;
            string query;
            SqlConnection conexion;
            SqlCommand cmd;
            //Esto tambien se puede simplificar en el procedimiento almacenado, asi se hace con los otros componentes
            if (VerificarCPUEquipo(ID))
            {

                query = "update Equipos set Procesador = null where Procesador = @Procesador";
                conexion = new SqlConnection(s);
                conexion.Open();
                cmd = new SqlCommand(query, conexion);
                cmd.Parameters.Add("@Procesador", SqlDbType.Int);

                cmd.Parameters["@Procesador"].Value = idProcesador;

                cmd.ExecuteNonQuery();
                conexion.Close();
            }
            try
            {
                query = "Eliminar_Procesador";
                conexion = new SqlConnection(s);
                conexion.Open();
                cmd = new SqlCommand(query, conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IDProd", SqlDbType.BigInt);

                cmd.Parameters["@IDProd"].Value = int.Parse(ID);

                int cont = cmd.ExecuteNonQuery();
                conexion.Close();
                if (cont > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto eliminado')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Hubo un error al eliminar el producto, posiblemente ya ha sido borrado antes')", true);
                }
                refrescar();

            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Se produjo un error al eliminar el producto" + ex + "')", true);
            }
        }


        public bool VerificarCPUEquipo(string ID)
        {
            bool v = false;
            string query = "SELECT cpu.id_Procesador FROM Procesador cpu, Equipos e WHERE cpu.idProd = @ID and cpu.id_Procesador = e.Procesador";
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand cmd = new SqlCommand(query, conexion);
            cmd.Parameters.Add("@ID", SqlDbType.BigInt);

            cmd.Parameters["@ID"].Value = int.Parse(ID);

            if (int.TryParse((string)cmd.ExecuteScalar(),out idProcesador))
            {
                v = true;
            }
            conexion.Close();
            return v;
        }

        protected void btnEliminarPlaca_Click(object sender, EventArgs e)
        {
            string id = GVPlaca.Rows[0].Cells[1].Text;
            try
            {
                SqlDSPlaca.DeleteParameters["IDProd"].DefaultValue = id;
                int i = SqlDSPlaca.Delete();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto eliminado')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Hubo un error al eliminar el producto, posiblemente ya ha sido borrado antes')", true);
                }
                refrescar();
            }
            catch(SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Se produjo un error al eliminar el producto\n" + ex + "')", true);
            }
        }

        protected void btnEliminarGPU_Click(object sender, EventArgs e)
        {
            try
            {
                string id = GVTarjetaVideo.Rows[0].Cells[1].Text;
                SqlDSTarjetaVideo.DeleteParameters["IDProd"].DefaultValue = id;
                int i = SqlDSTarjetaVideo.Delete();
                if (i > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alert", "alert('Producto eliminado')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alert", "alert('Hubo un error al eliminar el producto, posiblemente ya ha sido borrado antes')", true);
                }
                refrescar();
            }
            catch (SqlException ex)
            {

                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alert", "alert('Se produjo un error al eliminar el producto: \n" + ex + "')", true);
            }
            
        }

        protected void btnEliminarFuentePoder_Click(object sender, EventArgs e)
        {
            try
            {
                string id = GVFuentePoder.Rows[0].Cells[1].Text;
                SqlDSFuentePoder.DeleteParameters["IDProd"].DefaultValue = id;
                int i = SqlDSFuentePoder.Delete();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto eliminado')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Hubo un error al eliminar el producto, posiblemente ya ha sido borrado antes')", true);
                }
                refrescar();
            }
            catch (SqlException ex)
            {

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Se produjo un error al eliminar el producto: \n" + ex + "')", true);
            }

    }

        protected void btnEliminarRAM_Click(object sender, EventArgs e)
        {
            try
            {
                string id = GVRAM.Rows[0].Cells[1].Text;
                SqlDSRAM.DeleteParameters["IDProd"].DefaultValue = id;
                int i = SqlDSRAM.Delete();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto eliminado')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Hubo un error al eliminar el producto, posiblemente ya ha sido borrado antes')", true);
                }
                refrescar();
            }
            catch (SqlException ex)
            {

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Se produjo un error al eliminar el producto: \n" + ex + "')", true);
            }
        }

        protected void btnEliminarDisipador_Click(object sender, EventArgs e)
        {
            try
            {
                string id = GVDisipador.Rows[0].Cells[1].Text;
                SqlDSDisipador.DeleteParameters["IDProd"].DefaultValue = id;
                int i = SqlDSDisipador.Delete();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto eliminado')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Hubo un error al eliminar el producto, posiblemente ya ha sido borrado antes')", true);
                }
                refrescar();
            }
            catch (SqlException ex)
            {

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Se produjo un error al eliminar el producto: \n" + ex + "')", true);
            }
        }

        protected void btnEliminarGabinete_Click(object sender, EventArgs e)
        {
            try
            {
                string id = GVGabinete.Rows[0].Cells[1].Text;
                SqlDSGabinete.DeleteParameters["IDProd"].DefaultValue = id;
                int i = SqlDSGabinete.Delete();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto eliminado')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Hubo un error al eliminar el producto, posiblemente ya ha sido borrado antes')", true);
                }
                refrescar();
            }
            catch (SqlException ex)
            {

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Se produjo un error al eliminar el producto: \n" + ex + "')", true);
            }
        }

        protected void btnEliminarDisco_Click(object sender, EventArgs e)
        {
            try
            {
                string id = GVDisco.Rows[0].Cells[1].Text;
                SqlDSDisco.DeleteParameters["IDProd"].DefaultValue = id;
                int i = SqlDSDisco.Delete();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto eliminado')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Hubo un error al eliminar el producto, posiblemente ya ha sido borrado antes')", true);
                }
                refrescar();
            }
            catch (SqlException ex)
            {

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Se produjo un error al eliminar el producto: \n" + ex + "')", true);
            }
        }

        

        protected void GVEquipos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            
        }

        protected void btnEditarE_Click(object sender, EventArgs e)
        {
            try
            {
                lblIDEquipo.Text = (GVEquipos.Rows[0].FindControl("lblIDProductoGV") as Label).Text;
                txtNombreProductoE.Text = (GVEquipos.Rows[0].FindControl("lblNombreProd") as Label).Text;
                ddlProcesadorE.DataBind();
                ddlProcesadorE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                ddlProcesadorE.SelectedValue = (GVEquipos.Rows[0].FindControl("lblProcesadorE") as Label).Text;
                ddlPlacaE.DataBind();
                ddlPlacaE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                if (!ddlProcesadorE.SelectedValue.Equals(""))
                {
                    ddlPlacaE.SelectedValue = (GVEquipos.Rows[0].FindControl("lblPlacaGV") as Label).Text;
                }
                ddlRAME.DataBind();
                ddlRAME.Items.Insert(0, new ListItem("---Seleccione---", ""));
                if (!ddlPlacaE.SelectedValue.Equals(""))
                {
                    ddlRAME.SelectedValue = (GVEquipos.Rows[0].FindControl("lblRAMGV") as Label).Text;
                }
                ddlDisipadorE.DataBind();
                ddlDisipadorE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                if (!ddlProcesadorE.SelectedValue.Equals(""))
                {
                    ddlDisipadorE.SelectedValue = (GVEquipos.Rows[0].FindControl("lblDisipadorGV") as Label).Text;
                }
                ddlGPUE.DataBind();
                ddlGPUE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                ddlGPUE.SelectedValue = (GVEquipos.Rows[0].FindControl("lblGPUGV") as Label).Text;
                ddlPSUE.DataBind();
                ddlPSUE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                if (!ddlProcesadorE.SelectedValue.Equals("") && !ddlGPUE.SelectedValue.Equals(""))
                {
                    ddlPSUE.SelectedValue = (GVEquipos.Rows[0].FindControl("lblPSUGV") as Label).Text;
                }
                ddlDiscoDuroE.DataBind();
                ddlDiscoDuroE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                ddlDiscoDuroE.SelectedValue = (GVEquipos.Rows[0].FindControl("lblDiscoGV") as Label).Text;
                ddlGabineteE.DataBind();
                ddlGabineteE.Items.Insert(0, new ListItem("---Seleccione---", ""));
                if (!ddlGPUE.SelectedValue.Equals("") && !ddlDisipadorE.SelectedValue.Equals("") && !ddlPlacaE.SelectedValue.Equals(""))
                {
                    ddlGabineteE.SelectedValue = (GVEquipos.Rows[0].FindControl("lblGabineteGV") as Label).Text;
                }
                ddlCategoriaE.SelectedValue = (GVEquipos.Rows[0].FindControl("lblCategoriaGV") as Label).Text;
                txtCaracteristicasAdicionalesE.Text = (GVEquipos.Rows[0].FindControl("lblCaracteristicasGV") as Label).Text;
                txtPrecioE.Text = (GVEquipos.Rows[0].FindControl("lblPrecioGV") as Label).Text;
                pnlActualizarEquipo.Visible = true;
            }
            catch(ArgumentOutOfRangeException a)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alert", "alert('Error al cargar el panel de actualización, puede que las listas desplegables tengan incoherencia de datos, comuniquese con el administrador de base de datos y presentele este problema: "+a+"')", true);
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

        protected void btnCerrarActualizar_ServerClick(object sender, EventArgs e)
        {
            pnlActualizarEquipo.Visible = false;
        }


        public string ActualizarEquipo(int idProd, string NombreProd, int Precio, byte[] Imagen, int Procesador, int Placa, int ram, int Disipador, int GPU, int PSU, int Disco, int Gabinete, string Categoria, string Caracteristicas)
        {
            string resultado = "No se pudo actualizar el equipo";
            string query;
            try
            {
                if (Imagen != null)
                {
                    query = "UPDATE Producto SET Nombre_Producto = @Nombre_Prod, PrecioCLP = @Precio, Imagen = @Imagen WHERE ID_Producto = @idProd\n" +
                    "UPDATE Equipos SET Procesador = @Procesador, Placa = @Placa, RAM = @RAM, Disipador = @Disipador, Tarjeta_de_Video = @TarjetaVideo, " +
                    "Fuente_de_Poder = @Fuente_de_Poder, DiscoDuro = @DiscoDuro, Gabinete = @Gabinete, Categoria = @Categoria," +
                    " CaracteristicasExtra = @CaracteristicasExtra FROM Equipos INNER JOIN Producto ON Equipos.idProd = Producto.ID_Producto" +
                    " WHERE(Producto.ID_Producto = @idProd)";
                }
                else
                {
                    query = "UPDATE Producto SET Nombre_Producto = @Nombre_Prod, PrecioCLP = @Precio, Imagen = null WHERE ID_Producto = @idProd\n" +
                    "UPDATE Equipos SET Procesador = @Procesador, Placa = @Placa, RAM = @RAM, Disipador = @Disipador, Tarjeta_de_Video = @TarjetaVideo, " +
                    "Fuente_de_Poder = @Fuente_de_Poder, DiscoDuro = @DiscoDuro, Gabinete = @Gabinete, Categoria = @Categoria," +
                    " CaracteristicasExtra = @CaracteristicasExtra FROM Equipos INNER JOIN Producto ON Equipos.idProd = Producto.ID_Producto" +
                    " WHERE(Producto.ID_Producto = @idProd)";
                }
                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.Add("@idProd", SqlDbType.BigInt);
                cmd.Parameters.AddWithValue("@Nombre_Prod", NombreProd);
                cmd.Parameters.AddWithValue("@Precio", Precio);
                if (Imagen != null)
                {
                    cmd.Parameters.AddWithValue("@Imagen", Imagen);
                }
                cmd.Parameters.AddWithValue("@Procesador", Procesador);
                cmd.Parameters.AddWithValue("@Placa", Placa);
                cmd.Parameters.AddWithValue("@RAM", ram);
                cmd.Parameters.AddWithValue("@Disipador", Disipador);
                cmd.Parameters.AddWithValue("@TarjetaVideo", GPU);
                cmd.Parameters.AddWithValue("@Fuente_de_poder", PSU);
                cmd.Parameters.AddWithValue("@DiscoDuro", Disco);
                cmd.Parameters.AddWithValue("@Gabinete", Gabinete);
                cmd.Parameters.AddWithValue("@Categoria", Categoria);
                cmd.Parameters.AddWithValue("@CaracteristicasExtra", Caracteristicas);



                cmd.Parameters["@idProd"].Value = (idProd);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    resultado = "Equipo actualizado!";
                }
                conexion.Close();
                return resultado;
            }
            catch (SqlException e)
            {
                resultado = resultado + "\n" + e;
                return resultado;
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string basesentaycuatro = (GVEquipos.Rows[0].FindControl("imgEquipo") as System.Web.UI.WebControls.Image).ImageUrl;
            byte[] ImagenOriginal = null;
            
            string Resultado;
            if (FUEquipoAct.HasFile)
            {
                ImagenOriginal = FUEquipoAct.FileBytes;
                if (!FUEquipoAct.FileName.EndsWith(".svg"))
                {
                    FUEquipoAct.PostedFile.InputStream.Read(ImagenOriginal, 0, FUEquipoAct.PostedFile.ContentLength);
                    Bitmap imagenbinaria = new Bitmap(FUEquipoAct.PostedFile.InputStream);
                    System.Drawing.Image imgThumbnail;
                    int TamThumbnail = 400;
                    imgThumbnail = Redimensionar(imagenbinaria, TamThumbnail);
                    byte[] bImagenThumbnail = new byte[TamThumbnail];

                    ImageConverter Convertidor = new ImageConverter();
                    bImagenThumbnail = (byte[])Convertidor.ConvertTo(imgThumbnail, typeof(byte[]));
                    Resultado = ActualizarEquipo(int.Parse(lblIDEquipo.Text), txtNombreProductoE.Text, int.Parse(txtPrecioE.Text), bImagenThumbnail, int.Parse(ddlProcesadorE.SelectedValue), int.Parse(ddlPlacaE.SelectedValue), int.Parse(ddlRAME.SelectedValue), int.Parse(ddlDisipadorE.SelectedValue), int.Parse(ddlGPUE.SelectedValue), int.Parse(ddlPSUE.SelectedValue), int.Parse(ddlDiscoDuroE.SelectedValue), int.Parse(ddlGabineteE.SelectedValue), ddlCategoriaE.SelectedValue, txtCaracteristicasAdicionalesE.Text);
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alert", "alert('" +Resultado+ " y se cargó imagen')", true);
                    refrescar();
                }
                else
                {
                    Resultado = ActualizarEquipo(int.Parse(lblIDEquipo.Text), txtNombreProductoE.Text, int.Parse(txtPrecioE.Text), ImagenOriginal, int.Parse(ddlProcesadorE.SelectedValue), int.Parse(ddlPlacaE.SelectedValue), int.Parse(ddlRAME.SelectedValue), int.Parse(ddlDisipadorE.SelectedValue), int.Parse(ddlGPUE.SelectedValue), int.Parse(ddlPSUE.SelectedValue), int.Parse(ddlDiscoDuroE.SelectedValue), int.Parse(ddlGabineteE.SelectedValue), ddlCategoriaE.SelectedValue, txtCaracteristicasAdicionalesE.Text);
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alert", "alert('" + Resultado + " svg')", true);
                    refrescar();
                }
            }
            else
            {
                if (!basesentaycuatro.Equals("Images/Nulo1.jpg") || !basesentaycuatro.Equals(""))
                {

                    ImagenOriginal = System.Convert.FromBase64String(basesentaycuatro.Replace("data:image/jpg;base64,", ""));

                }
                Resultado = ActualizarEquipo(int.Parse(lblIDEquipo.Text), txtNombreProductoE.Text, int.Parse(txtPrecioE.Text), ImagenOriginal, int.Parse(ddlProcesadorE.SelectedValue), int.Parse(ddlPlacaE.SelectedValue), int.Parse(ddlRAME.SelectedValue), int.Parse(ddlDisipadorE.SelectedValue), int.Parse(ddlGPUE.SelectedValue), int.Parse(ddlPSUE.SelectedValue), int.Parse(ddlDiscoDuroE.SelectedValue), int.Parse(ddlGabineteE.SelectedValue), ddlCategoriaE.SelectedValue, txtCaracteristicasAdicionalesE.Text);
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alert", "alert('" + Resultado + "')", true);
                refrescar();
            }
            
        }

        protected void btnEliminarE_Click(object sender, EventArgs e)
        {
            //try
            //{
                string id = GVEquipos.Rows[0].Cells[1].Text;
                SqlDSEquipo.DeleteParameters["IDProd"].DefaultValue = id;
                int i = SqlDSEquipo.Delete();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Producto eliminado')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Hubo un error al eliminar el producto, posiblemente ya ha sido borrado antes')", true);
                }
                refrescar();
            /*}
            catch (SqlException ex)
            {

                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Se produjo un error al eliminar el producto: \n" + ex + "')", true);
            }*/
        }
    }
}