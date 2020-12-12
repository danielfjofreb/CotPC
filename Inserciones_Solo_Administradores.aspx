<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inserciones_Solo_Administradores.aspx.cs" Inherits="CotPc.Inserciones_Solo_Administradores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 853px;
        }
        .auto-style3 {
            width:40%;
            float: right;
            
        }
        .auto-style4 {
            bottom:40%;
            align-content:center;
        }
        .auto-style5 {
            height: 82px;
        }
        .CampoInvisible{
            display: none;

        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Inserte Componentes"></asp:Label>
        </p>
        <div class="auto-style5">
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Seleccione: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style1" Height="16px" Width="391px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                <asp:ListItem>Procesador</asp:ListItem>
                <asp:ListItem>Placa</asp:ListItem>
                <asp:ListItem>Tarjeta de Video</asp:ListItem>
                <asp:ListItem>Fuente de Poder</asp:ListItem>
                <asp:ListItem>RAM</asp:ListItem>
                <asp:ListItem>Disipador</asp:ListItem>
                <asp:ListItem>Gabinete</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <!--Procesador-->
            <asp:Panel ID="pnlProcesador" runat="server" Visible="false">
                
                 <div class="auto-style3">

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <br />
                     <br />

                     <asp:Image ID="imgPr" runat="server" CssClass="auto-style4" Height="397px" />
                     <br />
                     <asp:FileUpload ID="FUProcesador" accept="image/*" runat="server" onchange="mostrarPr()" ForeColor="Black"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoPr" runat="server" Width="277px" required></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Text="Marca: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:DropDownList ID="ddlMarcaPr" runat="server" Height="16px" required Width="285px">
                        <asp:ListItem Value="">---Seleccione---</asp:ListItem>
                        <asp:ListItem>Intel</asp:ListItem>
                        <asp:ListItem>AMD</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Text="Modelo:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtModeloPr" runat="server" Width="277px" required></asp:TextBox>
                <br />
                
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" Text="Generación"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtGeneracionPr" runat="server" Width="277px" required></asp:TextBox>
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
                <asp:TextBox ID="txtSocketPr" runat="server" Width="277px" required></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="Label9" runat="server" Text="Chipset"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtChipsetPr" runat="server" required="" Width="277px"></asp:TextBox>
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtTDPProcesador" runat="server" required="" Width="277px" min="0" TextMode="Number"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label13" runat="server" Text="Conectores de&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Alimentación:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtconAlimentacionPr" runat="server" required="" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label15" runat="server" Text="Precio:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                    <asp:TextBox ID="txtPrecioPr" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
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
                     <asp:FileUpload ID="FUPlaca" accept="image/*" runat="server" onchange="mostrarPl()" ForeColor="Black"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label11" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoPl" runat="server" Width="277px" required></asp:TextBox>
                <br />
                <br />
                    &nbsp; &nbsp;
                <asp:Label ID="Label18" runat="server" Text="Tipo de Placa:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="rbE_ATX_Placa" runat="server" GroupName="TipoPlaca" Text="E_ATX" ToolTip="E_ATX" />
&nbsp;
                    <asp:RadioButton ID="rbATX_Placa" runat="server" GroupName="TipoPlaca" Text="ATX" ToolTip="ATX" />
&nbsp;
                    <asp:RadioButton ID="rbMicro_ATX_Placa" runat="server" GroupName="TipoPlaca" Text="Micro_ATX" ToolTip="Micro_ATX" />
&nbsp;
                    <asp:RadioButton ID="rbITX_Placa" runat="server" GroupName="TipoPlaca" Text="ITX" ToolTip="ITX" />
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label21" runat="server" Text="Socket"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txtSocketPl" runat="server" Width="277px" required></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="Label22" runat="server" Text="Chipset"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtChipsetPl" runat="server" required="" Width="277px"></asp:TextBox>
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtconA_Placa" runat="server" required Width="277px"></asp:TextBox>
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
                     <asp:FileUpload ID="FUGPU" accept="image/*" runat="server" onchange="mostrarGPU()" ForeColor="Black"/>
                     <br />
                </div>
                <div class="auto-style2">
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label16" runat="server" Text="Nombre del Producto: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtNombreProductoGPU" runat="server" Width="277px" required></asp:TextBox>
                <br />
                <br />
                    &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label17" runat="server" Text="Marca: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtMarcaGPU" runat="server" Width="274px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label19" runat="server" Text="Modelo:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtModeloGPU" runat="server" Width="277px" required></asp:TextBox>
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
                    <asp:TextBox ID="txtMedidaGPU" runat="server" min="0" required="" TextMode="Number" Width="277px"></asp:TextBox>
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtPSURecomendadaGPU" runat="server" required="" Width="277px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label37" runat="server" Text="Conectores de&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; Alimentación:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtconAlGPU" runat="server" required="" Width="277px"></asp:TextBox>
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

        </div>
    </form>
</body>
</html>

<script type="text/javascript">
    function mostrarPr(){
        var archivo = document.getElementById("FUProcesador").files[0];
        if (!(/\.(jpg|jpeg|ico|svgz|avif|bmp|svg|png|gif)$/i).test(archivo.name)) {
            alert('El archivo a adjuntar no es una imagen');
            limpiarImagen(document.getElementById("FUProcesador"));
            return;
        }
        var reader = new FileReader();
        if (EUProcesador) {
            reader.readAsDataURL(archivo);
            reader.onloadend = function () {
            document.getElementById("imgPr").src = reader.result;
            }
         }
    }
    function limpiarImagen(ctrl) {
        try {
            ctrl.value = null;
        } catch (ex) { }
        if (ctrl.value) {
            ctrl.parentNode.replaceChild(ctrl.cloneNode(true), ctrl);
        }
    }
    function mostrarPl() {
        var archivo = document.getElementById("FUPlaca").files[0];
        if (!(/\.(jpg|jpeg|ico|svgz|avif|bmp|svg|png|gif)$/i).test(archivo.name)) {
            alert('El archivo a adjuntar no es una imagen');
            limpiarImagen(document.getElementById("FUPlaca"));
            return;
        }
        var reader = new FileReader();
        if (FUPlaca) {
            reader.readAsDataURL(archivo);
            reader.onloadend = function () {
                document.getElementById("imgPl").src = reader.result;
            }
        }
    }

    function mostrarGPU() {
        var archivo = document.getElementById("FUGPU").files[0];
        if (!(/\.(jpg|jpeg|ico|svgz|avif|bmp|svg|png|gif)$/i).test(archivo.name)) {
            alert('El archivo a adjuntar no es una imagen');
            limpiarImagen(document.getElementById("FUGPU"));
            return;
        }
        var reader = new FileReader();
        if (FUGPU) {
            reader.readAsDataURL(archivo);
            reader.onloadend = function () {
                document.getElementById("imgGPU").src = reader.result;
            }
        }
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

    function RangoMinRAMPl(val) {
        document.getElementById("lblRangominPl").innerHTML = val+" Mhz";
    }

    function RangoMaxRAMPl(val) {
        document.getElementById("lblRangoMaxPl").innerHTML = val + " Mhz";
    }
</script>

