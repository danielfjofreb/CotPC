USE [CotPC]
GO
/****** Object:  Table [dbo].[Cotizacion]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cotizacion](
	[id_cotizacion] [int] IDENTITY(100,1) NOT NULL,
	[Monto_cotizacion] [int] NULL,
	[presupuesto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscoDuro]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscoDuro](
	[id_Disco] [int] IDENTITY(1,1) NOT NULL,
	[tipoDisco] [varchar](20) NOT NULL,
	[cantidadAlmacenamiento_GB] [int] NOT NULL,
	[idProd] [bigint] NOT NULL,
	[medida] [decimal](6, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Disco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disipador]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disipador](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProd] [bigint] NOT NULL,
	[TipoDisipador] [varchar](50) NOT NULL,
	[socket] [varchar](50) NOT NULL,
	[Medida_mm] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProd] [bigint] NOT NULL,
	[Procesador] [int] NULL,
	[Placa] [int] NULL,
	[RAM] [int] NULL,
	[Disipador] [int] NULL,
	[Tarjeta_de_Video] [int] NULL,
	[Fuente_de_Poder] [int] NULL,
	[DiscoDuro] [int] NULL,
	[Gabinete] [int] NULL,
	[Categoria] [varchar](80) NOT NULL,
	[CaracteristicasExtra] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fuente_de_Poder]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fuente_de_Poder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idProd] [bigint] NOT NULL,
	[Descripcion] [varchar](1000) NULL,
	[conAlimentacionPr] [varchar](50) NOT NULL,
	[conAlimentacionPl] [varchar](50) NOT NULL,
	[conAlimentacionG] [varchar](50) NOT NULL,
	[PotenciaPSU] [varchar](20) NOT NULL,
	[certificacion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gabinete]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gabinete](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProd] [bigint] NOT NULL,
	[E_ATX] [bit] NOT NULL,
	[ATX] [bit] NOT NULL,
	[Micro_ATX] [bit] NOT NULL,
	[ITX] [bit] NOT NULL,
	[medidaMaxGPU_mm] [int] NOT NULL,
	[medidaMaxDisipador_mm] [int] NOT NULL,
	[huecohhd] [bit] NULL,
	[cantidadhhd] [int] NULL,
	[huecossd] [bit] NULL,
	[cantidadssd] [int] NULL,
	[color] [varchar](50) NULL,
	[iluminacion] [varchar](50) NULL,
	[ventiladores_preinstalados] [bit] NULL,
	[vpreinst_Caracteristicas] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Placa]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Placa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProd] [bigint] NOT NULL,
	[E_ATX] [bit] NOT NULL,
	[ATX] [bit] NOT NULL,
	[Micro_ATX] [bit] NOT NULL,
	[ITX] [bit] NOT NULL,
	[socket] [varchar](50) NOT NULL,
	[Chipset] [varchar](50) NOT NULL,
	[tipoRam] [varchar](20) NOT NULL,
	[frecuenciaMinRAM_Mhz] [int] NOT NULL,
	[frecuenciaMaxRAM_Mhz] [int] NOT NULL,
	[configRAM] [varchar](30) NOT NULL,
	[PCIExpressx16] [bit] NOT NULL,
	[conAlimentacion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presupuesto]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presupuesto](
	[id_Presupuesto] [int] IDENTITY(1,1) NOT NULL,
	[Monto_Presupuesto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Presupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procesador]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procesador](
	[id_Procesador] [int] IDENTITY(1,1) NOT NULL,
	[Nucleos] [int] NOT NULL,
	[FrecuenciaGhz] [decimal](6, 2) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Modelo_Procesador] [varchar](50) NOT NULL,
	[Generacion] [varchar](50) NOT NULL,
	[socket] [varchar](50) NOT NULL,
	[Chipset] [varchar](50) NOT NULL,
	[idProd] [bigint] NOT NULL,
	[FrecGPUIntegrada] [int] NULL,
	[tpdProc] [int] NOT NULL,
	[conAlimentacionP] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Procesador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ID_Producto] [bigint] IDENTITY(1000,1) NOT NULL,
	[Nombre_Producto] [varchar](150) NOT NULL,
	[PrecioCLP] [int] NOT NULL,
	[Imagen] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAM]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProd] [bigint] NOT NULL,
	[tipoRam] [varchar](20) NOT NULL,
	[frecuenciaRAM_Mhz] [int] NOT NULL,
	[MemoriaRAM_Gb] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta_de_Video]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta_de_Video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProd] [bigint] NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Modelo_GPU] [varchar](50) NOT NULL,
	[tpdGPU] [int] NOT NULL,
	[Medida_mm] [int] NOT NULL,
	[PSU_Recomendada] [varchar](50) NULL,
	[conAlimentacion] [varchar](50) NOT NULL,
	[VRAM] [int] NOT NULL,
	[tipoVRAM] [varchar](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[usuario] [varchar](100) NOT NULL,
	[contraseña] [varchar](20) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD  CONSTRAINT [IDPresupuesto] FOREIGN KEY([presupuesto])
REFERENCES [dbo].[Presupuesto] ([id_Presupuesto])
GO
ALTER TABLE [dbo].[Cotizacion] CHECK CONSTRAINT [IDPresupuesto]
GO
ALTER TABLE [dbo].[DiscoDuro]  WITH CHECK ADD  CONSTRAINT [prodDisco] FOREIGN KEY([idProd])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[DiscoDuro] CHECK CONSTRAINT [prodDisco]
GO
ALTER TABLE [dbo].[Disipador]  WITH CHECK ADD  CONSTRAINT [prodDisipador] FOREIGN KEY([idProd])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Disipador] CHECK CONSTRAINT [prodDisipador]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [almacenamiento] FOREIGN KEY([DiscoDuro])
REFERENCES [dbo].[DiscoDuro] ([id_Disco])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [almacenamiento]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [chasis] FOREIGN KEY([Gabinete])
REFERENCES [dbo].[Gabinete] ([id])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [chasis]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [cpu] FOREIGN KEY([Procesador])
REFERENCES [dbo].[Procesador] ([id_Procesador])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [cpu]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [fua] FOREIGN KEY([Fuente_de_Poder])
REFERENCES [dbo].[Fuente_de_Poder] ([ID])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [fua]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [GPU] FOREIGN KEY([Tarjeta_de_Video])
REFERENCES [dbo].[Tarjeta_de_Video] ([id])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [GPU]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [memoriaRAM] FOREIGN KEY([RAM])
REFERENCES [dbo].[RAM] ([id])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [memoriaRAM]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [mother] FOREIGN KEY([Placa])
REFERENCES [dbo].[Placa] ([id])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [mother]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [ProductoEquipo] FOREIGN KEY([idProd])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [ProductoEquipo]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [Refrigeracion] FOREIGN KEY([Disipador])
REFERENCES [dbo].[Disipador] ([id])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [Refrigeracion]
GO
ALTER TABLE [dbo].[Fuente_de_Poder]  WITH CHECK ADD  CONSTRAINT [prodPSU] FOREIGN KEY([idProd])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Fuente_de_Poder] CHECK CONSTRAINT [prodPSU]
GO
ALTER TABLE [dbo].[Gabinete]  WITH CHECK ADD  CONSTRAINT [prodGabinete] FOREIGN KEY([idProd])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Gabinete] CHECK CONSTRAINT [prodGabinete]
GO
ALTER TABLE [dbo].[Placa]  WITH CHECK ADD  CONSTRAINT [prodPlaca] FOREIGN KEY([idProd])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Placa] CHECK CONSTRAINT [prodPlaca]
GO
ALTER TABLE [dbo].[Procesador]  WITH CHECK ADD  CONSTRAINT [prodProces] FOREIGN KEY([idProd])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Procesador] CHECK CONSTRAINT [prodProces]
GO
ALTER TABLE [dbo].[RAM]  WITH CHECK ADD  CONSTRAINT [prodRAM] FOREIGN KEY([idProd])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[RAM] CHECK CONSTRAINT [prodRAM]
GO
ALTER TABLE [dbo].[Tarjeta_de_Video]  WITH CHECK ADD  CONSTRAINT [prodGPU] FOREIGN KEY([idProd])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
ALTER TABLE [dbo].[Tarjeta_de_Video] CHECK CONSTRAINT [prodGPU]
GO
/****** Object:  StoredProcedure [dbo].[CargarGabinete]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[CargarGabinete]
@idPlaca int,
@idGPU int,
@idDisipador int,
@idDisco int
as


if exists(select tipoDisco from DiscoDuro where tipoDisco = 'SSD' and id_Disco = @idDisco)
begin
select g.id, p.Nombre_Producto from Gabinete g, Producto p, Tarjeta_de_Video gpu, Disipador d, Placa pl where g.huecossd = 1 and gpu.Medida_mm <= g.medidaMaxGPU_mm and d.Medida_mm <= g.medidaMaxDisipador_mm
and (pl.ATX = g.ATX or pl.E_ATX = g.E_ATX or pl.Micro_ATX = g.Micro_ATX or pl.ITX = g.ITX) and pl.id = @idPlaca and gpu.id = @idGPU and d.id = @idDisipador and p.ID_Producto = g.idProd
end

else if exists(select tipoDisco from DiscoDuro where tipoDisco = 'HDD' and id_Disco = @idDisco)
begin
select g.id, p.Nombre_Producto from Gabinete g, Producto p, Tarjeta_de_Video gpu, Disipador d, Placa pl where g.huecohhd = 1 and gpu.Medida_mm <= g.medidaMaxGPU_mm and d.Medida_mm <= g.medidaMaxDisipador_mm
and (pl.ATX = g.ATX or pl.E_ATX = g.E_ATX or pl.Micro_ATX = g.Micro_ATX or pl.ITX = g.ITX) and pl.id = @idPlaca and gpu.id = @idGPU and d.id = @idDisipador and p.ID_Producto = g.idProd
end

GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Procesador]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Eliminar_Procesador]
@IDProd bigint
	as
	
begin

	DELETE FROM Procesador WHERE idProd = @IDProd
	
	DELETE from Producto WHERE ID_Producto = @IDProd
end
GO
/****** Object:  StoredProcedure [dbo].[EliminarDisco]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[EliminarDisco]
@IDProd bigint
as

	declare 
	@idDisco int
	set @idDisco = (select id_Disco from DiscoDuro where idProd = @IDProd)


begin
	-- Validación de Equipo
		if exists(SELECT e.DiscoDuro FROM DiscoDuro d, Equipos e WHERE d.idProd = @IDProd and d.id_Disco = e.DiscoDuro)
			begin
				update Equipos set DiscoDuro = null where DiscoDuro=@idDisco
			end

		DELETE FROM DiscoDuro WHERE idProd = @IDProd

	
		DELETE from Producto WHERE ID_Producto = @IDProd
end

GO
/****** Object:  StoredProcedure [dbo].[EliminarDisipador]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[EliminarDisipador]
@IDProd bigint
as

	declare 
	@idDis int
	set @idDis = (select id from Disipador where idProd = @IDProd)


begin
	-- Validación de Equipo
		if exists(SELECT e.Disipador FROM Disipador d, Equipos e WHERE d.idProd = @IDProd and d.id = e.Disipador)
			begin
				update Equipos set Disipador = null where Disipador=@idDis
			end

		DELETE FROM Disipador WHERE idProd = @IDProd

	
		DELETE from Producto WHERE ID_Producto = @IDProd
end

GO
/****** Object:  StoredProcedure [dbo].[EliminarFuentePoder]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[EliminarFuentePoder]
@IDProd bigint
as

	declare 
	@idFuente int

	set @idFuente = (select ID from Fuente_de_Poder where idProd = @IDProd)


begin

	-- Validación de Equipo
		if exists(SELECT e.Fuente_de_Poder FROM Fuente_de_Poder pw, Equipos e WHERE pw.idProd = @IDProd and pw.id = e.Fuente_de_Poder)
			begin
				update Equipos set Fuente_de_Poder = null where Fuente_de_Poder = @idFuente
			end

		DELETE FROM Fuente_de_Poder WHERE idProd = @IDProd
		DELETE from Producto WHERE ID_Producto = @IDProd
end


--exec EliminarFuentePoder 11002
GO
/****** Object:  StoredProcedure [dbo].[EliminarGabinete]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[EliminarGabinete]
@IDProd bigint
as

	declare 
	@idGab int
	set @idGab = (select id from Gabinete where idProd = @IDProd)


begin
	-- Validación de Equipo
		if exists(SELECT e.Gabinete FROM Gabinete g, Equipos e WHERE g.idProd = @IDProd and g.id = e.Gabinete)
			begin
				update Equipos set Gabinete = null where Gabinete=@idGab
			end

		DELETE FROM Gabinete WHERE idProd = @IDProd

	
		DELETE from Producto WHERE ID_Producto = @IDProd
end

GO
/****** Object:  StoredProcedure [dbo].[EliminarPlaca]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[EliminarPlaca]
@IDProd bigint
as

	declare 
	@idPlaca int
	set @idPlaca = (select id from Placa where idProd = @IDProd)


begin
	-- Validación de Equipo
		if exists(SELECT e.Placa FROM Placa pl, Equipos e WHERE pl.idProd = @IDProd and pl.id = e.Placa)
			begin
				update Equipos set Placa = null where Placa = @idPlaca
			end

		DELETE FROM Placa WHERE idProd = @IDProd

	
		DELETE from Producto WHERE ID_Producto = @IDProd
end

GO
/****** Object:  StoredProcedure [dbo].[EliminarRAM]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[EliminarRAM]
@IDProd bigint
as

	declare 
	@idRAM int
	set @idRAM = (select id from RAM where idProd = @IDProd)


begin
	-- Validación de Equipo
		if exists(SELECT e.RAM FROM RAM, Equipos e WHERE RAM.idProd = @IDProd and RAM.id = e.RAM)
			begin
				update Equipos set RAM = null where RAM=@idRAM
			end

		DELETE FROM RAM WHERE idProd = @IDProd

	
		DELETE from Producto WHERE ID_Producto = @IDProd
end

GO
/****** Object:  StoredProcedure [dbo].[EliminarTarjetaVideo]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[EliminarTarjetaVideo]
@IDProd bigint
as

	declare 
	@idVideo int

	set @idVideo = (select id from Tarjeta_de_Video where idProd = @IDProd)

begin
	-- Validación de Equipo
		if exists(SELECT e.Tarjeta_de_Video FROM Tarjeta_de_Video gpu, Equipos e WHERE gpu.idProd = @IDProd and gpu.id = e.Tarjeta_de_Video)
			begin
				update Equipos set Tarjeta_de_Video = null where Tarjeta_de_Video = @idVideo
			end
		DELETE FROM Tarjeta_de_Video WHERE idProd = @IDProd
	
		DELETE from Producto WHERE ID_Producto = @IDProd
end
GO
/****** Object:  StoredProcedure [dbo].[InsertarDisco]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[InsertarDisco] @tdisco varchar (20), @cantidadAlmacenamiento_GB int, @medida decimal(6,2), @Nombre_Prod varchar (150), @PrecioCLP int, @Imagen image
as
	declare @ID_Producto bigint
	begin try
		insert into Producto values(@Nombre_Prod,@PrecioCLP, @Imagen)
		set @ID_Producto = SCOPE_IDENTITY()
		insert into DiscoDuro values (@tdisco, @cantidadAlmacenamiento_GB, @ID_Producto, @medida)
		
	end try
	begin catch
	print 'Error en Procedimiento Almacenado: No se pudo ingresar Unidad de Almacenamiento'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertarDisipador]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertarDisipador]
	@TipoDisipador varchar (50),
	@socket varchar (50),
	@Medida_mm int,
	@Nombre_Prod varchar (150), @PrecioCLP int, @Imagen image
as
	declare @ID_Producto bigint
	begin try
		insert into Producto values(@Nombre_Prod,@PrecioCLP, @Imagen)
		set @ID_Producto = SCOPE_IDENTITY()

		insert into Disipador values (@ID_Producto, @TipoDisipador, @socket,@Medida_mm)
	end try
	begin catch
	print 'Error en procedimiento almacenado: No se pudo ingresar Disipador'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertarEquipo]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[InsertarEquipo]
@Procesador int,
@Placa int,
@RAM int,
@Disipador int,
@TarjetaVideo int,
@FuentePoder int,
@DiscoDuro int,
@Gabinete int,
@Categoria varchar(80),
@CaracteristicasExtra nvarchar(1000),
@Nombre_Prod varchar (150),
@PrecioCLP int,
@Imagen image
as
declare @ID_Producto bigint
begin
insert into Producto values(@Nombre_Prod,@PrecioCLP, @Imagen)
		set @ID_Producto = SCOPE_IDENTITY()

insert into Equipos values (@ID_Producto, @Procesador, @Placa, @RAM, @Disipador, @TarjetaVideo, @FuentePoder, @DiscoDuro, @Gabinete, @Categoria ,@CaracteristicasExtra)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertarFuentePoder]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertarFuentePoder] @Descripcion varchar (1000),
	@conAlimentacionPr varchar (50),
	@conAlimentacionPl varchar (50),
	@conAlimentacionG varchar (50),
	@PotenciaPSU varchar(20),
	@certificacion varchar(100),
	@Nombre_Prod varchar (150), @PrecioCLP int, @Imagen image
as
	declare @ID_Producto bigint
	begin try
		insert into Producto values(@Nombre_Prod,@PrecioCLP, @Imagen)
		set @ID_Producto = SCOPE_IDENTITY()

		insert into Fuente_de_Poder values (@ID_Producto, @Descripcion, @conAlimentacionPr,@conAlimentacionPl,@conAlimentacionG,@PotenciaPSU,@certificacion)
	end try
	begin catch
	print 'Error en procedimiento almacenado: No se pudo ingresar fuente de poder'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertarGabinete]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[InsertarGabinete]
	@E_ATX bit,
	@ATX bit,
	@Micro_ATX bit,
	@ITX bit,
	@medidaMaxGPU_mm int,
	@medidaMaxDisipador_mm int,
	@huecohhd bit,
	@cantidadhhd int,
	@huecossd bit,
	@cantidadssd int,
	@color varchar (50),
	@iluminacion varchar (50),
	@ventiladores_preinstalados bit,
	@vpreinst_Caracteristicas varchar (50),
	@Nombre_Prod varchar (150), @PrecioCLP int, @Imagen image
as
	declare @ID_Producto bigint
	begin try
		insert into Producto values(@Nombre_Prod,@PrecioCLP, @Imagen)
		set @ID_Producto = SCOPE_IDENTITY()
		insert into Gabinete values (@ID_Producto, @E_ATX,@ATX,@Micro_ATX,@ITX,@medidaMaxGPU_mm,@medidaMaxDisipador_mm,@huecohhd,@cantidadhhd,@huecossd,@cantidadssd,@color,@iluminacion,@ventiladores_preinstalados,@vpreinst_Caracteristicas)
	end try
	begin catch
	print 'Error en procedimiento almacenado: No se pudo ingresar Gabinete'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[insertarGPU]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[insertarGPU]
	@Marca varchar (50),
	@Modelo_GPU varchar (50),
	@tpdGPU int,
	@Medida_mm int,
	@VRAM int,
	@TipoVRAM varchar (7),
	@PSU_Recomendada varchar (50),
	@conAlimentacion varchar (50),
	@Nombre_Prod varchar (150), @PrecioCLP int, @Imagen image
	as
	declare @ID_Producto bigint
	begin try
		insert into Producto values(@Nombre_Prod,@PrecioCLP, @Imagen)
		set @ID_Producto = SCOPE_IDENTITY()

		insert into Tarjeta_de_Video values (@ID_Producto,@Marca,@Modelo_GPU,@tpdGPU,@Medida_mm,@PSU_Recomendada,@conAlimentacion, @VRAM, @TipoVRAM)
	end try
	begin catch
	print 'Error en procedimiento almacenado: No se pudo ingresar Tarjeta de Video'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertarPlaca]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[InsertarPlaca] @E_ATX bit,
	@ATX bit,
	@Micro_ATX bit,
	@ITX bit,
	@socket varchar (50),
	@Chipset varchar (50),
	@tipoRam varchar(20),
	@frecuenciaMinRAM_Mhz int,
	@frecuenciaMaxRAM_Mhz int,
	@configRAM varchar (30),
	@PCIExpressx16 bit,
	@conAlimentacion varchar (50),
	@Nombre_Prod varchar (150), @PrecioCLP int, @Imagen image
as
	declare @ID_Producto bigint
	begin try
		insert into Producto values(@Nombre_Prod,@PrecioCLP, @imagen)
		set @ID_Producto = SCOPE_IDENTITY()

		insert into Placa values (@ID_Producto,@E_ATX,@ATX,@Micro_ATX,@ITX,@socket,@Chipset,@tipoRam,@frecuenciaMinRAM_Mhz,@frecuenciaMaxRAM_Mhz,@configRAM,@PCIExpressx16,@conAlimentacion)
	end try
	begin catch
	print 'Error en procedimiento almacenado: No se pudo ingresar Placa'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertarProcesador]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertarProcesador] @Nucleos int, @FrecuenciaGhz decimal(6,2), @Marca varchar (50), @Modelo_Procesador varchar (50), @Generacion varchar (50), @socket varchar (50), @Chipset varchar (50), @FrecGPUIntegrada int, @tpdProc int, @conAlimentacionP varchar (50), @Nombre_Prod varchar (150), @PrecioCLP int, @Imagen image
as
	declare @ID_Producto bigint
	begin try
		insert into Producto values(@Nombre_Prod,@PrecioCLP, @Imagen)
		set @ID_Producto = SCOPE_IDENTITY()
		insert into Procesador values (@Nucleos, @FrecuenciaGhz, @Marca, @Modelo_Procesador, @Generacion, @socket, @Chipset, @ID_Producto, @FrecGPUIntegrada, @tpdProc, @conAlimentacionP)
		
	end try
	begin catch
	print 'Error en procedimiento almacenado: no se pudo ingresar Procesador'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertarRAM]    Script Date: 29-12-2020 18:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertarRAM]
	@tipoRam varchar(20),
	@frecuenciaRAM_Mhz int,
	@MemoriaRAM_Gb int,
	@Nombre_Prod varchar (150), @PrecioCLP int, @Imagen image
as
	declare @ID_Producto bigint
	begin try
		insert into Producto values(@Nombre_Prod,@PrecioCLP, @Imagen)
		set @ID_Producto = SCOPE_IDENTITY()

		insert into RAM values (@ID_Producto, @tipoRam, @frecuenciaRAM_Mhz, @MemoriaRAM_Gb)
	end try
	begin catch
	print 'Error en procedimiento almacenado: No se pudo ingresar RAM'
	end catch
GO
