<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comenzar.aspx.cs" Inherits="CotPc.Buscar" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap.css"/>
     <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
     <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="stylesheet" href="css/tooplate-style.css"/>

    <style type="text/css">
        html {
        scroll-behavior: smooth;
    }
        
        

        .txtAzure{
            color:azure;
        }

        .auto-style1 {
            margin-left: 202px;
            margin-top: 117px;
        }


        .auto-style3 {
            margin-left: 371px;
            margin-top: 57px;
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

          </div>
     </section>

   
        <section data-stellar-background-ratio="0.5">
          <div class="overlay">
              
              <asp:SqlDataSource ID="SqlDSEquipoSeleccionado" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="select 
p.ID_Producto 'ID',
p.Nombre_Producto 'Equipo',
Procesador = (SELECT p.Nombre_Producto FROM Procesador cpu, Producto p, Equipos e where p.ID_Producto = cpu.idProd and cpu.id_Procesador = e.Procesador and e.idProd = @ID),
e.Categoria,
Placa = (Select p.Nombre_Producto FROM Placa pl, Producto p, Equipos e where p.ID_Producto = pl.idProd and pl.id = e.Placa and e.idProd = @ID),
'Tarjeta de Video' = (SELECT Nombre_Producto FROM Tarjeta_de_Video gpu, Producto p, Equipos e where p.ID_Producto = gpu.idProd and gpu.id = e.Tarjeta_de_Video and e.idProd = @ID),
RAM = (SELECT Nombre_Producto FROM RAM r, Producto p, Equipos e where p.ID_Producto = r.idProd and r.id = e.RAM and e.idProd = @ID),
'Fuente de Poder' = (SELECT Nombre_Producto FROM Fuente_de_Poder f, Producto p, Equipos e where p.ID_Producto = f.idProd and f.id = e.Fuente_de_Poder and e.idProd = @ID),
'Disco Duro' = (SELECT Nombre_Producto FROM DiscoDuro d, Producto p, Equipos e where p.ID_Producto = d.idProd and d.id_Disco = e.DiscoDuro and e.idProd = @ID),
Gabinete = (SELECT Nombre_Producto FROM Gabinete g, Producto p, Equipos e where p.ID_Producto = g.idProd and g.id = e.Gabinete and e.idProd = @ID),
e.CaracteristicasExtra 'Otras caracteristicas'
From 
Equipos e, Producto p
Where e.idProd = @ID
and e.idProd = p.ID_Producto
">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" />
                  </SelectParameters>
              </asp:SqlDataSource>
              
            </div>
          <div class="container">
                    <div class="col-md-offset-3 col-md-6 col-sm-12">
                              <h3 class="txtAzure">Eligamos un pc!</h3>
                        </div>
                    <asp:SqlDataSource ID="SqlDSEquipos" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" SelectCommand="SELECT p.ID_Producto AS 'ID', p.Nombre_Producto AS 'Equipo', cpu.Marca AS 'Tipo de Procesador', e.Categoria AS 'Categoría', p.PrecioCLP AS 'Precio $', p.Imagen FROM Equipos AS e INNER JOIN Producto AS p ON e.idProd = p.ID_Producto INNER JOIN Procesador AS cpu ON e.Procesador = cpu.id_Procesador">
                    </asp:SqlDataSource>
              </div>
            </section> 
        <section>
            <div style="width:50%; margin-left:2%;">
                <div style="position: absolute;top: 3%;">
                    <asp:Label ID="lblmuestra" runat="server" Text="Tus filtros:"></asp:Label>
                    <br />
                    <asp:Label ID="lblCategoria" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblProcesador" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="lblPresupuesto" runat="server"></asp:Label>
                </div>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDSEquipos" AutoGenerateColumns="False" DataKeyNames="ID" Width="1480px" style="text-align:center;" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                <Columns>
                    <asp:CommandField ButtonType="Button" SelectText="Ver" ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo">
                    <ItemStyle Width="23%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Tipo de Procesador" HeaderText="Tipo de Procesador" SortExpression="Tipo de Procesador" />
                    <asp:BoundField DataField="Categoría" HeaderText="Categoría" SortExpression="Categoría" />
                    <asp:BoundField DataField="Precio $" HeaderText="Precio $" SortExpression="Precio $" />
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Imagen")== DBNull.Value ? "Images/Nulo1.jpg" :  "data:image/jpg;base64,"+Convert.ToBase64String((byte[])Eval("Imagen")) %>' Height="430" Width="400" />
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
            <asp:Panel ID="pnlSeleccion" runat="server" Visible="false">
                <asp:DetailsView runat="server" ID="Detalles" AutoGenerateRows="False" CssClass="auto-style1" DataKeyNames="ID" DataSourceID="SqlDSEquipoSeleccionado" Width="682px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                    <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Equipo" HeaderText="Equipo" SortExpression="Equipo" />
                        <asp:BoundField DataField="Procesador" HeaderText="Procesador" ReadOnly="True" SortExpression="Procesador" />
                        <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                        <asp:BoundField DataField="Placa" HeaderText="Placa" ReadOnly="True" SortExpression="Placa" />
                        <asp:BoundField DataField="Tarjeta de Video" HeaderText="Tarjeta de Video" ReadOnly="True" SortExpression="Tarjeta de Video" />
                        <asp:BoundField DataField="RAM" HeaderText="RAM" ReadOnly="True" SortExpression="RAM" />
                        <asp:BoundField DataField="Fuente de Poder" HeaderText="Fuente de Poder" ReadOnly="True" SortExpression="Fuente de Poder" />
                        <asp:BoundField DataField="Disco Duro" HeaderText="Disco Duro" ReadOnly="True" SortExpression="Disco Duro" />
                        <asp:BoundField DataField="Gabinete" HeaderText="Gabinete" ReadOnly="True" SortExpression="Gabinete" />
                        <asp:BoundField DataField="Otras caracteristicas" HeaderText="Otras caracteristicas" SortExpression="Otras caracteristicas" />
                    </Fields>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                </asp:DetailsView>
                <h3 class="auto-style3">Gracias por cotizar con nosotros!</h3>
            </asp:Panel>
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

    <script src="http://code.jquery.com/jquery.js"></script>
  <script src="Scripts/jquery-3.5.1.js"></script>
  <script src="js/bootstrap.min.js"></script>
  
</html>