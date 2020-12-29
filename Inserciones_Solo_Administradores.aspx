<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inserciones_Solo_Administradores.aspx.cs" Inherits="CotPc.Inserciones_Solo_Administradores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/tooplate-style.css"/>
    <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <style type="text/css">
        .auto-style1 {
            margin-left: 1287px;
            color:#dbdbdb;

        }
        .auto-style2 {
            width: 700px;
        }
        .auto-style3 {
            width:50%;
            float: right;
            
        }
        .auto-style4 {
            bottom:40%;
            align-content:center;
            min-height: 400px;
            min-width: 400px;
            max-height: 500px;
            max-width: 500px;

        }
        .auto-style5 {
            height: 82px;
        }
        .CampoInvisible{
            display: none;
        }
        .auto-style6 {
            width: 50%;
            float: right;
            margin-left: 0px;
            color:aliceblue;
            
        }
        .auto-style7 {
            margin-left: 573px;
            background-image:url(/Iconos/cerrarSesion.png);
            height: 32px;
            width:32px;
            background-size:contain;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <ul >
            <li><asp:Hyperlink ID="HPLAdd" runat="server" CssClass="smoothScroll" Enabled="False" NavigateUrl="~/EditarElementos.aspx">Editar productos</asp:Hyperlink></li>
                         
        </ul>
        <ul class="auto-style6">
            <li>
                <!--Boton html que se ejecuta en el servidor-->
                <input type="button" id="Button1" class="auto-style7" runat="server" placeholder="Cerrar Sesión" OnServerClick="Button1_ServerClick"/>
                
            </li>
            
         </ul>
        <h3>
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Inserte Componentes"></asp:Label>
        </h3>

        <!--Login-->
        
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
                    <h3 style="color:azure">Login</h3>
                    <div id="tabla1">
                        <table>
                            <tr>
                                <td class="auto-style1">Usuario : </td>
                                <td><asp:TextBox ID="txtUser" runat="server" onchange="sinEspacios(this.value, this.id)" Width="225px" required></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Contraseña : </td>
                                <td><asp:TextBox ID="txtPass" runat="server" onchange="sinEspacios(this.value, this.id)" Width="225px" TextMode="Password" required></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <div style="
                        position: absolute;
                        right: 30px;
                        top:195px;">
                            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar"  ValidationGroup="valLogin" CssClass="form-control" OnClick="btnIngresar_Click" />
                        </div>
                        <div style="
                        position: absolute;
                        right: 300px;
                        top:195px;">
                            <asp:HyperLink ID="HyperLink1" runat="server" BackColor="#2C3E50" ForeColor="White" NavigateUrl="~/NuevoUsuario.aspx">¿Nuevo Aqui? Registrate!</asp:HyperLink>
                        </div>
                    </div>
                </asp:Panel>

        <div class="auto-style5">
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Seleccione: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="391px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Enabled="False" ToolTip="Seleccione uno de los componentes de la lista">
                <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                <asp:ListItem>Procesador</asp:ListItem>
                <asp:ListItem>Placa</asp:ListItem>
                <asp:ListItem>Tarjeta de Video</asp:ListItem>
                <asp:ListItem>Fuente de Poder</asp:ListItem>
                <asp:ListItem>RAM</asp:ListItem>
                <asp:ListItem>Disipador</asp:ListItem>
                <asp:ListItem>Gabinete</asp:ListItem>
                <asp:ListItem>Disco Duro</asp:ListItem>
                <asp:ListItem>Equipo Preestablecido</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT * FROM [Usuarios] WHERE (([usuario] = @usuario) AND ([contraseña] = @contraseña))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtUser" Name="usuario" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtPass" Name="contraseña" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <!--Procesador-->
            <asp:Panel ID="pnlProcesador" runat="server" Visible="false">
                
                 <div class="auto-style3">

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <br />
                     <br />

                     <asp:Image ID="imgPr" runat="server" CssClass="auto-style4" />
                     <br />
                     <asp:FileUpload ID="FUProcesador" accept="image/*" runat="server" onchange="mostrar(this.id, document.getElementById('imgPr').id)" ForeColor="Black"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoPr" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Text="Marca: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:DropDownList ID="ddlMarcaPr" runat="server" Height="16px" required Width="285px" ToolTip="Las marcas de los procesadores son Intel y AMD, otras marcas como TSMC o IBM no las consideraremos por motivos de popularidad">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                        <asp:ListItem>Intel</asp:ListItem>
                        <asp:ListItem>AMD</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Text="Modelo:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtModeloPr" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                <br />
                
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" Text="Generación"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtGeneracionPr" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label14" runat="server" Text="Frecuencia del Procesador &lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;(Ghz)"></asp:Label>
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtFrecCPU" runat="server" Width="277px" required min="0.5" step=".01" TextMode="Number"></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" Text="Cantidad de Núcleos:"></asp:Label>
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtNucleos" runat="server" Width="277px" required min="1" TextMode="Number"></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label8" runat="server" Text="Socket"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtSocketPr" runat="server" onchange="sinEspacios(this.value, this.id)" Width="277px" required ToolTip="El zocalo o socket define la compatibilidad entre el procesador y la placa, ademas de otros componentes como la propia refrigeración"></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="Label9" runat="server" Text="Chipset"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtChipsetPr" runat="server" onchange="sinEspacios(this.value, this.id)" required="" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label10" runat="server" Text="GPU Integrada"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="chkGPUIntegrada" type="checkbox" onclick="chkProcesador()" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblFrecGpuIntegrada" runat="server" CssClass="CampoInvisible" Text="Frec. GPU Integrada (Mhz)"></asp:Label>
                    &nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtFrecGPUIntegrada" runat="server" Width="277px" required CssClass="CampoInvisible" Enabled="false" min="100" TextMode="Number"></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label12" runat="server" Text="TDP Procesador (w):"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtTDPProcesador" runat="server" required="" Width="277px" min="0" TextMode="Number"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label13" runat="server" Text="Conectores de&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Alimentación:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtconAlimentacionPr" runat="server" onchange="sinEspacios(this.value, this.id)" required="" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label15" runat="server" Text="Precio:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                    <asp:TextBox ID="txtPrecioPr" runat="server" min="0" required TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnIngresarPr" runat="server" OnClick="btnIngresarPr_Click" OnClientClick="return confirm ('¿Los campos son correctos?');" Text="Ingresar" />
                <br />
                    </div>
            </asp:Panel>


            <!--Placa-->
            <asp:Panel ID="pnlPlaca" runat="server" Visible="false">
                
                 <div class="auto-style3">

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <br />
                     <br />

                     <asp:Image ID="imgPl" runat="server" CssClass="auto-style4" Height="397px" />
                     <br />
                     <asp:FileUpload ID="FUPlaca" accept="image/*" runat="server" onchange="mostrar(this.id, document.getElementById('imgPl').id)" ForeColor="Black" ToolTip="Puedes cargar una imagen aqui (Opcional)"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label11" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoPl" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                <br />
                <br />
                    &nbsp; &nbsp;
                <asp:Label ID="Label18" runat="server" Text="Tipo de Placa:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="rbE_ATX_Placa" runat="server" GroupName="TipoPlaca" Text="E-ATX" ToolTip="Extended ATX es un factor de forma cuyas dimensiones son de 305 x 330 mm, lo que las hace sensiblemente más grandes que las placas ATX, aunque sus taladros son parcialmente compatibles con éstas." />
&nbsp;
                    <asp:RadioButton ID="rbATX_Placa" runat="server" GroupName="TipoPlaca" Text="ATX" ToolTip="Este formato de placa tiene unas dimensiones de 305 x 244 mm (aunque algunos fabricantes de placas emplean medidas algo menores), y se ha acabado convirtiendo en estándar de facto por el que se realiza la producción de placas base del mercado." />
&nbsp;
                    <asp:RadioButton ID="rbMicro_ATX_Placa" runat="server" GroupName="TipoPlaca" Text="Micro ATX" ToolTip="Desarrollada como un factor de forma evolucionado del antes mencionado ATX, pero un 25% más pequeño (sus dimensiones son de 244 x 244 mm). De hecho, este formato de placa base se desarrolló par ser expresamente compatible con las ATX." />
&nbsp;
                    <asp:RadioButton ID="rbITX_Placa" runat="server" GroupName="TipoPlaca" Text="ITX" ToolTip="Tecnología de la Información eXtendida. posee una torre cuadrada siendo en este caso de 6.7 pulgadas o 17 centímetros. Puede ser usada en HTPCs . Lo puedes encontrar en equipos AIO principalmente." />
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label21" runat="server" Text="Socket"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtSocketPl" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="Label22" runat="server" Text="Chipset"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtChipsetPl" runat="server" required="" onchange="sinEspacios(this.value, this.id)" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label28" runat="server" Text="Tipo de RAM&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;compatible"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlTipoRAM_Pl" runat="server" Height="16px" Width="285px" required>
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                        <asp:ListItem>DDR2</asp:ListItem>
                        <asp:ListItem>DDR3</asp:ListItem>
                        <asp:ListItem>DDR4</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label29" runat="server" Text="Frec. min. RAM &lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;(Mhz)"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtFrecMinRAM" runat="server" Text="2133" required TextMode="Range" min="2133" max="5100" Width="277px"
                        pattern="[0-9]{1,4}" onchange="RangoMinRAMPl(this.value);"></asp:TextBox>
                    &nbsp;&nbsp;<asp:Label ID="lblRangominPl" runat="server" Text="2133 Mhz"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label30" runat="server" Text="Frec. max. RAM &lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;(Mhz)"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtFrecMaxRAM" runat="server" max="5100" min="2133" Text="2133" onchange="RangoMaxRAMPl(this.value);" required 
                        pattern="[0-9]{1,4}" TextMode="Range" Width="277px"></asp:TextBox>
                    &nbsp;&nbsp;<asp:Label ID="lblRangoMaxPl" runat="server" Text="2133 Mhz"></asp:Label>
                    <br />
                    &nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label25" runat="server" Text="Config RAM"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:DropDownList ID="ddlConfigRAM_Pl" runat="server" Width="274px" required>
                        <asp:ListItem Value ="">---Seleccione---</asp:ListItem>
                        <asp:ListItem>Single Channel</asp:ListItem>
                        <asp:ListItem>Dual Channel</asp:ListItem>
                        <asp:ListItem>Quad Channel</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label31" runat="server" Text="PCI Express x16"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="chkPCIExpressx16Pl" runat="server" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label26" runat="server" Text="Conectores de&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Alimentación:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtconA_Placa" runat="server" onchange="sinEspacios(this.value, this.id)" required Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label27" runat="server" Text="Precio:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                    <asp:TextBox ID="txtPrecioPl" runat="server" TextMode="Number" min="0" required Width="277px"></asp:TextBox>
                <br />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnIngresarPlaca" runat="server" Text="Ingresar" OnClientClick="return confirm ('¿Los campos son correctos?');" OnClick="btnIngresarPlaca_Click" />
                <br />
                    </div>
               
                
            </asp:Panel>

            <!--Tarjeta de video-->
            <asp:Panel ID="pnlTarjetaVideo" runat="server" Visible="false">
                
                 <div class="auto-style3">

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <br />
                     <br />

                     <asp:Image ID="imgGPU" runat="server" CssClass="auto-style4" Height="397px" />
                     <br />
                     <asp:FileUpload ID="FUGPU" accept="image/*" runat="server" onchange="mostrar(this.id, document.getElementById('imgGPU').id)" ForeColor="Black" ToolTip="Puedes cargar una imagen aqui (Opcional)"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label16" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoGPU" runat="server" onchange="sinEspacios(this.value, this.id)" Width="277px" required></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label17" runat="server" Text="Marca: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtMarcaGPU" runat="server" onchange="sinEspacios(this.value, this.id)" Width="274px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label19" runat="server" Text="Modelo:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtModeloGPU" runat="server" onchange="sinEspacios(this.value, this.id)" Width="277px" required></asp:TextBox>
                <br />
                
                <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label36" runat="server" Text="TDP GPU (w):"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtTDPGPU" runat="server" required="" Width="277px" min="0" TextMode="Number"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label39" runat="server" Text="Medida (mm²)"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:TextBox ID="txtMedidaGPU" runat="server" min="1" required="" TextMode="Number" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label41" runat="server" Text="VRAM (Gb)"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtVRAM" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="LabeltipoVRAM" runat="server" Text="Tipo VRAM"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:DropDownList ID="ddlTipoVRAM" runat="server" Height="16px" Width="283px" required>
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                        <asp:ListItem>GDDR</asp:ListItem>
                        <asp:ListItem>GDDR2</asp:ListItem>
                        <asp:ListItem>GDDR3</asp:ListItem>
                        <asp:ListItem>GDDR4</asp:ListItem>
                        <asp:ListItem>GDDR5</asp:ListItem>
                        <asp:ListItem>GDDR5X</asp:ListItem>
                        <asp:ListItem>GDDR6</asp:ListItem>
                        <asp:ListItem>HBM</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label40" runat="server" Text="Fuente de Poder&lt;br&gt;  &amp;nbsp;&amp;nbsp;&amp;nbsp;Recomendada"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtPSURecomendadaGPU" runat="server" onchange="sinEspacios(this.value, this.id)" required="" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label37" runat="server" Text="Conectores de&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Alimentación:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtconAlGPU" runat="server" required=""  onchange="sinEspacios(this.value, this.id)" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label38" runat="server" Text="Precio:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                    <asp:TextBox ID="txtPrecioGPU" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnIngresarGPU" runat="server" OnClick="btnIngresarGPU_Click" OnClientClick="return confirm ('¿Los campos son correctos?');" Text="Ingresar" />
                <br />
                    </div>
            </asp:Panel>

            <!--Fuente de Poder-->
            <asp:Panel ID="pnlFuentePoder" runat="server" Visible="false">
                
                 <div class="auto-style3">

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <br />
                     <br />

                     <asp:Image ID="imgFuentePoder" runat="server" CssClass="auto-style4" Height="397px" />
                     <br />
                     <asp:FileUpload ID="FUFuentePoder" accept="image/*" runat="server" onchange="mostrar(this.id, document.getElementById('imgFuentePoder').id)" ForeColor="Black"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label20" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoFP" onchange="sinEspacios(this.value, this.id)" runat="server" Width="277px" required></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label23" runat="server" Text="Descripción: "></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtDescripcionFP" runat="server" onchange="sinEspacios(this.value, this.id)" Width="274px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label24" runat="server" Text="Con. Alimentación CPU:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtConAlCPU_FP"  onchange="sinEspacios(this.value, this.id)" runat="server" Width="277px" required></asp:TextBox>
                <br />
                
                <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label32" runat="server" Text="Con. Alimentación Placa:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtConAlPlaca_FP" runat="server" required Width="277px" onchange="sinEspacios(this.value, this.id)" min="0"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label33" runat="server" Text="Con. Alimentación GPU:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtConAlGPU_FP" runat="server" onchange="sinEspacios(this.value, this.id)" required Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label34" runat="server" Text="Potencia (w):"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPotenciaFP" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label35" runat="server" Text="Certificación:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    <asp:DropDownList ID="ddlCertificacionFP" runat="server" Height="16px" Width="283px" required>
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                        <asp:ListItem>80 Plus</asp:ListItem>
                        <asp:ListItem>80 Plus Bronce</asp:ListItem>
                        <asp:ListItem>80 Plus Plata</asp:ListItem>
                        <asp:ListItem>80 Plus Oro</asp:ListItem>
                        <asp:ListItem>80 Plus Platino</asp:ListItem>
                        <asp:ListItem>80 Plus Titanio</asp:ListItem>
                        <asp:ListItem>No tiene certificación</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label44" runat="server" Text="Precio:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                    <asp:TextBox ID="txtPrecioFP" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnIngresarFuentePoder" runat="server" OnClick="btnIngresarFuentePoder_Click" OnClientClick="return confirm ('¿Los campos son correctos?');" Text="Ingresar" />
                <br />
                    </div>
            </asp:Panel>

            <!--RAM-->
            <asp:Panel ID="pnlRAM" runat="server" Visible="false">
                
                 <div class="auto-style3">

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <br />
                     <br />

                     <asp:Image ID="imgRAM" runat="server" CssClass="auto-style4" Height="400px" />
                     <br />
                     <asp:FileUpload ID="FURAM" accept="image/*" runat="server" onchange="mostrar(this.id, document.getElementById('imgRAM').id)" ForeColor="Black"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label42" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoRAM" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label53" runat="server" Text="Tipo de RAM:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlTipoRAM" runat="server" Height="16px" required="" Width="285px">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                        <asp:ListItem>DDR2</asp:ListItem>
                        <asp:ListItem>DDR3</asp:ListItem>
                        <asp:ListItem>DDR4</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label54" runat="server" Text="Frecuencia RAM (Mhz):"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtFrecRAM" runat="server" min="2133" max="5100" required="" TextMode="Number" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label55" runat="server" Text="Memoria (Gb):"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtMemoriaRAM" runat="server" min="1" required="" TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                
                    &nbsp;&nbsp;
                    <asp:Label ID="Label52" runat="server" Text="Precio:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtPrecioRAM" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnIngresarRAM" runat="server" OnClick="btnIngresarRAM_Click" OnClientClick="return confirm ('¿Los campos son correctos?');" Text="Ingresar" />
                <br />
                    </div>
            </asp:Panel>

            <!--Disipador-->
            <asp:Panel ID="pnlDisipador" runat="server" Visible="false">
                
                 <div class="auto-style3">

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <br />
                     <br />

                     <asp:Image ID="imgDisipador" runat="server" CssClass="auto-style4" Height="400px" />
                     <br />
                     <asp:FileUpload ID="FUDisipador" accept="image/*" runat="server" onchange="mostrar(this.id, document.getElementById('imgDisipador').id)" ForeColor="Black"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label43" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoDisipador" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label56" runat="server" Text="Tipo de Disipador:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlTipoDisipador" runat="server" Height="16px" required="" Width="285px">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                        <asp:ListItem>Ventilador</asp:ListItem>
                        <asp:ListItem>Refrigeración Liquida</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label45" runat="server" Text="Socket:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:TextBox ID="txtSocketDisipador" runat="server" onchange="sinEspacios(this.value, this.id)" required="" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label46" runat="server" Text="Medida (mm²):"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                    <asp:TextBox ID="txtmedidaDisipador" runat="server" min="1" required="" TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                
                    &nbsp;&nbsp;
                    <asp:Label ID="Label48" runat="server" Text="Precio:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtPrecioDisipador" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnIngresarDisipador" runat="server" OnClick="btnIngresarDisipador_Click" OnClientClick="return confirm ('¿Los campos son correctos?');" Text="Ingresar" />
                <br />
                    </div>
            </asp:Panel>

            <!--Gabinete-->
            <asp:Panel ID="pnlGabinete" runat="server" Visible="false">
                
                 <div class="auto-style3">

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <br />
                     <br />

                     <asp:Image ID="imgGabinete" runat="server" CssClass="auto-style4" Height="400px" />
                     <br />
                     <asp:FileUpload ID="FUGabinete" accept="image/*" runat="server" onchange="mostrar(this.id, document.getElementById('imgGabinete').id)" ForeColor="Black"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label47" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoGabinete" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label58" runat="server" Text="Tipos de Placas&lt;br&gt;&nbsp;&nbsp;&nbsp; Compatibles:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="chkE_ATX_Gab" runat="server" Text="E-ATX" />
                    &nbsp;&nbsp;
                    <asp:CheckBox ID="chkATX_Gab" runat="server" Text="ATX" />
                    &nbsp;&nbsp;
                    <asp:CheckBox ID="chkMicro_ATX_Gab" runat="server" Text="Micro ATX" />
                    &nbsp;&nbsp;
                    <asp:CheckBox ID="chkITX_Gab" runat="server" Text="ITX" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label51" runat="server" Text="Medida max. GPU(mm²):"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtMedidaMaxGPU" runat="server" min="1" required="" TextMode="Number" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label59" runat="server" Text="Medida max.&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Disipador (mm²):"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtMedidaMaxDisipador" runat="server" min="1" required="" TextMode="Number" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label60" runat="server" Text="Huecos HDD: "></asp:Label>
&nbsp;
                    <asp:CheckBox ID="chkHDD" runat="server" onclick="ChkHDD()" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblcantidadHDD" runat="server" Text="Cantidad de &lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;compartimientos para HDD:" CssClass="CampoInvisible"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCantidadHDD" Enabled ="false" runat="server" min="1" required="" TextMode="Number" Width="277px" Text="0" CssClass="CampoInvisible"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label62" runat="server" Text="Huecos SSD: "></asp:Label>
                    &nbsp;&nbsp;
                    <asp:CheckBox ID="chkSSD" runat="server" onclick="ChkSSD()" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblcantidadSSD" runat="server" Text="Cantidad de &lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;compartimientos para SSD:" CssClass="CampoInvisible"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCantidadSSD" runat="server" min="1" required="" TextMode="Number" Width="277px" Enabled="false" Text="0" CssClass="CampoInvisible"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label64" runat="server" Text="Color:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtColorGabinete" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required=""></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label65" runat="server" Text="Iluminación:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:TextBox ID="txtIluminacionGabinete" runat="server" onchange="sinEspacios(this.value, this.id)" required="" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label66" runat="server" Text="Ventilador preinstalado: "></asp:Label>
                    &nbsp;
                    <asp:CheckBox ID="chkventPreins" onclick="chkVenPreins()" runat="server" />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblCaracteristicasVPreins" runat="server" Text="Caracteristicas del&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; ventilador:" CssClass="CampoInvisible"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCaracteristicasVentiladorPreinstalado" runat="server" Enabled ="false" onchange="sinEspacios(this.value, this.id)" required="" Width="277px" CssClass="CampoInvisible"></asp:TextBox>
                    &nbsp;<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label57" runat="server" Text="Precio:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtPrecioGabinete" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnIngresarGabinete" runat="server" OnClientClick="return confirm ('¿Los campos son correctos?');" Text="Ingresar" OnClick="btnIngresarGabinete_Click" />
                <br />
                    </div>
            </asp:Panel>

            <!--Disco-->
            <asp:Panel ID="pnlDisco" runat="server" Visible="false">
                
                 <div class="auto-style3">

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <br />
                     <br />

                     <asp:Image ID="imgDisco" runat="server" CssClass="auto-style4" Height="400px" />
                     <br />
                     <asp:FileUpload ID="FUDisco" accept="image/*" runat="server" onchange="mostrar(this.id, document.getElementById('imgDisco').id)" ForeColor="Black"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label49" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoDisco" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label50" runat="server" Text="Tipo de Almacenamiento:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlTipoDisco" runat="server" Height="16px" required="" Width="285px">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                        <asp:ListItem>HDD</asp:ListItem>
                        <asp:ListItem>SSD</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label63" runat="server" Text="Cantidad de memoria (Gb):"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtMemoriaDisco" runat="server" min="10" required="" TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                
                    &nbsp;&nbsp;
                    <asp:Label ID="Label67" runat="server" Text="Precio:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtPrecioDisco" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnIngresarDisco" runat="server" OnClientClick="return confirm ('¿Los campos son correctos?');" Text="Ingresar" OnClick="btnIngresarDisco_Click" />
                <br />
                    </div>
            </asp:Panel>

            <!--Equipo Preestablecido-->
            <asp:Panel ID="pnlEquipo" runat="server" Visible="false">
                
                 <div class="auto-style3">

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <br />
                     <br />

                     <asp:Image ID="imgEquipo" runat="server" CssClass="auto-style4" Height="400px" />
                     <br />
                     <asp:FileUpload ID="FUEquipo" accept="image/*" runat="server" onchange="mostrar(this.id, document.getElementById('imgEquipo').id)" ForeColor="Black"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label61" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoEquipo" runat="server" Width="277px" onchange="sinEspacios(this.value, this.id)" required></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblCategoriaE" runat="server" Text="Categoria:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
                    <asp:DropDownList ID="ddlCategoriaE" runat="server" DataMember="DefaultView" Height="16px" OnSelectedIndexChanged="ddlProcesadorE_SelectedIndexChanged" required="" Width="285px">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                        <asp:ListItem>Oficina</asp:ListItem>
                        <asp:ListItem>Diseño/Producción</asp:ListItem>
                        <asp:ListItem>Gamer</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblCpuE" runat="server" Text="Procesador:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:DropDownList ID="ddlProcesadorE" runat="server" Height="16px" required="" Width="285px" AutoPostBack="True" DataMember="DefaultView" DataSourceID="SqlDSProcesador" DataTextField="Nombre_Producto" DataValueField="id_Procesador" OnSelectedIndexChanged="ddlProcesadorE_SelectedIndexChanged">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp; &nbsp;<asp:Label ID="Label69" runat="server" Text="Placa:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:DropDownList ID="ddlPlacaE" runat="server" Height="16px" required="" Width="285px" AutoPostBack="True" DataSourceID="SqlDSPlaca" DataTextField="Nombre_Producto" DataValueField="id" OnSelectedIndexChanged="ddlPlacaE_SelectedIndexChanged">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp; &nbsp;<asp:Label ID="Label71" runat="server" Text="RAM:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:DropDownList ID="ddlRAME" runat="server" Height="16px" required="" Width="285px" AutoPostBack="True" DataSourceID="SqlDSRAM" DataTextField="Nombre_Producto" DataValueField="id">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp; &nbsp;<asp:Label ID="Label72" runat="server" Text="Disipador:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlDisipadorE" runat="server" Height="16px" required="" Width="285px" AutoPostBack="True" DataSourceID="SqlDSDisipador" DataTextField="Nombre_Producto" DataValueField="id" OnSelectedIndexChanged="ddlDisipadorE_SelectedIndexChanged">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp; &nbsp;<asp:Label ID="Label73" runat="server" Text="T. Video:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlGPUE" runat="server" Height="16px" required="" Width="285px" AutoPostBack="True" DataSourceID="SqlDSGPU" DataTextField="Nombre_Producto" DataValueField="id" OnSelectedIndexChanged="ddlGPUE_SelectedIndexChanged">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp; &nbsp;<asp:Label ID="Label74" runat="server" Text="Fuente de Poder:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:DropDownList ID="ddlPSUE" runat="server" Height="16px" required="" Width="285px" AutoPostBack="True" DataSourceID="SqlDSFuentePower" DataTextField="Nombre_Producto" DataValueField="ID">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp; &nbsp;<asp:Label ID="Label75" runat="server" Text="Disco Duro:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlDiscoDuroE" runat="server" Height="16px" required="" Width="285px" AutoPostBack="True" DataSourceID="SqlDSDiscoDuro" DataTextField="Nombre_Producto" DataValueField="id_Disco" OnSelectedIndexChanged="ddlDiscoDuroE_SelectedIndexChanged">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp; &nbsp;<asp:Label ID="Label76" runat="server" Text="Gabinete:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:DropDownList ID="ddlGabineteE" runat="server" Height="16px" required="" Width="285px" DataSourceID="SqlDSGabinete" DataTextField="Nombre_Producto" DataValueField="id">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label77" runat="server" Text="Otras caracteristicas: "></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCaracteristicasAdicionalesE" runat="server" Height="146px" onchange="sinEspacios(this.value, this.id)" TextMode="MultiLine" Width="382px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Label ID="Label70" runat="server" Text="Precio:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtPrecioE" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
                <br />
                <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnIngresarE" runat="server" OnClientClick="return confirm ('¿Los campos son correctos?');" Text="Ingresar" OnClick="btnIngresarE_Click" />
                <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" InsertCommand="InsertarEquipo" SelectCommand="select * from Equipos" InsertCommandType="StoredProcedure">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="ddlProcesadorE" DefaultValue="" Name="Procesador" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlPlacaE" Name="Placa" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlRAME" Name="RAM" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlDisipadorE" Name="Disipador" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlGPUE" DbType="Int32" DefaultValue="" Name="TarjetaVideo" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlPSUE" Name="FuentePoder" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlDiscoDuroE" Name="DiscoDuro" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlGabineteE" Name="Gabinete" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlCategoriaE" Name="Categoria" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="txtCaracteristicasAdicionalesE" Name="CaracteristicasExtra" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtNombreProductoEquipo" DefaultValue="" Name="Nombre_Prod" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtPrecioE" Name="PrecioCLP" PropertyName="Text" />
                            <asp:ControlParameter ControlID="FUEquipo" Name="Imagen" PropertyName="FileBytes" />
                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSGabinete" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="CargarGabinete" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlPlacaE" Name="idPlaca" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlGPUE" Name="idGPU" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlDisipadorE" Name="idDisipador" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlDiscoDuroE" Name="idDisco" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSDiscoDuro" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT DiscoDuro.id_Disco, Producto.Nombre_Producto FROM DiscoDuro INNER JOIN Producto ON DiscoDuro.idProd = Producto.ID_Producto"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSGPU" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT Tarjeta_de_Video.id, Producto.Nombre_Producto FROM Tarjeta_de_Video INNER JOIN Producto ON Tarjeta_de_Video.idProd = Producto.ID_Producto"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSDisipador" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT Disipador.id, Producto.Nombre_Producto FROM Disipador INNER JOIN Producto ON Disipador.idProd = Producto.ID_Producto INNER JOIN Procesador ON Disipador.socket = Procesador.socket WHERE (Procesador.id_Procesador = @Procesador)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProcesadorE" Name="Procesador" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSRAM" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT r.id, p.Nombre_Producto FROM Placa AS pl INNER JOIN RAM AS r ON pl.tipoRam = r.tipoRam INNER JOIN Producto AS p ON r.idProd = p.ID_Producto WHERE (r.frecuenciaRAM_Mhz BETWEEN pl.frecuenciaMinRAM_Mhz AND pl.frecuenciaMaxRAM_Mhz) AND (pl.id = @id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlPlacaE" DefaultValue="" Name="id" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSPlaca" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT Placa.id, Producto.Nombre_Producto FROM Placa INNER JOIN Producto ON Placa.idProd = Producto.ID_Producto INNER JOIN Procesador ON Placa.socket = Procesador.socket AND Placa.Chipset = Procesador.Chipset WHERE (Procesador.id_Procesador = @idProcesador)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProcesadorE" Name="idProcesador" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSFuentePower" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT p.Nombre_Producto, pw.ID FROM Fuente_de_Poder AS pw INNER JOIN Producto AS p ON pw.idProd = p.ID_Producto INNER JOIN Procesador AS cpu ON pw.conAlimentacionPr = cpu.conAlimentacionP INNER JOIN Placa AS pl ON pw.conAlimentacionPl = pl.conAlimentacion INNER JOIN Tarjeta_de_Video AS gpu ON pw.conAlimentacionG = gpu.conAlimentacion WHERE (CONVERT (int, REPLACE(pw.PotenciaPSU, ' W', '')) &gt;= cpu.tpdProc + gpu.tpdGPU + 151) AND (cpu.id_Procesador = @Procesador) AND (gpu.id = @GPU)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProcesadorE" Name="Procesador" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddlGPUE" Name="GPU" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDSProcesador" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT Procesador.id_Procesador, Producto.Nombre_Producto FROM Procesador INNER JOIN Producto ON Procesador.idProd = Producto.ID_Producto"></asp:SqlDataSource>
                    </div>
            </asp:Panel>

        </div>
    </form>
</body>
</html>




<script src="Scripts/jquery-3.5.1.min.js"></script>





<script>
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

    function sinEspacios(texto, identificador) {
        document.getElementById(identificador).value = texto.trim();
    }

    function chkProcesador() {
        var checkBox = document.getElementById("chkGPUIntegrada");
        var Label = document.getElementById("lblFrecGpuIntegrada");
        var text = document.getElementById("txtFrecGPUIntegrada");
        if (checkBox.checked == true) {
            Label.style.display = "initial";
            text.style.display = "initial";
            text.disabled = false;
        } else {
            text.style.display = "none";
            Label.style.display = "none";
            text.disabled = true;  
        }
    }

    function ChkHDD() {
        var checkBox = document.getElementById("chkHDD");
        var Label = document.getElementById("lblcantidadHDD");
        var text = document.getElementById("txtCantidadHDD");
        if (checkBox.checked == true) {
            Label.style.display = "initial";
            text.style.display = "initial";
            text.disabled = false;
        } else {
            text.style.display = "none";
            Label.style.display = "none";
            text.disabled = true;
        }
    }

    function ChkSSD() {
        var checkBox = document.getElementById("chkSSD");
        var Label = document.getElementById("lblcantidadSSD");
        var text = document.getElementById("txtCantidadSSD");
        if (checkBox.checked == true) {
            Label.style.display = "initial";
            text.style.display = "initial";
            text.disabled = false;
        } else {
            text.style.display = "none";
            Label.style.display = "none";
            text.disabled = true;
        }
    }

    function chkVenPreins() {
        var checkBox = document.getElementById("chkventPreins");
        var Label = document.getElementById("lblCaracteristicasVPreins");
        var text = document.getElementById("txtCaracteristicasVentiladorPreinstalado");
        if (checkBox.checked == true) {
            Label.style.display = "initial";
            text.style.display = "initial";
            text.disabled = false;
        } else {
            text.style.display = "none";
            Label.style.display = "none";
            text.disabled = true;
        }
    }

    //Funcion con JQuery .html() para cambiar los valores del label que muestra el valor minimo admitido por la placa para la frec ram
    function RangoMinRAMPl(val) {
        $("#lblRangominPl").html(val+ "Mhz");
    }

    //Funcion nativa con innerHTML para cambiar los valores del label que muestra el valor maximo admitido por la placa para la frec ram
    function RangoMaxRAMPl(val) {
        document.getElementById("lblRangoMaxPl").innerHTML = val + " Mhz";
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

