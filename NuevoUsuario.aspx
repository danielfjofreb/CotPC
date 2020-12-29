<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoUsuario.aspx.cs" Inherits="CotPc.NuevoUsuario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Nuevo Usuario</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
     <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
     <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/estilos.css"/>
    <link rel="stylesheet" href="css/tooplate-style.css"/>


</head>
<body>
    <section data-stellar-background-ratio="0.5">
          <div class="overlay">
              <br />
              <br />
&nbsp;&nbsp;&nbsp;
              
          </div>
    <div class="container">
        <<div class="col-md-offset-3 col-md-6 col-sm-12">
            <h1 style="color:ghostwhite">Nuevo Usuario</h1>
            <form id ="formulario" method ="post" runat="server" class="auto-style2">
                <a href="Inserciones_Solo_Administradores.aspx"><img src="/Iconos/Retornar.png" width="62" height="32px" /></a>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="ID Usuario:" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="645px" required></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Clave:" ForeColor="White"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="TextBox2" runat="server" required Width="645px" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Mail:" ForeColor="White"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="TextBox3" runat="server" required Width="645px" TextMode="Email"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Nombre:" ForeColor="White"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server" required Width="645px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Apellido:" ForeColor="White"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox5" runat="server" required Width="645px"></asp:TextBox>
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Acepta nuestras condiciones de uso" required/>
                <br />
                <div class="auto-style6">
                    <asp:Button ID="Button1" runat="server" Text="Registrar" OnClick="Button1_Click" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CotPCConnectionString %>" InsertCommand="INSERT INTO Usuarios(usuario, contraseña, email, Nombre, Apellido) VALUES (@usuario, @contraseña, @email, @Nombre, @Apellido)" SelectCommand="SELECT * FROM [Usuarios] WHERE ([usuario] = @usuario)">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="usuario" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox2" Name="contraseña" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox3" Name="email" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox4" Name="Nombre" PropertyName="Text" />
                            <asp:ControlParameter ControlID="TextBox5" Name="Apellido" PropertyName="Text" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="usuario" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <br />
&nbsp;&nbsp;&nbsp;
            </form>
        </div>
    </div>
        </section>
    <footer>
        <div class="container">
            <h3>Taller de Proyectos Integrados de Programación</h3>
            <h4>Daniel Jofré / Álvaro Parraguez</h4>
            <h4>Programación y Analisis de Sistemas (PEV)</h4>
        </div>
    </footer>
</body>
</html>