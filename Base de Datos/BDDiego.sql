USE [master]
GO
/****** Object:  Database [BDDiego]    Script Date: 5/5/2024 23:55:45 ******/
CREATE DATABASE [BDDiego]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDDiego', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BDDiego.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDDiego_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BDDiego_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDDiego] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDDiego].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDDiego] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDDiego] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDDiego] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDDiego] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDDiego] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDDiego] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BDDiego] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDDiego] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDDiego] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDDiego] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDDiego] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDDiego] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDDiego] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDDiego] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDDiego] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BDDiego] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDDiego] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDDiego] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDDiego] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDDiego] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDDiego] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDDiego] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDDiego] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDDiego] SET  MULTI_USER 
GO
ALTER DATABASE [BDDiego] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDDiego] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDDiego] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDDiego] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BDDiego] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BDDiego]
GO
/****** Object:  User [ex324]    Script Date: 5/5/2024 23:55:45 ******/
CREATE USER [ex324] FOR LOGIN [ex324] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[cuentabancaria]    Script Date: 5/5/2024 23:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cuentabancaria](
	[numero_cuenta] [int] NOT NULL,
	[id_persona] [int] NULL,
	[tipo_cuenta] [varchar](20) NULL,
	[saldo] [decimal](15, 2) NULL,
	[banco] [varchar](50) NULL,
	[sucursal] [varchar](50) NULL,
	[fecha_apertura] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[numero_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[persona]    Script Date: 5/5/2024 23:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[persona](
	[ci] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](15) NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 5/5/2024 23:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[id_rol] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transaccionbancaria]    Script Date: 5/5/2024 23:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaccionbancaria](
	[id_transaccion] [int] NOT NULL,
	[numero_cuenta] [int] NULL,
	[tipo_transaccion] [varchar](20) NULL,
	[monto] [decimal](15, 2) NULL,
	[fecha] [date] NULL,
	[descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/5/2024 23:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Nombre] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Clave] [varchar](50) NULL,
	[id_rol] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[cuentabancaria] ([numero_cuenta], [id_persona], [tipo_cuenta], [saldo], [banco], [sucursal], [fecha_apertura]) VALUES (1002, 2345678, N'Corriente', CAST(3000.00 AS Decimal(15, 2)), N'Banco SOL', N'LA PAZ', CAST(N'2019-06-15' AS Date))
INSERT [dbo].[cuentabancaria] ([numero_cuenta], [id_persona], [tipo_cuenta], [saldo], [banco], [sucursal], [fecha_apertura]) VALUES (1003, 7067007, N'Inversion', CAST(500.00 AS Decimal(15, 2)), N'Banco UNION', N'EL ALTO', CAST(N'2021-03-20' AS Date))
INSERT [dbo].[cuentabancaria] ([numero_cuenta], [id_persona], [tipo_cuenta], [saldo], [banco], [sucursal], [fecha_apertura]) VALUES (1004, 7067007, N'Ahorros', CAST(20000.00 AS Decimal(15, 2)), N'Banco FORTALEZA', N'LA PAZ', CAST(N'2024-04-22' AS Date))
INSERT [dbo].[persona] ([ci], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email]) VALUES (1234567, N'Ivan', N'Perez', CAST(N'1990-05-15' AS Date), N'Calle 123', N'123456789', N'ivan@gmail.com')
INSERT [dbo].[persona] ([ci], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email]) VALUES (2345678, N'Katerine', N'Gomez', CAST(N'1985-08-20' AS Date), N'Avenida 456', N'987654321', N'kat@gmail.com')
INSERT [dbo].[persona] ([ci], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email]) VALUES (4013809, N'Karen', N'Altamirano', CAST(N'2011-11-21' AS Date), N'Barrio Madrid', N'12378989', N'karen@gmail.com')
INSERT [dbo].[persona] ([ci], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email]) VALUES (7067007, N'Diego', N'Aliaga', CAST(N'1978-03-10' AS Date), N'Carretera 789', N'456789012', N'diego@gmail.com')
INSERT [dbo].[persona] ([ci], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email]) VALUES (34567899, N'Emma', N'Candia', CAST(N'1968-04-10' AS Date), N'Avenida 10', N'78990115', N'emma@gmail.com')
INSERT [dbo].[Rol] ([id_rol], [Descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[Rol] ([id_rol], [Descripcion]) VALUES (2, N'Director')
INSERT [dbo].[Rol] ([id_rol], [Descripcion]) VALUES (3, N'Cajero')
INSERT [dbo].[Usuario] ([Nombre], [Correo], [Clave], [id_rol]) VALUES (N'Diego', N'diego@gmail.com', N'123', 1)
INSERT [dbo].[Usuario] ([Nombre], [Correo], [Clave], [id_rol]) VALUES (N'Rodo', N'rodo@gmail.com', N'456', 2)
INSERT [dbo].[Usuario] ([Nombre], [Correo], [Clave], [id_rol]) VALUES (N'Sergio', N'sergio@gmail.com', N'789', 3)
ALTER TABLE [dbo].[cuentabancaria]  WITH CHECK ADD FOREIGN KEY([id_persona])
REFERENCES [dbo].[persona] ([ci])
GO
ALTER TABLE [dbo].[transaccionbancaria]  WITH CHECK ADD FOREIGN KEY([numero_cuenta])
REFERENCES [dbo].[cuentabancaria] ([numero_cuenta])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([id_rol])
REFERENCES [dbo].[Rol] ([id_rol])
GO
USE [master]
GO
ALTER DATABASE [BDDiego] SET  READ_WRITE 
GO
