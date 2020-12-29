<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarElementos.aspx.cs" Inherits="CotPc.EditarElementos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
     <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
     <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="stylesheet" href="css/tooplate-style.css"/>
    <style type="text/css">
        .auto-style1 {
            margin-left: 1287px;
            color:#dbdbdb;

        }
        .divProc{
            margin-left:10px;
            max-width:900px;
        }
        .auto-style7 {
            margin-left: 573px;
            background-image:url(/Iconos/cerrarSesion.png);
            height: 32px;
            width:32px;
            background-size:contain;
        }

        .auto-style9 {
            border-style: none;
            border-color: none;
            background-image: url(/Iconos/cerrar.png);
            background-size:contain;
            background-color:transparent;
            width: 34px;
            height:34px;
        }
        #bckUPP
    {
        position: fixed; 
        top: 0px; 
        bottom: 0px; 
        left: 0px; 
        right: 0px; 
        overflow: hidden; 
        padding: 0; 
        margin: 0; 
        background-color: #F0F0F0; 
        filter: alpha(opacity=80); 
        opacity: 0.8; 
        z-index: 100000;
        
        
    }
        
    #Progress
    {
        position: fixed;
        top: 25%; 
        left: 40%; 
        height:400px; 
        width:400px; 
        z-index: 100001;  
        background-color: #FFFFFF; 
        border:1px solid Gray; 
        background-image: url('images/loading.gif'); 
        background-repeat: no-repeat; 
        background-position:center;
        background-size:cover;
    }

        </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- MENU -->
     <section class="navbar custom-navbar navbar-fixed-top" role="navigation">
          <div class="container">
               <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                         <span class="icon icon-bar"></span>
                         <span class="icon icon-bar"></span>
                         <span class="icon icon-bar"></span>
                    </button>

                    <!-- lOGO TEXT HERE -->
                    <h3 style="color:azure">Editar Elementos</h3>
                </div>

               <!-- MENU LINKS -->
               <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                         <li><asp:Hyperlink ID="HPLAdd" runat="server" CssClass="smoothScroll" Enabled="False" NavigateUrl="~/Inserciones_Solo_Administradores.aspx">Agregar nuevo Producto</asp:Hyperlink></li>
                         
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                         <li><!--Boton html que se ejecuta en el servidor-->
                <input type="button" id="Button1" class="auto-style7" runat="server" placeholder="Cerrar Sesión" OnServerClick="Button1_ServerClick"/></li>
                    </ul>
               </div>

          </div>
     </section>

    <!--Login-->
        <div>
            <asp:Panel ID="ventanaLogin" runat="server" DefaultButton="btnIngresar"
                style="background:#2c3e50;
                width: 30%;
                text-align: center;
                padding: 33px;
                min-height: 250px;
                border-radius: 22px;
                position: absolute;
                left: 35%;
                top: 25%;
                
                z-index:1;
                ">
                    <div id="cerrar" style="
                    position: absolute;
                    right: 3px;
                    top:5px;">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Iconos/cerrar.png" OnClick="ImageButton1_Click" />
                        &nbsp;</div>
                    <h3 class="color2">Login</h3>
                    <div id="tabla1">
                        <table>
                            <tr>
                                <td class="auto-style1">Usuario : </td>
                                <td><asp:TextBox ID="txtUser" runat="server"  Width="225px" onchange="sinEspacios(this.value, this.id)" ValidationGroup="valLogin" required></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Contraseña : </td>
                                <td><asp:TextBox ID="txtPass" runat="server"  Width="225px" TextMode="Password" ValidationGroup="valLogin" required></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <div style="
                        position: absolute;
                        right: 30px;
                        top:195px;">
                            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" ValidationGroup="valLogin" CssClass="form-control" />
                        </div>
                        <div style="
                        position: absolute;
                        right: 300px;
                        top:195px;">
                            <asp:HyperLink ID="HyperLink1" runat="server" BackColor="#2C3E50" ForeColor="White" NavigateUrl="~/NuevoUsuario.aspx">¿Nuevo Aqui? Registrate!</asp:HyperLink>
                        </div>
                    </div>
                </asp:Panel>
        </div>
        <section data-stellar-background-ratio="0.5">
          <div class="overlay">
              
            </div>
          <div class="container">
              <div>
                    <div class="col-md-offset-3 col-md-6 col-sm-12">
                         <div>
                              <h3 style="color:azure">Editar Info de Productos</h3>
                              <table>
                                  <tr>
                                      <td class="auto-style1">ID Producto: </td>
                                      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtBuscar" Enabled="false" runat="server" Width="264px" min="0" TextMode="Number"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                      <td><asp:Button ID="btnBuscar" runat="server" Text="Buscar" Enabled="false" OnClick="btnBuscar_Click" CssClass="form-control" ValidateRequestMode="Enabled" ValidationGroup="validarBusqueda" /></td>
                                  </tr>
                                  <tr>
                                      <td class="auto-style1">&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>
                              </table> 
               </div>
             </div>
        </div>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT * FROM [Usuarios] WHERE (([usuario] = @usuario2) AND ([contraseña] = @contraseña2))">
                   <SelectParameters>
                       <asp:ControlParameter ControlID="txtUser" Name="usuario2" PropertyName="Text" Type="String" />
                       <asp:ControlParameter ControlID="txtPass" Name="contraseña2" PropertyName="Text" Type="String" />
                   </SelectParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="Nombre_Prod" />
                       <asp:Parameter Name="Precio" />
                       <asp:Parameter Name="cod_prod" />
                   </UpdateParameters>
               </asp:SqlDataSource>
               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT ID_Producto, Nombre_Producto, PrecioCLP, Imagen FROM Producto"></asp:SqlDataSource>
               <asp:SqlDataSource ID="SqlDSPlaca" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" DeleteCommand="EliminarPlaca" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM Producto p, Placa pl WHERE p.ID_Producto = pl.idProd and p.ID_Producto = @idProd">
                   <DeleteParameters>
                       <asp:Parameter Name="IDProd" Type="Int64" />
                   </DeleteParameters>
                   <SelectParameters>
                       <asp:ControlParameter ControlID="txtBuscar" Name="idProd" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>
               <asp:SqlDataSource ID="SqlDSTarjetaVideo" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT * FROM Producto p, Tarjeta_de_Video gpu WHERE gpu.idProd = p.ID_Producto and p.ID_Producto = @idProd" DeleteCommand="EliminarTarjetaVideo" DeleteCommandType="StoredProcedure">
                   <DeleteParameters>
                       <asp:Parameter Name="IDProd" Type="Int64" />
                   </DeleteParameters>
                   <SelectParameters>
                       <asp:ControlParameter ControlID="txtBuscar" Name="idProd" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>
               <asp:SqlDataSource ID="SqlDSGabinete" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" DeleteCommand="EliminarGabinete" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM Producto p, Gabinete g WHERE p.ID_Producto = g.idProd and p.ID_Producto = @idPr">
                   <DeleteParameters>
                       <asp:Parameter Name="IDProd" Type="Int64" />
                   </DeleteParameters>
                   <SelectParameters>
                       <asp:ControlParameter ControlID="txtBuscar" Name="idPr" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>
               <asp:SqlDataSource ID="SqlDSDisco" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" DeleteCommand="EliminarDisco" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM DiscoDuro, Producto WHERE idProd = ID_Producto and ID_Producto = @idProd">
                   <DeleteParameters>
                       <asp:Parameter Name="IDProd" Type="Int64" />
                   </DeleteParameters>
                   <SelectParameters>
                       <asp:ControlParameter ControlID="txtBuscar" Name="idProd" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>
               <asp:SqlDataSource ID="SqlDSEquipo" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" DeleteCommand="DELETE FROM Equipos WHERE idProd = @IDProd

	
DELETE from Producto WHERE ID_Producto = @IDProd" SelectCommand="SELECT Equipos.Procesador, Equipos.Placa, Equipos.RAM, Equipos.Disipador, Equipos.Tarjeta_de_Video, Equipos.Fuente_de_Poder, Equipos.DiscoDuro, Equipos.Gabinete, Equipos.Categoria, Equipos.CaracteristicasExtra, Producto.ID_Producto, Producto.Nombre_Producto, Producto.PrecioCLP, Producto.Imagen FROM Equipos INNER JOIN Producto ON Equipos.idProd = Producto.ID_Producto WHERE (Producto.ID_Producto = @idProd)
">
                   <DeleteParameters>
                       <asp:Parameter Name="IDProd" />
                   </DeleteParameters>
                   <SelectParameters>
                       <asp:ControlParameter ControlID="txtBuscar" Name="idProd" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>
               <asp:SqlDataSource ID="SqlDSDisipador" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" DeleteCommand="EliminarDisipador" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM Producto, Disipador WHERE ID_PRoducto = idProd and ID_Producto = @idProd">
                   <DeleteParameters>
                       <asp:Parameter Name="IDProd" Type="Int64" />
                   </DeleteParameters>
                   <SelectParameters>
                       <asp:ControlParameter ControlID="txtBuscar" Name="idProd" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>
               <asp:SqlDataSource ID="SqlDSRAM" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" DeleteCommand="EliminarRAM" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM RAM, Producto WHERE ID_Producto = idProd and ID_Producto = @idProd">
                   <DeleteParameters>
                       <asp:Parameter Name="IDProd" Type="Int64" />
                   </DeleteParameters>
                   <SelectParameters>
                       <asp:ControlParameter ControlID="txtBuscar" Name="idProd" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>
               <br />
               <asp:SqlDataSource ID="SqlDSFuentePoder" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" DeleteCommand="EliminarFuentePoder" DeleteCommandType="StoredProcedure" SelectCommand="SELECT * FROM Fuente_de_Poder f, Producto p where f.idProd = p.ID_Producto and p.ID_Producto = @idProd">
                   <DeleteParameters>
                       <asp:Parameter Name="IDProd" Type="Int64" />
                   </DeleteParameters>
                   <SelectParameters>
                       <asp:ControlParameter ControlID="txtBuscar" Name="idProd" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>
               <br />
               
               
               
               <asp:SqlDataSource ID="SqlDSProcesador" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT p.ID_Producto, p.Nombre_Producto, cpu.Marca, cpu.Modelo_procesador, cpu.Nucleos, cpu.FrecuenciaGhz, cpu.Generacion, cpu.socket, cpu.Chipset, cpu.FrecGPUIntegrada, cpu.tpdProc, cpu.conAlimentacionP, p.PrecioCLP, p.Imagen 
FROM Producto p, Procesador cpu
WHERE p.ID_Producto = cpu.idProd and p.ID_Producto = @idProd">
                   <SelectParameters>
                       <asp:ControlParameter ControlID="txtBuscar" Name="idProd" PropertyName="Text" />
                   </SelectParameters>
               </asp:SqlDataSource>
               
               
               
               <br />
                    <asp:SqlDataSource ID="SqlDSGabineteE" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="CargarGabinete" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlPlacaE" Name="idPlaca" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlGPUE" Name="idGPU" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlDisipadorE" Name="idDisipador" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlDiscoDuroE" Name="idDisco" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSDiscoDuroE" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT DiscoDuro.id_Disco, Producto.Nombre_Producto FROM DiscoDuro INNER JOIN Producto ON DiscoDuro.idProd = Producto.ID_Producto"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSGPUE" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT Tarjeta_de_Video.id, Producto.Nombre_Producto FROM Tarjeta_de_Video INNER JOIN Producto ON Tarjeta_de_Video.idProd = Producto.ID_Producto"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSDisipadorE" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT Disipador.id, Producto.Nombre_Producto FROM Disipador INNER JOIN Producto ON Disipador.idProd = Producto.ID_Producto INNER JOIN Procesador ON Disipador.socket = Procesador.socket WHERE (Procesador.id_Procesador = @Procesador)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProcesadorE" Name="Procesador" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSRAME" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT r.id, p.Nombre_Producto FROM Placa AS pl INNER JOIN RAM AS r ON pl.tipoRam = r.tipoRam INNER JOIN Producto AS p ON r.idProd = p.ID_Producto WHERE (r.frecuenciaRAM_Mhz BETWEEN pl.frecuenciaMinRAM_Mhz AND pl.frecuenciaMaxRAM_Mhz) AND (pl.id = @id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlPlacaE" DefaultValue="" Name="id" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSPlacaE" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT Placa.id, Producto.Nombre_Producto FROM Placa INNER JOIN Producto ON Placa.idProd = Producto.ID_Producto INNER JOIN Procesador ON Placa.socket = Procesador.socket AND Placa.Chipset = Procesador.Chipset WHERE (Procesador.id_Procesador = @idProcesador)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProcesadorE" Name="idProcesador" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSFuentePowerE" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT p.Nombre_Producto, pw.ID FROM Fuente_de_Poder AS pw INNER JOIN Producto AS p ON pw.idProd = p.ID_Producto INNER JOIN Procesador AS cpu ON pw.conAlimentacionPr = cpu.conAlimentacionP INNER JOIN Placa AS pl ON pw.conAlimentacionPl = pl.conAlimentacion INNER JOIN Tarjeta_de_Video AS gpu ON pw.conAlimentacionG = gpu.conAlimentacion WHERE (CONVERT (int, REPLACE(pw.PotenciaPSU, ' W', '')) &gt;= cpu.tpdProc + gpu.tpdGPU + 151) AND (cpu.id_Procesador = @Procesador) AND (gpu.id = @GPU)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProcesadorE" Name="Procesador" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlGPUE" Name="GPU" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSProcesadorE" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT Procesador.id_Procesador, Producto.Nombre_Producto FROM Procesador INNER JOIN Producto ON Procesador.idProd = Producto.ID_Producto"></asp:SqlDataSource>
               
               
               
          </div>
     </section>
        <div class="divProc">

            <asp:GridView ID="GVProcesador" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Producto" Width="1488px" DataSourceID="SqlDSProcesador" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnEliminarCPU" runat="server" Text="Eliminar" OnClick="btnEliminarCPU_Click" OnClientClick="return confirm ('¿Esta seguro de que desea eliminar el producto? Este cambio podria afectar a alguno de los equipos');"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID_Producto" InsertVisible="False" ReadOnly="True" SortExpression="ID_Producto" />
                    <asp:BoundField DataField="Nombre_Producto" HeaderText="Nombre_Producto" SortExpression="Nombre_Producto" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                    <asp:BoundField DataField="Modelo_procesador" HeaderText="Modelo_procesador" SortExpression="Modelo_procesador" />
                    <asp:BoundField DataField="Nucleos" HeaderText="Nucleos" SortExpression="Nucleos" />
                    <asp:BoundField DataField="FrecuenciaGhz" HeaderText="FrecuenciaGhz" SortExpression="FrecuenciaGhz" />
                    <asp:BoundField DataField="Generacion" HeaderText="Generacion" SortExpression="Generacion" />
                    <asp:BoundField DataField="socket" HeaderText="socket" SortExpression="socket" />
                    <asp:BoundField DataField="Chipset" HeaderText="Chipset" SortExpression="Chipset" />
                    <asp:BoundField DataField="FrecGPUIntegrada" HeaderText="FrecGPUIntegrada" SortExpression="FrecGPUIntegrada" />
                    <asp:BoundField DataField="tpdProc" HeaderText="tpdProc" SortExpression="tpdProc" />
                    <asp:BoundField DataField="conAlimentacionP" HeaderText="conAlimentacionP" SortExpression="conAlimentacionP" />
                    <asp:BoundField DataField="PrecioCLP" HeaderText="PrecioCLP" SortExpression="PrecioCLP" />
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>

            <asp:GridView ID="GVPlaca" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Producto" DataSourceID="SqlDSPlaca" Width="1485px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnEliminarPlaca" runat="server" Text="Eliminar" OnClick="btnEliminarPlaca_Click" OnClientClick="return confirm ('¿Esta seguro de que desea eliminar el producto? Este cambio podria afectar a alguno de los equipos');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Producto" />
                    <asp:BoundField DataField="Nombre_Producto" HeaderText="Nombre_Producto" SortExpression="Nombre_Producto" />
                    <asp:CheckBoxField DataField="E_ATX" HeaderText="E-ATX" SortExpression="E_ATX" />
                    <asp:CheckBoxField DataField="ATX" HeaderText="ATX" SortExpression="ATX" />
                    <asp:CheckBoxField DataField="Micro_ATX" HeaderText="Micro ATX" SortExpression="Micro_ATX" />
                    <asp:CheckBoxField DataField="ITX" HeaderText="ITX" SortExpression="ITX" />
                    <asp:BoundField DataField="socket" HeaderText="Socket" SortExpression="socket" />
                    <asp:BoundField DataField="Chipset" HeaderText="Chipset" SortExpression="Chipset" />
                    <asp:BoundField DataField="tipoRam" HeaderText="Tipo de RAM admitida" SortExpression="tipoRam" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="frecuenciaMinRAM_Mhz" HeaderText="Frec. Min RAM (Mhz)" SortExpression="frecuenciaMinRAM_Mhz" />
                    <asp:BoundField DataField="frecuenciaMaxRAM_Mhz" HeaderText="Frec. Max RAM (Mhz)" SortExpression="frecuenciaMaxRAM_Mhz" />
                    <asp:BoundField DataField="configRAM" HeaderText="Config. RAM" SortExpression="configRAM" />
                    <asp:CheckBoxField DataField="PCIExpressx16" HeaderText="PCI Express x16" SortExpression="PCIExpressx16" />
                    <asp:BoundField DataField="conAlimentacion" HeaderText="Conex. Alimentación" SortExpression="conAlimentacion" />
                    <asp:BoundField DataField="PrecioCLP" HeaderText="Precio" SortExpression="PrecioCLP" />
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>

            <asp:GridView ID="GVTarjetaVideo" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Producto" DataSourceID="SqlDSTarjetaVideo" Width="1480px" Height="391px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnEliminarGPU" runat="server" Text="Eliminar" OnClick="btnEliminarGPU_Click" OnClientClick="return confirm ('¿Esta seguro de que desea eliminar el producto? Este cambio podria afectar a alguno de los equipos');"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_Producto" />
                    <asp:BoundField DataField="Nombre_Producto" HeaderText="Nombre" SortExpression="Nombre_Producto" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                    <asp:BoundField DataField="Modelo_GPU" HeaderText="Modelo" SortExpression="Modelo_GPU" />
                    <asp:BoundField DataField="tpdGPU" HeaderText="TDP" SortExpression="tpdGPU" />
                    <asp:BoundField DataField="Medida_mm" HeaderText="Medida (mm²)" SortExpression="Medida_mm" />
                    <asp:BoundField DataField="PSU_Recomendada" HeaderText="PSU Recomendada" SortExpression="PSU_Recomendada" />
                    <asp:BoundField DataField="conAlimentacion" HeaderText="Conex. Alimentación" SortExpression="conAlimentacion" />
                    <asp:BoundField DataField="VRAM" HeaderText="VRAM" SortExpression="VRAM" />
                    <asp:BoundField DataField="tipoVRAM" HeaderText="Tipo de VRAM" SortExpression="tipoVRAM" />
                    <asp:BoundField DataField="PrecioCLP" HeaderText="Precio" SortExpression="PrecioCLP" />
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>


            <asp:GridView ID="GVFuentePoder" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,ID_Producto" DataSourceID="SqlDSFuentePoder" Width="1478px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnEliminarFuentePoder" runat="server" Text="Eliminar" OnClientClick="return confirm ('¿Esta seguro de que desea eliminar el producto? Este cambio podria afectar a alguno de los equipos');" OnClick="btnEliminarFuentePoder_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID_Producto" InsertVisible="False" ReadOnly="True" SortExpression="ID_Producto" />
                    <asp:BoundField DataField="Nombre_Producto" HeaderText="Nombre_Producto" SortExpression="Nombre_Producto" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="conAlimentacionPr" HeaderText="conAlimentacionPr" SortExpression="conAlimentacionPr" />
                    <asp:BoundField DataField="conAlimentacionPl" HeaderText="conAlimentacionPl" SortExpression="conAlimentacionPl" />
                    <asp:BoundField DataField="conAlimentacionG" HeaderText="conAlimentacionG" SortExpression="conAlimentacionG" />
                    <asp:BoundField DataField="PotenciaPSU" HeaderText="PotenciaPSU" SortExpression="PotenciaPSU" />
                    <asp:BoundField DataField="certificacion" HeaderText="certificacion" SortExpression="certificacion" />
                    <asp:BoundField DataField="PrecioCLP" HeaderText="Precio" SortExpression="PrecioCLP" />
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>


            <asp:GridView ID="GVRAM" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Producto" DataSourceID="SqlDSRAM" Width="1475px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnEliminarRAM" runat="server" OnClientClick="return confirm ('¿Esta seguro de que desea eliminar el producto? Este cambio podria afectar a alguno de los equipos');" Text="Eliminar" OnClick="btnEliminarRAM_Click"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID_Producto" SortExpression="ID_Producto" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Nombre_Producto" HeaderText="Nombre_Producto" SortExpression="Nombre_Producto" />
                    <asp:BoundField DataField="tipoRam" HeaderText="tipoRam" SortExpression="tipoRam" />
                    <asp:BoundField DataField="frecuenciaRAM_Mhz" HeaderText="frecuenciaRAM_Mhz" SortExpression="frecuenciaRAM_Mhz" />
                    <asp:BoundField DataField="MemoriaRAM_Gb" HeaderText="MemoriaRAM_Gb" SortExpression="MemoriaRAM_Gb" />
                    <asp:BoundField DataField="PrecioCLP" HeaderText="Precio" SortExpression="PrecioCLP" />
                    <asp:TemplateField HeaderText="Imagen">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>


            <asp:GridView ID="GVDisipador" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Producto" DataSourceID="SqlDSDisipador" Width="1475px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnEliminarDisipador" runat="server"  OnClientClick="return confirm ('¿Esta seguro de que desea eliminar el producto? Este cambio podria afectar a alguno de los equipos');" Text="Eliminar" OnClick="btnEliminarDisipador_Click"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID" SortExpression="ID_Producto" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Nombre_Producto" HeaderText="Nombre del Producto" SortExpression="Nombre_Producto" />
                    <asp:BoundField DataField="TipoDisipador" HeaderText="TipoDisipador" SortExpression="TipoDisipador" />
                    <asp:BoundField DataField="socket" HeaderText="socket" SortExpression="socket" />
                    <asp:BoundField DataField="Medida_mm" HeaderText="Medida_mm" SortExpression="Medida_mm" />
                    <asp:BoundField DataField="PrecioCLP" HeaderText="PrecioCLP" SortExpression="PrecioCLP" />
                    <asp:TemplateField HeaderText="Imagen">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>


            <asp:GridView ID="GVGabinete" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Producto,id" DataSourceID="SqlDSGabinete" Width="1472px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnEliminarGabinete" runat="server" Text="Eliminar" OnClientClick="return confirm ('¿Esta seguro de que desea eliminar el producto? Este cambio podria afectar a alguno de los equipos');" OnClick="btnEliminarGabinete_Click"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID" SortExpression="ID_Producto" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Nombre_Producto" HeaderText="Nombre_Producto" SortExpression="Nombre_Producto" />
                    <asp:CheckBoxField DataField="E_ATX" HeaderText="E_ATX" SortExpression="E_ATX" />
                    <asp:CheckBoxField DataField="ATX" HeaderText="ATX" SortExpression="ATX" />
                    <asp:CheckBoxField DataField="Micro_ATX" HeaderText="Micro_ATX" SortExpression="Micro_ATX" />
                    <asp:CheckBoxField DataField="ITX" HeaderText="ITX" SortExpression="ITX" />
                    <asp:BoundField DataField="medidaMaxGPU_mm" HeaderText="Medida Max GPU (mm²)" SortExpression="medidaMaxGPU_mm" />
                    <asp:BoundField DataField="medidaMaxDisipador_mm" HeaderText="Medida Max Disipador (mm²)" SortExpression="medidaMaxDisipador_mm" />
                    <asp:CheckBoxField DataField="huecohhd" HeaderText="HDD" SortExpression="huecohhd" />
                    <asp:BoundField DataField="cantidadhhd" HeaderText="Cantidad hhd" SortExpression="cantidadhhd" />
                    <asp:CheckBoxField DataField="huecossd" HeaderText="SSD" SortExpression="huecossd" />
                    <asp:BoundField DataField="cantidadssd" HeaderText="Cantidad SSD" SortExpression="cantidadssd" />
                    <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
                    <asp:BoundField DataField="iluminacion" HeaderText="iluminacion" SortExpression="iluminacion" />
                    <asp:CheckBoxField DataField="ventiladores_preinstalados" HeaderText="Ventiladores preinstalados" SortExpression="ventiladores_preinstalados" />
                    <asp:BoundField DataField="vpreinst_Caracteristicas" HeaderText="Caracteristicas ventilador" SortExpression="vpreinst_Caracteristicas" />
                    <asp:BoundField DataField="PrecioCLP" HeaderText="Precio" SortExpression="PrecioCLP" />
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>



            <asp:GridView ID="GVDisco" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Producto" DataSourceID="SqlDSDisco" Width="1472px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnEliminarDisco" runat="server" Text="Eliminar" OnClientClick="return confirm 
                                ('¿Esta seguro de que desea eliminar el producto? Este cambio podria afectar a alguno de los equipos');" OnClick="btnEliminarDisco_Click"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID" SortExpression="ID_Producto" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Nombre_Producto" HeaderText="Nombre del producto" SortExpression="Nombre_Producto" />
                    <asp:BoundField DataField="tipoDisco" HeaderText="Tipo de Disco" SortExpression="tipoDisco" />
                    <asp:BoundField DataField="cantidadAlmacenamiento_GB" HeaderText="Memoria (Gb)" SortExpression="cantidadAlmacenamiento_GB" />
                    <asp:BoundField DataField="medida" HeaderText="Medida (mm)" SortExpression="medida" />
                    <asp:BoundField DataField="PrecioCLP" HeaderText="Precio" SortExpression="PrecioCLP" />
                    <asp:TemplateField HeaderText="Imagen">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>

            <asp:GridView ID="GVEquipos" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Producto" DataSourceID="SqlDSEquipo" Width="1493px" DataMember="DefaultView" OnRowEditing="GVEquipos_RowEditing" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="btnActualizarE" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                            &nbsp;<asp:Button ID="btnCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnEditarE" runat="server" CausesValidation="False" Text="Editar" OnClick="btnEditarE_Click" />
                            &nbsp;<asp:Button ID="btnEliminarE" runat="server" CausesValidation="False" Text="Eliminar" OnClick="btnEliminarE_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID_Producto">
                        <ItemTemplate>
                            <asp:Label ID="lblIDProductoGV" runat="server" Text='<%# Bind("ID_Producto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre del Producto" SortExpression="Nombre_Producto">
                        <ItemTemplate>
                            <asp:Label ID="lblNombreProd" runat="server" Text='<%# Bind("Nombre_Producto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Procesador" SortExpression="Procesador">
                        
                        <ItemTemplate>
                            <asp:Label ID="lblProcesadorE" runat="server" Text='<%# Bind("Procesador") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Placa" SortExpression="Placa">
                        
                        <ItemTemplate>
                            <asp:Label ID="lblPlacaGV" runat="server" Text='<%# Bind("Placa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RAM" SortExpression="RAM">
                        
                        <ItemTemplate>
                            <asp:Label ID="lblRAMGV" runat="server" Text='<%# Bind("RAM") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Disipador" SortExpression="Disipador">
                        
                        
                        <ItemTemplate>
                            <asp:Label ID="lblDisipadorGV" runat="server" Text='<%# Bind("Disipador") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tarjeta_de_Video" SortExpression="Tarjeta_de_Video">
                        
                        <ItemTemplate>
                            <asp:Label ID="lblGPUGV" runat="server" Text='<%# Bind("Tarjeta_de_Video") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fuente_de_Poder" SortExpression="Fuente_de_Poder">
                        
                        <ItemTemplate>
                            <asp:Label ID="lblPSUGV" runat="server" Text='<%# Bind("Fuente_de_Poder") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DiscoDuro" SortExpression="DiscoDuro">

                        <ItemTemplate>
                            <asp:Label ID="lblDiscoGV" runat="server" Text='<%# Bind("DiscoDuro") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gabinete" SortExpression="Gabinete">

                        <ItemTemplate>
                            <asp:Label ID="lblGabineteGV" runat="server" Text='<%# Bind("Gabinete") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Categoria" SortExpression="Categoria">
                        
                        <ItemTemplate>
                            <asp:Label ID="lblCategoriaGV" runat="server" Text='<%# Bind("Categoria") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CaracteristicasExtra" SortExpression="CaracteristicasExtra">
                        <ItemTemplate>
                            <asp:Label ID="lblCaracteristicasGV" runat="server" Text='<%# Bind("CaracteristicasExtra") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio" SortExpression="PrecioCLP">
                        
                        <ItemTemplate>
                            <asp:Label ID="lblPrecioGV" runat="server" Text='<%# Bind("PrecioCLP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="imgEquipo" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>


            


            
            <asp:Panel ID="pnlActualizarEquipo" runat="server" Visible="false" DefaultButton=""
                style="background-color:cadetblue;
                width: 1024px;
                text-align: center;
                padding: 33px;
                min-height: 250px;
                border-radius: 22px;
                position: fixed;
                left: 20%;
                top: 20%;
                
                z-index:1;

                    ">
                        <div id="cerrarActualizar" style="
                    position: absolute;
                    right: 3px;
                    top:5px;">
                       <input type="button" id="btnCerrarActualizar" class="auto-style9" runat="server" onserverclick="btnCerrarActualizar_ServerClick" />
                        &nbsp;</div>
                    <h3 class="color2">Actualizar</h3>
                    <div id="tabla2">
                        <div style="float:right; width:50%; padding-left:100px;">
                        <table>
                            <tr>
                                <td class="auto-style1">Tarjeta de video : </td>
                                <td>
                                    <asp:DropDownList ID="ddlGPUE" runat="server" required="" Width="200px"   AutoPostBack="True" DataSourceID="SqlDSGPUE" DataTextField="Nombre_Producto" DataValueField="id">
                                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Fuente de Poder : </td>
                                <td>
                                    <asp:DropDownList ID="ddlPSUE" runat="server" required="" Width="200px"  AutoPostBack="True" DataSourceID="SqlDSFuentePowerE" DataTextField="Nombre_Producto" DataValueField="ID">
                                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Disco Duro : </td>
                                <td>
                                    <asp:DropDownList ID="ddlDiscoDuroE" runat="server" required="" Width="200px"  AutoPostBack="True" DataSourceID="SqlDSDiscoDuroE" DataTextField="Nombre_Producto" DataValueField="id_Disco" >
                                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Gabinete :</td>
                                <td>
                                    <asp:DropDownList ID="ddlGabineteE" runat="server"  required="" Width="200px"  DataSourceID="SqlDSGabineteE" DataTextField="Nombre_Producto" DataValueField="id">
                                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Otras caracteristicas :</td>
                                <td>
                                    <asp:TextBox ID="txtCaracteristicasAdicionalesE" runat="server"  onchange="sinEspacios(this.value, this.id)" TextMode="MultiLine" MaxLength="150" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Precio :</td>
                                <td>
                                    <asp:TextBox ID="txtPrecioE" runat="server" Width="200px" min="0" required="" TextMode="Number" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Imagen :</td>
                                <td>
                                    <asp:Image ID="imgEquipoUpdate" runat="server" Height="200px" Width="200" />
                                    <asp:FileUpload ID="FUEquipoAct" accept="image/*" runat="server" onchange="mostrar(this.id, document.getElementById('imgEquipoUpdate').id)" ToolTip="Si desea mantener la imagen anterior no carge ninguna imagen nueva"/>  
                                </td>
                            </tr>
                        </table>
                            </div>
                        <div style="float:left; width:50%">
                        <table>
                            <tr>
                                <td class="auto-style1">ID : </td>
                                <td>
                                    <asp:Label ID="lblIDEquipo" runat="server" Width="200"  ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Nombre del Producto : </td>
                                <td><asp:TextBox ID="txtNombreProductoE" runat="server" Width="200"   onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Categoría : </td>
                                <td>
                                    <asp:DropDownList ID="ddlCategoriaE" runat="server" Width="200"  required>
                                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                                        <asp:ListItem>Oficina</asp:ListItem>
                                        <asp:ListItem>Diseño/Producción</asp:ListItem>
                                        <asp:ListItem>Gamer</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Procesador : </td>
                                <td>
                                    <asp:DropDownList ID="ddlProcesadorE" runat="server" Width="200"  required="" AutoPostBack="True" DataMember="DefaultView" DataSourceID="SqlDSProcesadorE" DataTextField="Nombre_Producto" DataValueField="id_Procesador" OnSelectedIndexChanged="ddlProcesadorE_SelectedIndexChanged">
                                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Placa : </td>
                                <td>
                                    <asp:DropDownList ID="ddlPlacaE" runat="server" Width="200"  required=""  AutoPostBack="True" DataSourceID="SqlDSPlacaE" DataTextField="Nombre_Producto" DataValueField="id" OnSelectedIndexChanged="ddlPlacaE_SelectedIndexChanged">
                                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">RAM : </td>
                                <td>
                                    <asp:DropDownList ID="ddlRAME" runat="server"  required="" Width="200"  AutoPostBack="True" DataSourceID="SqlDSRAME" DataTextField="Nombre_Producto" DataValueField="id">
                                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Disipador : </td>
                                <td>
                                    <asp:DropDownList ID="ddlDisipadorE" runat="server" required="" Width="200"  AutoPostBack="True" DataSourceID="SqlDSDisipadorE" DataTextField="Nombre_Producto" DataValueField="id" OnSelectedIndexChanged="ddlDisipadorE_SelectedIndexChanged">
                                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        </div>
                        
                        <div style="float:left; margin-top:260px;">
                            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" CssClass="form-control" />
                        </div>
                        
                    </div>
            </asp:Panel>

            </div>
        <div class="container">
               
               <br />
              
               <br />
            <asp:GridView ID="GridView1" runat="server" Visible="False" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="ID_Producto" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1286px" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID_Producto" InsertVisible="False" ReadOnly="True" SortExpression="ID_Producto" />
                    <asp:BoundField DataField="Nombre_Producto" HeaderText="Nombre_Producto" SortExpression="Nombre_Producto" />
                    <asp:BoundField DataField="PrecioCLP" HeaderText="PrecioCLP" SortExpression="PrecioCLP" />
                    <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Imagen" SortExpression="Imagen">
                       
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="200" Width="200" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
            </div>
    </form>
    <footer>
        <div class="container">
            <h3>Taller de Proyectos Integrados de Programación</h3>
            <h4>Daniel Jofré / Álvaro Parraguez</h4>
            <h4>Programación y Analisis de Sistemas (PEV)</h4>
        </div>
    </footer>
</body>
</html>

<script src="Scripts/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    function sinEspacios(texto, identificador) {
        document.getElementById(identificador).value = texto.trim();
    }
    function mostrar(id1, id2) {
        var archivo = document.getElementById(id1).files[0];
        if (!(/\.(jpg|jpeg|jfif|ico|svgz|avif|bmp|svg|png|gif)$/i).test(archivo.name)) {
            alert('El archivo a adjuntar no es una imagen');
            limpiarImagen(document.getElementById(id1));
            return;
        }
        var reader = new FileReader();
        if (id1) {
            reader.readAsDataURL(archivo);
            reader.onloadend = function () {
                document.getElementById(id2).src = reader.result;
            }
        }
    }

    function cerrarActualizar() {
        $("#pnlActualizarEquipo").hide();
    }

    //Limpia el FileUpload
    function limpiarImagen(ctrl) {
        try {
            ctrl.value = null;
        } catch (ex) { }
        if (ctrl.value) {
            ctrl.parentNode.replaceChild(ctrl.cloneNode(true), ctrl);
        }
    }

</script>
