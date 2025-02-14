USE [master]
GO
/****** Object:  Database [Forum_BL5]    Script Date: 4/27/2024 10:10:34 AM ******/
CREATE DATABASE [Forum_BL5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Forum_BL5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Forum_BL5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Forum_BL5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Forum_BL5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Forum_BL5] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Forum_BL5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Forum_BL5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Forum_BL5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Forum_BL5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Forum_BL5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Forum_BL5] SET ARITHABORT OFF 
GO
ALTER DATABASE [Forum_BL5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Forum_BL5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Forum_BL5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Forum_BL5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Forum_BL5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Forum_BL5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Forum_BL5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Forum_BL5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Forum_BL5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Forum_BL5] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Forum_BL5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Forum_BL5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Forum_BL5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Forum_BL5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Forum_BL5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Forum_BL5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Forum_BL5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Forum_BL5] SET RECOVERY FULL 
GO
ALTER DATABASE [Forum_BL5] SET  MULTI_USER 
GO
ALTER DATABASE [Forum_BL5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Forum_BL5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Forum_BL5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Forum_BL5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Forum_BL5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Forum_BL5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Forum_BL5', N'ON'
GO
ALTER DATABASE [Forum_BL5] SET QUERY_STORE = ON
GO
ALTER DATABASE [Forum_BL5] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Forum_BL5]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 4/27/2024 10:10:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NULL,
	[content] [text] NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 4/27/2024 10:10:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[topicID] [int] NULL,
	[title] [nvarchar](255) NULL,
	[content] [text] NOT NULL,
	[createdAt] [datetime] NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 4/27/2024 10:10:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[topicID] [int] IDENTITY(1,1) NOT NULL,
	[tag] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Topics__72C15B2144474F42] PRIMARY KEY CLUSTERED 
(
	[topicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/27/2024 10:10:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [int] NOT NULL,
	[isBan] [bit] NOT NULL,
	[isEnable] [bit] NOT NULL,
 CONSTRAINT [PK__Users__1788CCAC34CCC738] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (1, 5, N'Great post! Thanks for sharing.', N'JohnDoe')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (2, 6, N'I have a question about this topic.', N'JaneSmith')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (3, 7, N'This is really helpful. I learned a lot.', N'MikeJohnson')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (4, 12, N'Can someone provide more information on this?', N'EmilyBrown')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (5, 16, N'I disagree with the point you made here.', N'DavidClark')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (6, 16, N'Excellent explanation!', N'SarahLee')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (7, 16, N'Another comment on postID 16.', N'Alice')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (8, 16, N'Yet another comment on postID 16.', N'Bob')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (9, 17, N'I''m having trouble understanding this part.', N'ChrisJones')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (10, 17, N'This topic is very interesting.', N'AnnaTaylor')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (11, 17, N'Additional comment on postID 17.', N'Ella')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (12, 17, N'Another additional comment on postID 17.', N'Frank')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (13, 18, N'Thanks for clarifying that.', N'RobertWong')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (14, 18, N'I completely agree with your viewpoint.', N'LauraSmith')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (15, 18, N'Another viewpoint on postID 18.', N'Grace')
INSERT [dbo].[Comments] ([commentID], [postID], [content], [name]) VALUES (16, 18, N'Yet another viewpoint on postID 18.', N'Henry')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([postID], [topicID], [title], [content], [createdAt], [name]) VALUES (5, 1, N'New Post Title 1', N'Content of the first new post.', CAST(N'2024-04-24T15:00:00.000' AS DateTime), N'new')
INSERT [dbo].[Posts] ([postID], [topicID], [title], [content], [createdAt], [name]) VALUES (6, 2, N'New Post Title 2', N'Content of the second new post.', CAST(N'2024-04-24T15:30:00.000' AS DateTime), N'new2')
INSERT [dbo].[Posts] ([postID], [topicID], [title], [content], [createdAt], [name]) VALUES (7, 2, N'New Post Title 3', N'Content of the third new post.', CAST(N'2024-04-24T16:00:00.000' AS DateTime), N'hello')
INSERT [dbo].[Posts] ([postID], [topicID], [title], [content], [createdAt], [name]) VALUES (12, 2, NULL, N'good', CAST(N'2024-04-25T10:39:11.987' AS DateTime), NULL)
INSERT [dbo].[Posts] ([postID], [topicID], [title], [content], [createdAt], [name]) VALUES (14, 1, NULL, N'123', CAST(N'2024-04-25T10:47:39.277' AS DateTime), NULL)
INSERT [dbo].[Posts] ([postID], [topicID], [title], [content], [createdAt], [name]) VALUES (15, 1, N'123', N'123', CAST(N'2024-04-25T10:49:07.730' AS DateTime), NULL)
INSERT [dbo].[Posts] ([postID], [topicID], [title], [content], [createdAt], [name]) VALUES (16, 2, N'123', N'213213123', CAST(N'2024-04-25T10:52:55.953' AS DateTime), N'new')
INSERT [dbo].[Posts] ([postID], [topicID], [title], [content], [createdAt], [name]) VALUES (17, 2, N'ok', N'ok anh dung', CAST(N'2024-04-25T10:53:15.483' AS DateTime), N'new')
INSERT [dbo].[Posts] ([postID], [topicID], [title], [content], [createdAt], [name]) VALUES (18, 1, N'ok', N'123', CAST(N'2024-04-25T10:59:10.823' AS DateTime), N'new')
INSERT [dbo].[Posts] ([postID], [topicID], [title], [content], [createdAt], [name]) VALUES (21, 4, N'hello ne', N'day la hello', CAST(N'2024-04-25T11:46:15.923' AS DateTime), N'hello')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([topicID], [tag]) VALUES (1, N'123')
INSERT [dbo].[Topics] ([topicID], [tag]) VALUES (2, N'ok')
INSERT [dbo].[Topics] ([topicID], [tag]) VALUES (3, N'123')
INSERT [dbo].[Topics] ([topicID], [tag]) VALUES (4, N'abc')
INSERT [dbo].[Topics] ([topicID], [tag]) VALUES (5, N'ok123')
SET IDENTITY_INSERT [dbo].[Topics] OFF
GO
INSERT [dbo].[Users] ([username], [email], [password], [role], [isBan], [isEnable]) VALUES (N'abc', N'abc@gmail.com', N'123', 0, 0, 0)
INSERT [dbo].[Users] ([username], [email], [password], [role], [isBan], [isEnable]) VALUES (N'admin', N'admin@gmail.com', N'123', 1, 0, 1)
INSERT [dbo].[Users] ([username], [email], [password], [role], [isBan], [isEnable]) VALUES (N'asd', N'asd', N'asd', 0, 0, 0)
INSERT [dbo].[Users] ([username], [email], [password], [role], [isBan], [isEnable]) VALUES (N'hello', N'ok@gmail.com', N'ok', 0, 0, 0)
INSERT [dbo].[Users] ([username], [email], [password], [role], [isBan], [isEnable]) VALUES (N'hola', N'alo@gmail.com', N'123', 0, 0, 0)
INSERT [dbo].[Users] ([username], [email], [password], [role], [isBan], [isEnable]) VALUES (N'new', N'new@gmail.com', N'123', 0, 0, 0)
INSERT [dbo].[Users] ([username], [email], [password], [role], [isBan], [isEnable]) VALUES (N'new1', N'new1@gmail.com', N'123', 0, 0, 0)
INSERT [dbo].[Users] ([username], [email], [password], [role], [isBan], [isEnable]) VALUES (N'new123', N'123@gmail.com', N'123', 0, 0, 0)
INSERT [dbo].[Users] ([username], [email], [password], [role], [isBan], [isEnable]) VALUES (N'new2', N'new12@gmail.com', N'1', 0, 0, 0)
INSERT [dbo].[Users] ([username], [email], [password], [role], [isBan], [isEnable]) VALUES (N'new3', N'new11@gmail.com', N'123', 0, 0, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E42DBA5821]    Script Date: 4/27/2024 10:10:35 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[Posts] ([postID])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK__Posts__topicID__72C60C4A] FOREIGN KEY([topicID])
REFERENCES [dbo].[Topics] ([topicID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK__Posts__topicID__72C60C4A]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([name])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
USE [master]
GO
ALTER DATABASE [Forum_BL5] SET  READ_WRITE 
GO
