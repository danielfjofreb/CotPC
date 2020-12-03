<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comenzar.aspx.cs" Inherits="CotPc.Buscar" %>

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
        .arma_centro_top {
            float: left;
            width: 100%;
            
        }
        .arma_intel {
        cursor: pointer;
        float: left;
        width: 50%;
        height: auto;
        text-align: right;
        }
        span{
            color:firebrick;
            font-family: "Trebuchet MS", "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans";
            font-size: 10px;
            text-align: right;
        }
        .espan{
            color:firebrick;
            font-family: "Trebuchet MS", "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans";
            font-size: 10px;
            text-align: right;
        }
        .arma_amd {
        cursor: pointer;
        float: left;
        width: 50%;
        height: auto;
        text-align: left;
        }
        .txtAzure{
            color:azure;
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
                    <asp:HyperLink CssClass="navbar-brand" runat="server" NavigateUrl="~/HomePage.aspx">Arma tu PC!</asp:HyperLink>
                </div>

               <!-- MENU LINKS -->
               <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                         <li><asp:Hyperlink ID="HPLAdd" runat="server" CssClass="smoothScroll" Enabled="False" NavigateUrl="~/Comenzar.aspx">Busca tus componentes</asp:Hyperlink></li>
                         <li><asp:HyperLink ID="HPLBuscar" runat="server" CssClass="smoothScroll" Enabled="False" NavigateUrl="~/Buscar.aspx">Compara</asp:HyperLink></li>
                         <li><asp:HyperLink ID="HPLActElim" runat="server" CssClass="smoothScroll" Enabled="False" NavigateUrl="~/Editar.aspx">Combinaciones predefinidas</asp:HyperLink></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                         
                    </ul>
               </div>

          </div>
     </section>

   
        <section data-stellar-background-ratio="0.5">
          <div class="overlay">
              
            </div>
          <div class="container">
                    <div class="col-md-offset-3 col-md-6 col-sm-12">
                              <h3 class="txtAzure">Comencemos a armar tu pc</h3>
                             <p class =" txtAzure">Primero vamos a elegir la plataforma en la que quieres construir tu pc</p>
                             <div class="arma_centro_top">
                                 <div class="arma_intel">
                                     <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/arma_intel.svg" />
                                 </div>
                                 <div class="arma_amd">
                                     <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/arma_AMD.svg" />
                                 </div>
                             </div>
                    </div>
          </div>
     </section>
        <asp:Panel ID="Panel1" runat="server">
            <div class="container">
                <div class="col-md-offset-3 col-md-6 col-sm-12">
                    <h4>
                        <b>Procesador (CPU)</b>
					    <span>CAMPO OBLIGATORIO</span>              		
                    </h4>
                    <asp:DropDownList ID="ddlProcesador" runat="server">
                        <asp:ListItem Value="-1">Seleccione su procesador</asp:ListItem>
                    </asp:DropDownList>

                    <h4>
                        <b>Placa Madre</b> 
					    <span>CAMPO OBLIGATORIO</span>              		
                    </h4>
                    <asp:DropDownList ID="ddlPlacaMadre" runat="server">
                        <asp:ListItem Value="-1">Seleccione su placa madre</asp:ListItem>
                    </asp:DropDownList>
                    <h4>
                        <b>Memoria RAM 1</b> 
					    <span>CAMPO OBLIGATORIO</span>              		
                    </h4>
                    <asp:DropDownList ID="ddlRAM1" runat="server">
                        <asp:ListItem Value="-1">Seleccione 1ra RAM</asp:ListItem>
                    </asp:DropDownList>
                    <h4>
                        <b>Memoria RAM 2</b> 
					    <span>(OPCIONAL)</span>              		
                    </h4>
                    <asp:DropDownList ID="ddlRAM2" runat="server">
                        <asp:ListItem Value="-1">Seleccione 2da RAM</asp:ListItem>
                    </asp:DropDownList>
                    <h4>
                        <b>Tarjeta Gráfica</b> 
					    <asp:Label ID="lblGrafica" runat="server" CssClass="espan" Text="CAMPO OBLIGATORIO"></asp:Label>
                    </h4>
                    <asp:DropDownList ID="ddlGrafica" runat="server">
                        <asp:ListItem Value="-1">Seleccione Tarjeta Gráfica</asp:ListItem>
                    </asp:DropDownList>
                    <h4>
                        <b>Tarjeta de Red</b> 
					    <span>(OPCIONAL)</span> 
                    </h4>
                    <asp:DropDownList ID="ddlRed" runat="server">
                        <asp:ListItem Value="-1">Seleccione Tarjeta de Red</asp:ListItem>
                    </asp:DropDownList>
                </div>  
        </div>
        </asp:Panel>
        
    </form>
    <footer>
        <div class="container">
            <h3>Taller Integrado de Proyectos de Programación</h3>
            <h4>Daniel Jofré / Álvaro Parraguez</h4>
            <h4>Programación y Analisis de Sistemas (PEV)</h4>
        </div>
    </footer>
</body>
</html>