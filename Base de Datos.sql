USE [master]
GO
/****** Object:  Database [Sistema_De_Control]    Script Date: 18/07/2021 10:50:40  ******/
CREATE DATABASE [Sistema_De_Control]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sistema_De_Control', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sistema_De_Control.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sistema_De_Control_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sistema_De_Control_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sistema_De_Control] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sistema_De_Control].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sistema_De_Control] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sistema_De_Control] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sistema_De_Control] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sistema_De_Control] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sistema_De_Control] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET RECOVERY FULL 
GO
ALTER DATABASE [Sistema_De_Control] SET  MULTI_USER 
GO
ALTER DATABASE [Sistema_De_Control] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sistema_De_Control] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sistema_De_Control] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sistema_De_Control] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sistema_De_Control] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sistema_De_Control] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sistema_De_Control', N'ON'
GO
ALTER DATABASE [Sistema_De_Control] SET QUERY_STORE = OFF
GO
USE [Sistema_De_Control]
GO
/****** Object:  Table [dbo].[Informacion]    Script Date: 18/07/2021 10:50:40  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informacion](
	[ID_Alumno] [int] IDENTITY(1,1) NOT NULL,
	[Primer_Nombre] [varchar](50) NULL,
	[Segundo_Nombre] [varchar](50) NULL,
	[Primer_Apellido] [varchar](50) NULL,
	[Segundo_Apellido] [varchar](50) NULL,
	[Telefono] [varchar](9) NULL,
	[celular] [int] NULL,
	[direccion] [varchar](80) NULL,
	[email] [varchar](80) NULL,
	[fecha_de_nacimiento] [date] NULL,
	[observaciones] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 18/07/2021 10:50:40  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[ID_Alumno] [int] NOT NULL,
	[Ciencia] [real] NULL,
	[Comunicacion] [real] NULL,
	[Historia] [real] NULL,
	[Matematica] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Informacion] ON 

INSERT [dbo].[Informacion] ([ID_Alumno], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Telefono], [celular], [direccion], [email], [fecha_de_nacimiento], [observaciones]) VALUES (1, N'Carlos', N'Sotelo', N'Raul', N'Echenique', NULL, NULL, N'Av. Tupac Amaru', N'CarloJeronimo@gmail.com', CAST(N'1991-02-15' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Informacion] OFF
GO
INSERT [dbo].[Notas] ([ID_Alumno], [Ciencia], [Comunicacion], [Historia], [Matematica]) VALUES (1, 12, NULL, NULL, NULL)
GO
ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [fk_Informacion] FOREIGN KEY([ID_Alumno])
REFERENCES [dbo].[Informacion] ([ID_Alumno])
GO
ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [fk_Informacion]
GO
ALTER TABLE [dbo].[Informacion]  WITH CHECK ADD CHECK  (([observaciones]<(4)))
GO
/****** Object:  StoredProcedure [dbo].[SP_CargandoDatos]    Script Date: 18/07/2021 10:50:40  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[SP_CargandoDatos](@id int)
	AS 
	SELECT * FROM Informacion where ID_Alumno = @id;

GO
/****** Object:  StoredProcedure [dbo].[SP_ColocarNotasLOL]    Script Date: 18/07/2021 10:50:40  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE PROC [dbo].[SP_ColocarNotasLOL](@ID int, @Nota_Final float, @Curso varchar(30))
		AS
			if @Curso ='Comunicacion'
				update Notas set Comunicacion = @Nota_Final  WHERE ID_Alumno=@ID
			if @Curso ='Ciencia'
				update Notas set Ciencia = @Nota_Final  WHERE ID_Alumno=@ID
			if @Curso ='Matematica'
				update Notas set Matematica = @Nota_Final  WHERE ID_Alumno=@ID
			if @Curso ='Historia'
				update Notas set Historia = @Nota_Final  WHERE ID_Alumno=@ID
GO
/****** Object:  StoredProcedure [dbo].[SP_Editar_Alumno]    Script Date: 18/07/2021 10:50:40  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[SP_Editar_Alumno](@ID int,@Primer_Nombre varchar(50), @Segundo_Nombre varchar(50), @Primer_Apellido varchar(50), @Segundo_Apellido varchar(50), @Telefono int, @celular int, @direccion varchar(80), @email varchar(80), @fecha_de_nacimiento date, @observaciones int)
	AS 
	update Informacion set Primer_Nombre = @Primer_Nombre,Segundo_Nombre = @Segundo_Nombre, Primer_Apellido = @Primer_Apellido,Segundo_Apellido = @Segundo_Apellido, Telefono = @Telefono, celular = @celular, direccion = @direccion, email = @email,fecha_de_nacimiento = @fecha_de_nacimiento, observaciones = @observaciones
	Where  ID_Alumno = @ID 

GO
/****** Object:  StoredProcedure [dbo].[SP_Eliminar_Alumno]    Script Date: 18/07/2021 10:50:40  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[SP_Eliminar_Alumno] (@ID int)
	AS
		DELETE FROM NOTAS where ID_ALUMNO =@ID
		DELETE FROM Informacion where ID_Alumno=@ID
	
GO
/****** Object:  StoredProcedure [dbo].[SP_Insertar_Alumno]    Script Date: 18/07/2021 10:50:40  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[SP_Insertar_Alumno](@Primer_Nombre varchar(50), @Segundo_Nombre varchar(50), @Primer_Apellido varchar(50), @Segundo_Apellido varchar(50), @Telefono int, @celular int, @direccion varchar(80), @email varchar(80), @fecha_de_nacimiento date, @observaciones int)
	AS 
	INSERT INTO Informacion
	VALUES(@Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,@Telefono,@celular,@direccion,@email,@fecha_de_nacimiento,@observaciones)

GO
/****** Object:  StoredProcedure [dbo].[SP_Notas_Cedula]    Script Date: 18/07/2021 10:50:40  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[SP_Notas_Cedula]
	AS 
		SELECT  i.ID_Alumno,i.Primer_Nombre,i.Primer_Apellido,i.Segundo_Apellido,n.Ciencia,n.Comunicacion,n.Ciencia,n.Historia,n.Matematica  from Informacion i full join Notas n on  i.ID_Alumno = n.ID_Alumno  ORDER BY i.ID_Alumno ASC

GO
/****** Object:  StoredProcedure [dbo].[SP_Registros_Cedula]    Script Date: 18/07/2021 10:50:40  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[SP_Registros_Cedula]
	AS 
		SELECT * FROM Informacion ORDER BY ID_Alumno ASC
GO
/****** Object:  Trigger [dbo].[TR_GENERAR_NOTAS]    Script Date: 18/07/2021 10:50:40  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create trigger [dbo].[TR_GENERAR_NOTAS] 
	on [dbo].[Informacion] FOR INSERT
	as
	DECLARE @ID INT
	BEGIN
	SET @ID = (SELECT ID_ALUMNO FROM inserted);
	INSERT INTO Notas(ID_Alumno)values(@ID)
		

	END	
GO
ALTER TABLE [dbo].[Informacion] ENABLE TRIGGER [TR_GENERAR_NOTAS]
GO
USE [master]
GO
ALTER DATABASE [Sistema_De_Control] SET  READ_WRITE 
GO
