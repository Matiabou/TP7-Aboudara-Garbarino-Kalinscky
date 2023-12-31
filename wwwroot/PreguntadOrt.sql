USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 31/10/2023 09:17:01 ******/
CREATE DATABASE [PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadOrt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadOrt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadOrt', N'ON'
GO
ALTER DATABASE [PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 31/10/2023 09:17:01 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 31/10/2023 09:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IDCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultad]    Script Date: 31/10/2023 09:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultad](
	[IDDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IDDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 31/10/2023 09:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[IDPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IDCategoria] [int] NOT NULL,
	[IDDificultad] [int] NOT NULL,
	[Enunciado] [varchar](100) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IDPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 31/10/2023 09:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[IDRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IDPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Respuesta] PRIMARY KEY CLUSTERED 
(
	[IDRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (1, N'Arte', NULL)
INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (2, N'Historia', NULL)
INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (3, N'Ciencia', NULL)
INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (4, N'Geografia', NULL)
INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (5, N'Deporte', NULL)
INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (6, N'Entretenimiento', NULL)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultad] ON 

INSERT [dbo].[Dificultad] ([IDDificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultad] ([IDDificultad], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultad] ([IDDificultad], [Nombre]) VALUES (3, N'Dificil')
INSERT [dbo].[Dificultad] ([IDDificultad], [Nombre]) VALUES (4, N'Experto')
SET IDENTITY_INSERT [dbo].[Dificultad] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 

INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿Quién pintó la Mona Lisa?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿Qué famoso escultor creó la obra "El Pensador"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'¿Quién pintó "La noche estrellada"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (4, 1, 1, N'¿Quién pintó "La persistencia de la memoria"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (6, 1, 2, N'¿Qué pintor neerlandés es conocido por su estilo de pintura llamado "Puntillismo"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (7, 1, 2, N'¿Qué famosa pintura muestra a una mujer sosteniendo un tenedor en una habitación?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (9, 1, 3, N'¿Qué pintor impresionista es conocido por sus series de nenúfares?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (14, 2, 1, N'¿En qué año comenzó la Segunda Guerra Mundial?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (15, 3, 2, N'¿Cuál es el elemento químico con símbolo Hg?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (16, 4, 3, N'¿Cuál es el país más grande del mundo en términos de superficie terrestre?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (17, 5, 4, N'¿En qué deporte se utiliza un "shuttlecock"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (18, 2, 2, N'¿Quién fue el primer presidente de Estados Unidos?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (20, 2, 2, N'¿Quién fue el primer presidente de Estados Unidos?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (22, 4, 4, N'¿Cuál es el río más largo del mundo?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (23, 5, 1, N'¿En qué deporte se usa una pelota de béisbol?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (24, 1, 2, N'¿Qué artista pintó "La persistencia de la memoria"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (25, 2, 3, N'¿En qué año ocurrió la Revolución Rusa?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (26, 3, 4, N'¿Cuál es el elemento químico con el número atómico 92?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (27, 4, 1, N'¿Cuál es la capital de Australia?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (28, 6, 2, N'¿Cuál es la primera película de la saga de Star Wars lanzada en 1977?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (29, 5, 3, N'¿En qué deporte se utiliza un arco y una flecha?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (30, 1, 4, N'¿Quién pintó "La noche estrellada"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (31, 2, 1, N'¿Quién fue el líder de la Revolución Cubana?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (32, 3, 1, N'¿Cuál es el elemento químico más abundante en la corteza terrestre?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (33, 4, 2, N'¿Cuál es el río más largo de África?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (34, 6, 3, N'¿Cuál fue la primera película en la historia en ganar el premio Oscar a la Mejor Película?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (35, 5, 4, N'¿Cuántos jugadores componen un equipo de balonmano en la cancha?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (36, 6, 2, N'¿En qué película de Christopher Nolan el protagonista sufre de amnesia anterógrada?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (37, 5, 1, N'¿En qué deporte se juega en un campo llamado "cancha" y se usan raquetas?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (38, 1, 3, N'¿Cuál de las siguientes obras NO fue pintada por Vincent van Gogh?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (39, 3, 4, N'¿Cuál es el proceso mediante el cual las plantas convierten la luz solar en energía?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (40, 2, 1, N'¿En qué año comenzó la Primera Guerra Mundial?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (41, 4, 2, N'¿Cuál es el desierto más grande del mundo?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (43, 5, 4, N'¿En qué deporte se utiliza un implemento llamado "jabalina"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (44, 3, 1, N'¿Cuál es el elemento químico más abundante en la corteza terrestre?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (45, 5, 2, N'¿Cuál de estos eventos deportivos ocurre cada 4 años?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (46, 2, 3, N'¿Qué imperio fue gobernado por Justiniano I en el siglo VI?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (47, 4, 4, N'¿Cuál es la montaña más alta de África?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (48, 6, 1, N'¿Qué actor interpretó el papel de Iron Man en el Universo Cinematográfico de Marvel?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (49, 1, 2, N'¿Cuál es el título de la famosa pintura de Leonardo da Vinci que muestra a una mujer sonriendo?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (50, 2, 3, N'¿Qué líder militar conquistó gran parte de Asia en el siglo XIII?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (51, 4, 4, N'¿En qué océano se encuentra la Fosa de las Marianas, el punto más profundo de la Tierra?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (52, 5, 3, N'¿En qué año se celebraron los primeros Juegos Olímpicos modernos?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (54, 3, 2, N'¿Qué parte del cuerpo humano se encarga de producir la insulina?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (66, 2, 4, N'¿Cuál fue el nombre original de la ciudad de Estambul?
', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (67, 2, 4, N'¿Cuál de estos líderes conquistó más territorio en un solo imperio?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (68, 3, 3, N'¿Cuál es la partícula subatómica más masiva?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [IDCategoria], [IDDificultad], [Enunciado], [Foto]) VALUES (69, 3, 3, N'¿Cuál de estos elementos es un gas noble?', NULL)
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuesta] ON 

INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'Leonardo da Vinci', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 1, 4, N'Salvador Dalí', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 2, 1, N'Michelangelo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 2, N'Auguste Rodin', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 3, N'Donatello', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 2, 4, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 3, 1, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 3, 2, N'Vincent van Gogh', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 3, 3, N'Salvador Dalí', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 3, 4, N'Frida Kahlo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 4, 1, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (14, 4, 2, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 4, 3, N'Salvador Dalí', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 4, 4, N'Frida Kahlo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (21, 6, 1, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (22, 6, 2, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (23, 6, 3, N'Georges Seurat', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (24, 6, 4, N'Edgar Degas', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (25, 7, 1, N'La Gioconda', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 7, 2, N'La noche estrellada', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 7, 3, N'American Gothic', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (28, 7, 4, N'El grito', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 9, 1, N'Edgar Degas', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 9, 2, N'Claude Monet', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 9, 3, N'Henri Matisse', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 9, 4, N'Pierre-Auguste Renoir', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 14, 1, N'1939', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 14, 2, N'1941', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 14, 3, N'1914', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 14, 4, N'1945', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 15, 1, N'Hidrógeno', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 15, 2, N'Oxígeno', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 15, 3, N'Mercurio', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 15, 4, N'Plata', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 16, 1, N'China', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 16, 2, N'Estados Unidos', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 16, 3, N'Rusia', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 16, 4, N'Brasil', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 17, 1, N'Tenis', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 17, 2, N'Fútbol', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (67, 17, 3, N'Bádminton', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 17, 4, N'Golf', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (69, 18, 1, N'Thomas Jefferson', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (70, 18, 2, N'George Washington', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (71, 18, 3, N'John Adams', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 18, 4, N'Benjamin Franklin', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 20, 1, N'Thomas Jefferson', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 20, 2, N'George Washington', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 20, 3, N'John Adams', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 20, 4, N'Benjamin Franklin', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 22, 1, N'Río Amazonas', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (86, 22, 2, N'Río Nilo', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 22, 3, N'Río Yangtsé', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (88, 22, 4, N'Río Misisipi', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (89, 23, 1, N'Fútbol', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (90, 23, 2, N'Béisbol', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (91, 23, 3, N'Baloncesto', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (92, 23, 4, N'Tenis', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (93, 24, 1, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (94, 24, 2, N'Salvador Dalí', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (95, 24, 3, N'Leonardo da Vinci', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (96, 24, 4, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (97, 25, 1, N'1917', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (98, 25, 2, N'1905', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (99, 25, 3, N'1923', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (100, 25, 4, N'1939', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (101, 26, 1, N'Plutonio', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (102, 26, 2, N'Uranio', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (103, 26, 3, N'Radio', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (104, 26, 4, N'Titanio', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (105, 27, 1, N'Melbourne', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (106, 27, 2, N'Sydney', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (107, 27, 3, N'Canberra', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (108, 27, 4, N'Perth', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (109, 28, 1, N'The Empire Strikes Back', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (110, 28, 2, N'Return of the Jedi', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (111, 28, 3, N'A New Hope', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (112, 28, 4, N'The Phantom Menace', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (113, 29, 1, N'Tiro con arco', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (114, 29, 2, N'Esgrima', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (115, 29, 3, N'Curling', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (116, 29, 4, N'Badminton', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (117, 30, 1, N'Claude Monet', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (118, 30, 2, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (119, 30, 3, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (120, 30, 4, N'Vincent van Gogh', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (121, 31, 1, N'Fidel Castro', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (122, 31, 2, N'Che Guevara', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (123, 31, 3, N'Hugo Chávez', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (124, 31, 4, N'Augusto Pinochet', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (125, 32, 1, N'Oxígeno', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (126, 32, 2, N'Silicio', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (127, 32, 3, N'Aluminio', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (128, 32, 4, N'Hierro', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (129, 33, 1, N'Río Congo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (130, 33, 2, N'Río Níger', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (131, 33, 3, N'Río Nilo', 1, NULL)
GO
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (132, 33, 4, N'Río Zambeze', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (133, 34, 1, N'Casablanca', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (134, 34, 2, N'Gone with the Wind', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (135, 34, 3, N'The Godfather', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (136, 34, 4, N'Wings', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (137, 35, 1, N'5', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (138, 35, 2, N'6', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (139, 35, 3, N'7', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (140, 35, 4, N'8', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (141, 36, 1, N'Memento', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (142, 36, 2, N'Inception', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (143, 36, 3, N'Interstellar', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (144, 36, 4, N'Dunkirk', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (145, 37, 1, N'Tenis', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (146, 37, 2, N'Baloncesto', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (147, 37, 3, N'Fútbol', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (148, 37, 4, N'Golf', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (149, 38, 1, N'La Última Cena', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (150, 38, 2, N'Los Girasoles', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (151, 38, 3, N'La Noche Estrellada', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (152, 38, 4, N'El Dormitorio en Arlés', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (153, 39, 1, N'Fotosíntesis', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (154, 39, 2, N'Respiración celular', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (155, 39, 3, N'Digestión', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (156, 39, 4, N'Osmosis', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (157, 40, 1, N'1914', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (158, 40, 2, N'1916', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (159, 40, 3, N'1918', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (160, 40, 4, N'1920', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (161, 41, 1, N'Sahara', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (162, 41, 2, N'Atacama', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (163, 41, 3, N'Kalahari', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (164, 41, 4, N'Gobi', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (169, 43, 1, N'Atletismo', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (170, 43, 2, N'Lanzamiento de martillo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (171, 43, 3, N'Esgrima', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (172, 43, 4, N'Esquí de fondo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (173, 44, 1, N'Oxígeno', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (174, 44, 2, N'Carbono', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (175, 44, 3, N'Silicio', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (176, 44, 4, N'Aluminio', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (177, 45, 1, N'Copa del Mundo de Fútbol', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (178, 45, 2, N'Campeonato Mundial de Ajedrez', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (179, 45, 3, N'Campeonato Mundial de Natación', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (180, 45, 4, N'Copa América de Fútbol', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (181, 46, 1, N'Imperio Bizantino', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (182, 46, 2, N'Imperio Romano', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (183, 46, 3, N'Imperio Mongol', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (184, 46, 4, N'Imperio Persa', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (185, 47, 1, N'Monte Kilimanjaro', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (186, 47, 2, N'Monte Elbrus', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (187, 47, 3, N'Monte Kenia', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (188, 47, 4, N'Monte Toubkal', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (189, 48, 1, N'Robert Downey Jr.', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (190, 48, 2, N'Chris Hemsworth', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (191, 48, 3, N'Chris Evans', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (192, 48, 4, N'Mark Ruffalo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (193, 49, 1, N'La Mona Lisa', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (194, 49, 2, N'La Joven de la Perla', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (195, 49, 3, N'La Venus de Milo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (196, 49, 4, N'El Nacimiento de Venus', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (197, 50, 1, N'Genghis Khan', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (198, 50, 2, N'Napoleón Bonaparte', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (199, 50, 3, N'Julio César', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (200, 50, 4, N'Alejandro Magno', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (201, 51, 1, N'Océano Pacífico', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (202, 51, 2, N'Océano Atlántico', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (203, 51, 3, N'Océano Índico', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (204, 51, 4, N'Océano Ártico', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (205, 52, 1, N'1896', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (206, 52, 2, N'1900', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (207, 52, 3, N'1912', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (208, 52, 4, N'1924', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (213, 54, 1, N'Páncreas', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (214, 54, 2, N'Hígado', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (215, 54, 3, N'Riñones', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (216, 54, 4, N'Cerebro', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (217, 66, 1, N'Bizancio', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (218, 66, 2, N'Constantinopla', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (219, 66, 3, N'Troya', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (220, 66, 4, N'Esmirna', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (221, 67, 1, N'Alejandro Magno', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (222, 67, 2, N'Genghis Khan', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (223, 67, 3, N'Julio César', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (225, 67, 4, N'Napoleón Bonaparte', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (227, 68, 1, N'Electrón', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (228, 68, 2, N'Positrón', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (229, 68, 3, N'Neutrón', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (230, 68, 4, N'Protón', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (231, 69, 1, N'Fósforo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (233, 69, 2, N'Mercurio', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (234, 69, 3, N'Kriptón', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (235, 69, 4, N'Bario', 0, NULL)
SET IDENTITY_INSERT [dbo].[Respuesta] OFF
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Categoria] FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[Categoria] ([IDCategoria])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Categoria]
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Dificultades] FOREIGN KEY([IDDificultad])
REFERENCES [dbo].[Dificultad] ([IDDificultad])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Dificultades]
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuesta_Pregunta] FOREIGN KEY([IDPregunta])
REFERENCES [dbo].[Pregunta] ([IDPregunta])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuesta_Pregunta]
GO
USE [master]
GO
ALTER DATABASE [PreguntadOrt] SET  READ_WRITE 
GO
