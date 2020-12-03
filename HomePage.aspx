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
                         <li><a href="Comenzar.aspx" class="smoothScroll">Comienza a armar!</a></li>
                         <li><a href="#feature" class="smoothScroll">Compara</a></li>
                         <li><a href="#about" class="smoothScroll">Combinaciones predefinidas</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                         
                    </ul>
               </div>

          </div>
     </section>
    
        
        <section id="home" data-stellar-background-ratio="0.5">
          <div class="overlay"></div>
          <div class="container">
               <div>

                    <div class="col-md-offset-3 col-md-6 col-sm-12">
                         <div class="home-info">
                              <h3>Bienvenidos a nuestro sitio</h3>
                              <h1>El pc de tus sueños se puede hacer realidad!</h1>
                         </div>
                    </div>

               </div>
          </div>
     </section>
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