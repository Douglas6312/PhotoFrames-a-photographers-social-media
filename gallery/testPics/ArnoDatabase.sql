USE [master]
GO
/****** Object:  Database [EcoImpact]    Script Date: 2020/11/09 11:12:08 ******/
CREATE DATABASE [EcoImpact]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcoImpact', FILENAME = N'D:\SQL Data\Data\EcoImpact.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcoImpact_log', FILENAME = N'D:\SQL Data\Data\EcoImpact_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EcoImpact] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcoImpact].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcoImpact] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcoImpact] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcoImpact] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcoImpact] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcoImpact] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcoImpact] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EcoImpact] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcoImpact] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcoImpact] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcoImpact] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcoImpact] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcoImpact] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcoImpact] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcoImpact] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcoImpact] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EcoImpact] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcoImpact] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcoImpact] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcoImpact] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcoImpact] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcoImpact] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcoImpact] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcoImpact] SET RECOVERY FULL 
GO
ALTER DATABASE [EcoImpact] SET  MULTI_USER 
GO
ALTER DATABASE [EcoImpact] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcoImpact] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcoImpact] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcoImpact] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcoImpact] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EcoImpact', N'ON'
GO
ALTER DATABASE [EcoImpact] SET QUERY_STORE = OFF
GO
USE [EcoImpact]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[ActivityID] [smallint] IDENTITY(1,1) NOT NULL,
	[CategoryID] [smallint] NOT NULL,
	[Description] [nchar](60) NOT NULL,
	[Points] [smallint] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Badge]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Badge](
	[BadgeID] [smallint] IDENTITY(1,1) NOT NULL,
	[ImageID] [smallint] NOT NULL,
	[Description] [nchar](25) NOT NULL,
 CONSTRAINT [PK_Badge] PRIMARY KEY CLUSTERED 
(
	[BadgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryMaster](
	[CategoryID] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](20) NOT NULL,
 CONSTRAINT [PK_CategoryMaster] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[ImageID] [smallint] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follower]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follower](
	[FollowerID] [smallint] IDENTITY(1,1) NOT NULL,
	[UserID] [smallint] NOT NULL,
	[FriendID] [smallint] NOT NULL,
 CONSTRAINT [PK_Follower] PRIMARY KEY CLUSTERED 
(
	[FollowerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Follower] UNIQUE NONCLUSTERED 
(
	[FriendID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](8) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageID] [smallint] IDENTITY(1,1) NOT NULL,
	[TypeID] [smallint] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Path] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageType]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageType](
	[TypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ImageType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[League]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[League](
	[LeagueID] [smallint] IDENTITY(1,1) NOT NULL,
	[LeagueName] [nchar](15) NOT NULL,
 CONSTRAINT [PK_League] PRIMARY KEY CLUSTERED 
(
	[LeagueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [smallint] IDENTITY(1,1) NOT NULL,
	[ImageID] [smallint] NOT NULL,
	[Desctiption] [nchar](60) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Hyperlink] [nchar](100) NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityQuestion]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityQuestion](
	[SecurityID] [smallint] IDENTITY(1,1) NOT NULL,
	[Question] [nchar](50) NOT NULL,
 CONSTRAINT [PK_SecurityQuestion] PRIMARY KEY CLUSTERED 
(
	[SecurityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[SurveyID] [smallint] IDENTITY(1,1) NOT NULL,
	[Question] [nchar](50) NOT NULL,
	[Points] [smallint] NOT NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[SurveyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tip]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tip](
	[TipID] [smallint] IDENTITY(1,1) NOT NULL,
	[CategoryID] [smallint] NOT NULL,
	[Description] [nchar](60) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_Tip] PRIMARY KEY CLUSTERED 
(
	[TipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserActivity]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivity](
	[UserActivityID] [smallint] IDENTITY(1,1) NOT NULL,
	[UserID] [smallint] NOT NULL,
	[ActivityID] [smallint] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_UserActivity] PRIMARY KEY CLUSTERED 
(
	[UserActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_UserActivity] UNIQUE NONCLUSTERED 
(
	[ActivityID] ASC,
	[UserID] ASC,
	[Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBadge]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBadge](
	[UserBadgeID] [smallint] IDENTITY(1,1) NOT NULL,
	[UserID] [smallint] NOT NULL,
	[BadgeID] [smallint] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_UserBadge] PRIMARY KEY CLUSTERED 
(
	[UserBadgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_UserBadge] UNIQUE NONCLUSTERED 
(
	[BadgeID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLeague]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLeague](
	[UserLeagueID] [smallint] IDENTITY(1,1) NOT NULL,
	[UserID] [smallint] NOT NULL,
	[LeagueID] [smallint] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Position] [smallint] NOT NULL,
 CONSTRAINT [PK_UserLeague] PRIMARY KEY CLUSTERED 
(
	[UserLeagueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_UserLeague] UNIQUE NONCLUSTERED 
(
	[LeagueID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserID] [smallint] IDENTITY(1,1) NOT NULL,
	[CountryID] [smallint] NOT NULL,
	[GenderID] [smallint] NOT NULL,
	[SecurityID] [smallint] NOT NULL,
	[ImageID] [smallint] NOT NULL,
	[LeagueLevel] [smallint] NOT NULL,
	[TypeID] [smallint] NOT NULL,
	[Username] [nchar](20) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[Password] [nchar](64) NOT NULL,
	[SecurityAnswer] [nchar](50) NULL,
	[Multiplier] [smallint] NULL,
	[DailyGoal] [smallint] NULL,
	[Streak] [smallint] NULL,
	[Privacy] [bit] NOT NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSurvey]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSurvey](
	[UserID] [smallint] NOT NULL,
	[SurveyID] [smallint] NOT NULL,
 CONSTRAINT [PK_UserSurvey] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[SurveyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 2020/11/09 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[TypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](10) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserMaster]    Script Date: 2020/11/09 11:12:08 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserMaster] ON [dbo].[UserMaster]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserMaster_1]    Script Date: 2020/11/09 11:12:08 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserMaster_1] ON [dbo].[UserMaster]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_CategoryMaster] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[CategoryMaster] ([CategoryID])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_CategoryMaster]
GO
ALTER TABLE [dbo].[Badge]  WITH CHECK ADD  CONSTRAINT [FK_Badge_Image] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Image] ([ImageID])
GO
ALTER TABLE [dbo].[Badge] CHECK CONSTRAINT [FK_Badge_Image]
GO
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK_Follower_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK_Follower_UserMaster]
GO
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK_Follower_UserMaster1] FOREIGN KEY([FriendID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK_Follower_UserMaster1]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_ImageType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ImageType] ([TypeID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_ImageType]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Image] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Image] ([ImageID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Image]
GO
ALTER TABLE [dbo].[Tip]  WITH CHECK ADD  CONSTRAINT [FK_Tip_CategoryMaster] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[CategoryMaster] ([CategoryID])
GO
ALTER TABLE [dbo].[Tip] CHECK CONSTRAINT [FK_Tip_CategoryMaster]
GO
ALTER TABLE [dbo].[UserActivity]  WITH CHECK ADD  CONSTRAINT [FK_UserActivity_Activity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[Activity] ([ActivityID])
GO
ALTER TABLE [dbo].[UserActivity] CHECK CONSTRAINT [FK_UserActivity_Activity]
GO
ALTER TABLE [dbo].[UserActivity]  WITH CHECK ADD  CONSTRAINT [FK_UserActivity_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[UserActivity] CHECK CONSTRAINT [FK_UserActivity_UserMaster]
GO
ALTER TABLE [dbo].[UserBadge]  WITH CHECK ADD  CONSTRAINT [FK_UserBadge_Badge] FOREIGN KEY([BadgeID])
REFERENCES [dbo].[Badge] ([BadgeID])
GO
ALTER TABLE [dbo].[UserBadge] CHECK CONSTRAINT [FK_UserBadge_Badge]
GO
ALTER TABLE [dbo].[UserBadge]  WITH CHECK ADD  CONSTRAINT [FK_UserBadge_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[UserBadge] CHECK CONSTRAINT [FK_UserBadge_UserMaster]
GO
ALTER TABLE [dbo].[UserLeague]  WITH CHECK ADD  CONSTRAINT [FK_UserLeague_League] FOREIGN KEY([LeagueID])
REFERENCES [dbo].[League] ([LeagueID])
GO
ALTER TABLE [dbo].[UserLeague] CHECK CONSTRAINT [FK_UserLeague_League]
GO
ALTER TABLE [dbo].[UserLeague]  WITH CHECK ADD  CONSTRAINT [FK_UserLeague_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[UserLeague] CHECK CONSTRAINT [FK_UserLeague_UserMaster]
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_Country]
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_Gender]
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_Image] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Image] ([ImageID])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_Image]
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_League] FOREIGN KEY([LeagueLevel])
REFERENCES [dbo].[League] ([LeagueID])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_League]
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_SecurityQuestion] FOREIGN KEY([SecurityID])
REFERENCES [dbo].[SecurityQuestion] ([SecurityID])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_SecurityQuestion]
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD  CONSTRAINT [FK_UserMaster_UserType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[UserType] ([TypeID])
GO
ALTER TABLE [dbo].[UserMaster] CHECK CONSTRAINT [FK_UserMaster_UserType]
GO
ALTER TABLE [dbo].[UserSurvey]  WITH CHECK ADD  CONSTRAINT [FK_UserSurvey_Survey] FOREIGN KEY([SurveyID])
REFERENCES [dbo].[Survey] ([SurveyID])
GO
ALTER TABLE [dbo].[UserSurvey] CHECK CONSTRAINT [FK_UserSurvey_Survey]
GO
ALTER TABLE [dbo].[UserSurvey]  WITH CHECK ADD  CONSTRAINT [FK_UserSurvey_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[UserSurvey] CHECK CONSTRAINT [FK_UserSurvey_UserMaster]
GO
USE [master]
GO
ALTER DATABASE [EcoImpact] SET  READ_WRITE 
GO
