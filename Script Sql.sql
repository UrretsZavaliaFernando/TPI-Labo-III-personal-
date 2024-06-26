USE [master]
GO
/****** Object:  Database [juegoEstanciero]    Script Date: 5/4/2024 4:05:18 PM ******/
CREATE DATABASE [juegoEstanciero]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'juegoEstanciero', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\juegoEstanciero.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'juegoEstanciero_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\juegoEstanciero_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [juegoEstanciero] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [juegoEstanciero].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [juegoEstanciero] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [juegoEstanciero] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [juegoEstanciero] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [juegoEstanciero] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [juegoEstanciero] SET ARITHABORT OFF 
GO
ALTER DATABASE [juegoEstanciero] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [juegoEstanciero] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [juegoEstanciero] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [juegoEstanciero] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [juegoEstanciero] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [juegoEstanciero] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [juegoEstanciero] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [juegoEstanciero] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [juegoEstanciero] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [juegoEstanciero] SET  ENABLE_BROKER 
GO
ALTER DATABASE [juegoEstanciero] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [juegoEstanciero] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [juegoEstanciero] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [juegoEstanciero] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [juegoEstanciero] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [juegoEstanciero] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [juegoEstanciero] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [juegoEstanciero] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [juegoEstanciero] SET  MULTI_USER 
GO
ALTER DATABASE [juegoEstanciero] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [juegoEstanciero] SET DB_CHAINING OFF 
GO
ALTER DATABASE [juegoEstanciero] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [juegoEstanciero] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [juegoEstanciero] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [juegoEstanciero] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [juegoEstanciero] SET QUERY_STORE = ON
GO
ALTER DATABASE [juegoEstanciero] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
eUSE [juegoEstanciero]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[Id_Bank] [int] IDENTITY(1,1) NOT NULL,
	[Deeds_list] [int] NULL,
	[Ranchs_available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Bank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bot_Type]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bot_Type](
	[Id_bot_type] [int] IDENTITY(1,1) NOT NULL,
	[Fk_id_difficulty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_bot_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Box]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Box](
	[Id_box] [int] IDENTITY(1,1) NOT NULL,
	[Number_Box] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_box] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deed]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deed](
	[Id_deed] [int] IDENTITY(1,1) NOT NULL,
	[Description_deed] [varchar](50) NULL,
	[Rent] [money] NULL,
	[Ranchs] [int] NULL,
	[Price] [int] NULL,
	[Price_deed] [int] NULL,
	[State_mortgage] [bit] NULL,
	[Mortgage_Price] [int] NULL,
	[Fk_id_box] [int] NULL,
	[Fk_id_deed_type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_deed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deed_Type]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deed_Type](
	[Id_Deed_Type] [int] IDENTITY(1,1) NOT NULL,
	[Description_deed_type] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Deed_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destiny_Luck]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destiny_Luck](
	[Id_destiny_luck] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Description_destiny_luck] [varchar](30) NULL,
	[Fk_id_box] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Difficulty_Description]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Difficulty_Description](
	[Id_description] [int] IDENTITY(1,1) NOT NULL,
	[Description_difficulty] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Id_game] [int] IDENTITY(1,1) NOT NULL,
	[Fk_id_game_state] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_game] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_Bank]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_Bank](
	[Id_game_bank] [int] IDENTITY(1,1) NOT NULL,
	[Fk_id_game] [int] NULL,
	[Fk_id_bank] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_game_bank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_Player]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_Player](
	[Id_game_player] [int] IDENTITY(1,1) NOT NULL,
	[Fk_id_player] [int] NULL,
	[Fk_id_game] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_Player_Box]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_Player_Box](
	[Id_game_player_box] [int] IDENTITY(1,1) NOT NULL,
	[Fk_id_player] [int] NULL,
	[Fk_id_game] [int] NULL,
	[Fk_id_box] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_State]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_State](
	[Id_game_state] [int] IDENTITY(1,1) NOT NULL,
	[Description_game_state] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_game_state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player_Deed]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player_Deed](
	[Id_deed] [int] IDENTITY(1,1) NOT NULL,
	[Fk_id_player] [int] NULL,
	[Fk_id_deed] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_deed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 5/4/2024 4:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Id_player] [int] IDENTITY(1,1) NOT NULL,
	[Name_player] [varchar](30) NULL,
	[Money_player] [money] NULL,
	[Fk_id_bot_type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_player] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bot_Type]  WITH CHECK ADD FOREIGN KEY([Fk_id_difficulty])
REFERENCES [dbo].[Difficulty_Description] ([Id_description])
GO
ALTER TABLE [dbo].[Deed]  WITH CHECK ADD FOREIGN KEY([Fk_id_box])
REFERENCES [dbo].[Box] ([Id_box])
GO
ALTER TABLE [dbo].[Deed]  WITH CHECK ADD FOREIGN KEY([Fk_id_deed_type])
REFERENCES [dbo].[Deed_Type] ([Id_Deed_Type])
GO
ALTER TABLE [dbo].[Destiny_Luck]  WITH CHECK ADD FOREIGN KEY([Fk_id_box])
REFERENCES [dbo].[Box] ([Id_box])
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD FOREIGN KEY([Fk_id_game_state])
REFERENCES [dbo].[Game_State] ([Id_game_state])
GO
ALTER TABLE [dbo].[Game_Bank]  WITH CHECK ADD FOREIGN KEY([Fk_id_game])
REFERENCES [dbo].[Game] ([Id_game])
GO
ALTER TABLE [dbo].[Game_Bank]  WITH CHECK ADD FOREIGN KEY([Fk_id_bank])
REFERENCES [dbo].[Bank] ([Id_Bank])
GO
ALTER TABLE [dbo].[Game_Player]  WITH CHECK ADD FOREIGN KEY([Fk_id_game])
REFERENCES [dbo].[Game] ([Id_game])
GO
ALTER TABLE [dbo].[Game_Player]  WITH CHECK ADD FOREIGN KEY([Fk_id_player])
REFERENCES [dbo].[Players] ([Id_player])
GO
ALTER TABLE [dbo].[Game_Player_Box]  WITH CHECK ADD FOREIGN KEY([Fk_id_box])
REFERENCES [dbo].[Box] ([Id_box])
GO
ALTER TABLE [dbo].[Game_Player_Box]  WITH CHECK ADD FOREIGN KEY([Fk_id_game])
REFERENCES [dbo].[Game] ([Id_game])
GO
ALTER TABLE [dbo].[Game_Player_Box]  WITH CHECK ADD FOREIGN KEY([Fk_id_player])
REFERENCES [dbo].[Players] ([Id_player])
GO
ALTER TABLE [dbo].[Player_Deed]  WITH CHECK ADD FOREIGN KEY([Fk_id_deed])
REFERENCES [dbo].[Deed] ([Id_deed])
GO
ALTER TABLE [dbo].[Player_Deed]  WITH CHECK ADD FOREIGN KEY([Fk_id_player])
REFERENCES [dbo].[Players] ([Id_player])
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD FOREIGN KEY([Fk_id_bot_type])
REFERENCES [dbo].[Bot_Type] ([Id_bot_type])
GO
USE [master]
GO
ALTER DATABASE [juegoEstanciero] SET  READ_WRITE 
GO
