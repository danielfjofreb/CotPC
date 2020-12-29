<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="CotPc.HomePAg" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
     <link rel="stylesheet" href="css/owl.carousel.css"/>
     <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
     <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="stylesheet" href="css/tooplate-style.css"/>
    <style>
        html {
            scroll-behavior: smooth; /*Comenta esta l�nea (o dale el valor 'auto' a scroll behavior ) para probar la diferencia con y sin scroll suavizado*/
        }

        .menu {
            position: fixed;
            left: 42%;
            font-size: 70px;
            top: 87%;
            width: 20%
        }
        #slide2{
            background-image:url(/Images/Pc1.jpg);
            background-size:cover;
            width:1980px;
            height:800px;

        }
        #slide3{
            background-image:url(/Images/pc2.jpg);
            background-size:cover;
            width:1980px;
            height:800px;

        }
        #slide4{
            background-image:url(/Images/pc3.jpg);
            background-size:cover;
            width:1980px;
            height:800px;

        }
        #slide5{
            background-image:url(/Images/pc4.jpg);
            background-size:cover;
            width:1980px;
            height:800px;

        }

        .auto-style1 {
            width: 25%;
            position: absolute;
            left: 40%;
            top: 30%;
            color: azure;

        }
        .auto-style2 {
            width: 129%;
            position: absolute;
            left: 56%;
            top: 44%;
            color: azure;
        }

        .auto-style3 {
            margin-top: 80%;
            margin-left: 80%;
            width: 100%;
            color: azure;
        }
        .oscurito{
            background: linear-gradient(to right, #292E49, #536976);
            opacity: 0.9;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        #sl1{
            padding-top:0%;
            padding-bottom:0%
        }
        #sl2{
            padding-top:0%;
            padding-bottom:0%;
        }
        #sl3{
            padding-top:0%;
            padding-bottom:0%;
        }
        #sl4{
            padding-top:0%;
            padding-bottom:0%;
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
    .botonImagenes{
        padding-top:35%;
    }
    .botonImagenes2{
        padding-top:60%;
        padding-left: 40%;
        width: 141%;
    }
    .imgbtn{
        margin:20px;
    }
    .imgbtn2{
        margin:3px;
    }
    .spanito{
        color:ghostwhite;
        margin:11%;
    }
       .divconfijo {
            position: fixed;
            z-index: 1000;
            background-color: darkgray;
            width: 18%;
            height: 34%;
            top: 41%;
            text-align:center;
            left: 1%;
            border-radius: 50%;
        }
        .divsinfijo {
            position: absolute;
            z-index: 1000;
            background-color: darkgray;
            width: 22%;
            height: 46%;
            top: 55%;
            text-align:center;
            left: 1%;
            border-radius: 50%;
        }
        .Ir {
            margin-top: 20%;
            margin-left: 83%;
            width: 117%;
            color: azure;
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
                    <asp:HyperLink CssClass="navbar-brand" runat="server" NavigateUrl="~/HomePage.aspx">Cotiza tu PC!</asp:HyperLink>
                </div>

               <!-- MENU LINKS -->
               <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                         <asp:HiddenField ID="categoria" runat="server" />
                        <asp:HiddenField ID="procesador" runat="server" />
                        <asp:HiddenField ID="Presupuesto" runat="server" Value="0"/>
                    </ul>
               </div>

          </div>
     </section>
    
        
        <section id="home" data-stellar-background-ratio="0.5">
          <div class="overlay" id="slide1"></div>
          <div class="container">
               <div>

                    <div class="col-md-offset-3 col-md-6 col-sm-12">
                         <div class="home-info">
                              <h3>Bienvenidos a nuestro sitio</h3>
                              <h1>Encontrar el pc de tus sueños se puede hacer realidad!</h1>
                         </div>
                    </div>

               </div>
          </div>
     </section>

    <section id="sl1">
        <div id="slide2">
                <div class="oscurito"></div>
                        <div style="position:absolute; padding-left:23%">
                            <div class="auto-style1">
                                <h3>¿Para que usará su pc?</h3>
                            </div>
                            
                                
                                <div id ="udpCategoria" class="botonImagenes">

                                        

                                            <asp:ImageButton ID="imgbtnOficina" CssClass="imgbtn" runat="server" ImageUrl="~/Images/Oficina.png" Width="250" Height="160px" OnClick="imgbtnOficina_Click"/>

                                            <asp:ImageButton ID="imgbtnDisenio" CssClass="imgbtn" runat="server" Width="250" ImageUrl="~/Images/Disenio.jpg" OnClick="imgbtnDisenio_Click" />

                                            <asp:ImageButton ID="imgbtnGamer" CssClass="imgbtn" runat="server" Width="250" Height="163px" ImageUrl="~/Images/gamerxd.gif" OnClick="imgbtnGamer_Click" />

                                        <div style="width:104%">
                                            <span class="spanito">Trabajo/Oficina</span>
                                            <span class="spanito" style="margin-left:9%">Diseño/Producción</span>
                                            <span class="spanito" style="margin:11%">Jugar!</span>
                                        </div>

                                        
                                        <asp:Panel ID="pnlslide2" style="position:absolute; margin-left:63%; margin-top:4%" runat="server" Visible="true">
                                            <a href="#slide3" style="color:aqua;" id="omitir1"><h3><b>No importa, sigamos</b></h3></a>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlLimpiarSeleccion1" style="position:absolute; margin-left:63%; margin-top:7%" runat="server" Visible="false">
                                            <input type="button" id="btnLimpiarCategoria" runat="server" value="Limpiar selección" onserverclick="btnLimpiarCategoria_ServerClick" style="color:aqua; Background:transparent;" />
                                        </asp:Panel>

                                        

                                </div>
                                <div id="divquesigue" class="divsinfijo">
                                    <h4 style="margin-top:15%">Usted ha seleccionado:</h4>
                                    <asp:Label ID ="lblSelecciónCategoria" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID ="lblPreferenciaPC" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID = "lblPresupuesto" runat="server"></asp:Label>
                                </div>
                     </div> 
            </div>
      </section>

    <section id="sl2" data-stellar-background-ratio="0.5">
        <div id="slide3">
                <div class="oscurito"></div>
                        <div style="position:absolute; padding-left:23%">
                            <div class="auto-style1">
                                <h3>¿Cual es su preferencia?</h3>
                            </div>
                            
                                <asp:Panel ID ="Panel1" runat="server" class="botonImagenes2">
                                    
                                        

                                            <asp:ImageButton ID="imgbtnIntel" CssClass="imgbtn2" runat="server" ImageUrl="~/Images/arma_intel.svg" Width="250" Height="160px" OnClick="imgbtnIntel_Click" />

                                            <asp:ImageButton ID="imgbtnAMD" CssClass="imgbtn2" runat="server" Width="250" Height="160px" ImageUrl="~/Images/arma_amd.svg" OnClick="imgbtnAMD_Click" />
                                        <asp:Panel ID="pnlslide3" style="position:absolute; margin-left:63%; margin-top:10%" runat="server">
                                            <a href="#slide4" style="color:aqua;"><h3><b>No importa, sigamos</b></h3></a>
                                        </asp:Panel>
                                           <asp:Panel ID="pnlLimpiarSeleccion2" style="position:absolute; margin-left:63%; margin-top:7%" runat="server" Visible="false">
                                            <input type="button" id="btnLimpiarPreferencia" runat="server" value="Limpiar selección" onserverclick="btnLimpiarPreferencia_ServerClick" style="color:aqua; Background:transparent;" />
                                        </asp:Panel>
                                    
                                </asp:Panel>
                            </div>
            </div>
      </section>

        <section id="sl3" data-stellar-background-ratio="0.5">
        <div id="slide4">
                <div class="oscurito"></div>
                        <div style="position:absolute; padding-left:23%">
                            <div class="auto-style2">
                                <h3>Aqui puedes ingresar el máximo que estas dispuesto a gastar</h3>
                            </div>
                            
                                <asp:Panel ID ="Panel2" runat="server" style="margin-top: 113%;margin-left: 70%;width: 117%;color:azure;">
                                    <h4>Valor (en pesos chilenos)</h4>
                                    <asp:TextBox ID="txtPresupuesto" runat="server" TextMode="Number" Text="0"  min="0" style="width: 146%;font-size: x-large;font-family: -webkit-body; color:black" AutoPostBack="True" OnTextChanged="txtPresupuesto_TextChanged"></asp:TextBox>
                                    <div style="position:absolute;width: 48%; top: 110%;left: 95%;">
                                        <p style="color:darkgray;">* Si asi lo prefiere, puede dejar en 0 para ver todo el catálogo de equipos, con las especificaciones anteriores, si es que eligió alguna</p>
                                    </div>
                                        <asp:Panel ID="Panel3" style="    position: absolute;margin-left: 63%;margin-top: 23%;" runat="server">
                                            <a href="#slide5" style="color:aqua;"><h3><b>Continuar</b></h3></a>
                                        </asp:Panel>
                                    
                                </asp:Panel>
                            </div>
            </div>
      </section>



        <section id="sl4" data-stellar-background-ratio="0.5">
        <div id="slide5">
                <div class="oscurito"></div>
                        <div style="position:absolute; padding-left:23%">
                            <div class="auto-style3">
                                <h3>Veamos que tenemos para ti!</h3>
                            </div>
                            
                                <asp:Panel ID ="Panel4" runat="server" class="Ir">
                                    <asp:Button ID="btnir" Text="Vamos!" runat="server" BackColor="#0098A2" Width="300px" Height="250px" BorderStyle="Double" BorderWidth="10px" style="border-radius:40.5px" OnClick="btnir_Click"/>
                                </asp:Panel>
                            </div>
            </div>
      </section>



    <div class="menu">

            <a href="#slide1"><b>°</b></a>

            <a href="#slide2"><b>°</b></a>
            
            <a href="#slide3"><b>°</b></a>
            
            <a href="#slide4"><b>°</b></a>
            
            <a href="#slide5"><b>°</b></a>

            <a href="#slide6"><b>°</b></a>
     </div>

    </form>
    <footer>
        <div class="container">
            <h3 id="slide6">Taller Integrado de Proyectos de Programación</h3>
            <h4>Daniel Jofré / Álvaro Parraguez</h4>
            <h4>Programación y Analisis de Sistemas (PEV)</h4>
        </div>
    </footer>
</body>
</html>




<script src="Scripts/jquery-3.5.1.min.js"></script>

<script>
    $(document).ready(function () {
        $(window).on('scroll', function () {
            if ($(window).scrollTop() > 727) {
                $('#divquesigue').addClass('divconfijo');
                $('#divquesigue').removeClass('divsinfijo');
            } else {
                $('#divquesigue').removeClass('divconfijo');
                $('#divquesigue').addClass('divsinfijo');
            }
        });

    });
</script>

<script src="js/SoloEnteros.js"></script>
<script>
    new CampoNumerico('#txtPresupuesto');
</script>