USE [master]
GO
/****** Object:  Database [AnketHazırlama]    Script Date: 8.05.2023 19:38:52 ******/
CREATE DATABASE [AnketHazırlama]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AnketHazırlama', FILENAME = N'D:\sql server 2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\AnketHazırlama.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AnketHazırlama_log', FILENAME = N'D:\sql server 2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\AnketHazırlama_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AnketHazırlama] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AnketHazırlama].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AnketHazırlama] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AnketHazırlama] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AnketHazırlama] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AnketHazırlama] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AnketHazırlama] SET ARITHABORT OFF 
GO
ALTER DATABASE [AnketHazırlama] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AnketHazırlama] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AnketHazırlama] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AnketHazırlama] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AnketHazırlama] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AnketHazırlama] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AnketHazırlama] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AnketHazırlama] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AnketHazırlama] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AnketHazırlama] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AnketHazırlama] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AnketHazırlama] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AnketHazırlama] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AnketHazırlama] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AnketHazırlama] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AnketHazırlama] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AnketHazırlama] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AnketHazırlama] SET RECOVERY FULL 
GO
ALTER DATABASE [AnketHazırlama] SET  MULTI_USER 
GO
ALTER DATABASE [AnketHazırlama] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AnketHazırlama] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AnketHazırlama] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AnketHazırlama] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AnketHazırlama] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AnketHazırlama] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AnketHazırlama', N'ON'
GO
ALTER DATABASE [AnketHazırlama] SET QUERY_STORE = ON
GO
ALTER DATABASE [AnketHazırlama] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AnketHazırlama]
GO
/****** Object:  Schema [AnketYapma]    Script Date: 8.05.2023 19:38:52 ******/
CREATE SCHEMA [AnketYapma]
GO
/****** Object:  Table [dbo].[Anketler]    Script Date: 8.05.2023 19:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anketler](
	[AnketID] [int] NOT NULL,
	[Başlık] [nchar](100) NOT NULL,
	[Açıklama] [nchar](500) NOT NULL,
	[KullanıcıID] [int] NOT NULL,
 CONSTRAINT [PK_Anketler] PRIMARY KEY CLUSTERED 
(
	[AnketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanıcılar]    Script Date: 8.05.2023 19:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanıcılar](
	[KullanıcıID] [int] NOT NULL,
	[KullanıcıAdı] [nchar](50) NOT NULL,
	[Sifre] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Kullanıcılar] PRIMARY KEY CLUSTERED 
(
	[KullanıcıID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Secenekler]    Script Date: 8.05.2023 19:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Secenekler](
	[SecenekID] [int] NOT NULL,
	[SoruID] [int] NOT NULL,
	[SecenekMetni] [nchar](300) NOT NULL,
 CONSTRAINT [PK_Secenekler] PRIMARY KEY CLUSTERED 
(
	[SecenekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sorular]    Script Date: 8.05.2023 19:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sorular](
	[soruID] [int] NOT NULL,
	[AnketID] [int] NOT NULL,
	[SoruMetni] [nchar](500) NOT NULL,
 CONSTRAINT [PK_Sorular] PRIMARY KEY CLUSTERED 
(
	[soruID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yanitlar]    Script Date: 8.05.2023 19:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yanitlar](
	[YanitID] [int] NOT NULL,
	[AnketID] [int] NOT NULL,
	[KullanıcıID] [int] NOT NULL,
	[soruID] [int] NOT NULL,
	[SecenekID] [int] NOT NULL,
 CONSTRAINT [PK_Yanitlar] PRIMARY KEY CLUSTERED 
(
	[YanitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yöneticiler]    Script Date: 8.05.2023 19:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yöneticiler](
	[YöneticiID] [int] NOT NULL,
	[KullanıcıAdı] [nchar](50) NOT NULL,
	[Sifre] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Yöneticiler] PRIMARY KEY CLUSTERED 
(
	[YöneticiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Anketler]  WITH CHECK ADD  CONSTRAINT [FK_Anketler_Kullanıcılar] FOREIGN KEY([KullanıcıID])
REFERENCES [dbo].[Kullanıcılar] ([KullanıcıID])
GO
ALTER TABLE [dbo].[Anketler] CHECK CONSTRAINT [FK_Anketler_Kullanıcılar]
GO
ALTER TABLE [dbo].[Sorular]  WITH CHECK ADD  CONSTRAINT [FK_Sorular_Anketler] FOREIGN KEY([AnketID])
REFERENCES [dbo].[Anketler] ([AnketID])
GO
ALTER TABLE [dbo].[Sorular] CHECK CONSTRAINT [FK_Sorular_Anketler]
GO
ALTER TABLE [dbo].[Yanitlar]  WITH CHECK ADD  CONSTRAINT [FK_Yanitlar_Anketler] FOREIGN KEY([AnketID])
REFERENCES [dbo].[Anketler] ([AnketID])
GO
ALTER TABLE [dbo].[Yanitlar] CHECK CONSTRAINT [FK_Yanitlar_Anketler]
GO
ALTER TABLE [dbo].[Yanitlar]  WITH CHECK ADD  CONSTRAINT [FK_Yanitlar_Kullanıcılar] FOREIGN KEY([KullanıcıID])
REFERENCES [dbo].[Kullanıcılar] ([KullanıcıID])
GO
ALTER TABLE [dbo].[Yanitlar] CHECK CONSTRAINT [FK_Yanitlar_Kullanıcılar]
GO
ALTER TABLE [dbo].[Yanitlar]  WITH CHECK ADD  CONSTRAINT [FK_Yanitlar_Secenekler] FOREIGN KEY([SecenekID])
REFERENCES [dbo].[Secenekler] ([SecenekID])
GO
ALTER TABLE [dbo].[Yanitlar] CHECK CONSTRAINT [FK_Yanitlar_Secenekler]
GO
ALTER TABLE [dbo].[Yanitlar]  WITH CHECK ADD  CONSTRAINT [FK_Yanitlar_Sorular] FOREIGN KEY([soruID])
REFERENCES [dbo].[Sorular] ([soruID])
GO
ALTER TABLE [dbo].[Yanitlar] CHECK CONSTRAINT [FK_Yanitlar_Sorular]
GO
USE [master]
GO
ALTER DATABASE [AnketHazırlama] SET  READ_WRITE 
GO
