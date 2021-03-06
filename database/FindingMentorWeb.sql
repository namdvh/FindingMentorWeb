USE [FindingMentor]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 11/26/2021 2:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryID] [nvarchar](10) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChapter]    Script Date: 11/26/2021 2:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChapter](
	[ChapterID] [int] IDENTITY(0,1) NOT NULL,
	[SubjectID] [int] NULL,
	[ChapterName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ChapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContent]    Script Date: 11/26/2021 2:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContent](
	[ContentID] [int] IDENTITY(0,1) NOT NULL,
	[ChapterID] [int] NULL,
	[VideoURL] [nvarchar](200) NULL,
	[Blog] [nvarchar](max) NULL,
	[ContentName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedBack]    Script Date: 11/26/2021 2:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedBack](
	[UserID] [nvarchar](50) NULL,
	[FeedbackContent] [nvarchar](max) NOT NULL,
	[Stars] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegister]    Script Date: 11/26/2021 2:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegister](
	[SubjectID] [int] NULL,
	[UserID] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRequestMentor]    Script Date: 11/26/2021 2:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRequestMentor](
	[RequestID] [int] IDENTITY(0,1) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Certificate] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRequestSubject]    Script Date: 11/26/2021 2:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRequestSubject](
	[RequestCourseID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[CourseName] [nvarchar](50) NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Images] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK__tblReque__2F85427E19C0D2DF] PRIMARY KEY CLUSTERED 
(
	[RequestCourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 11/26/2021 2:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleID] [nvarchar](10) NOT NULL,
	[RoleName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 11/26/2021 2:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubject](
	[SubjectID] [int] IDENTITY(0,1) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
	[Images] [nvarchar](200) NULL,
	[UserID] [nvarchar](50) NULL,
	[CategoryID] [nvarchar](10) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 11/26/2021 2:02:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[RoleID] [nvarchar](10) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Certificate] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[BirthDay] [date] NULL,
	[Images] [nvarchar](max) NULL,
 CONSTRAINT [PK__tblUser__1788CCAC627F4344] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName]) VALUES (N'CSS', N'CSS')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName]) VALUES (N'JS', N'Javascript')
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName]) VALUES (N'Web', N'Web')
GO
SET IDENTITY_INSERT [dbo].[tblChapter] ON 

INSERT [dbo].[tblChapter] ([ChapterID], [SubjectID], [ChapterName], [Description]) VALUES (15, 28, N'VATLIIIIIIIIIIIIIIIIIIIiiiiiiiiiiiiiiiiiiiiiiiiiii', N'aaaaaaaaaaaaaaaaaaaaaaaa')
INSERT [dbo].[tblChapter] ([ChapterID], [SubjectID], [ChapterName], [Description]) VALUES (16, 40, N'adsas', N'asdasdas')
INSERT [dbo].[tblChapter] ([ChapterID], [SubjectID], [ChapterName], [Description]) VALUES (17, 42, N'Chapter 1', N'asdsadsadsadasaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
INSERT [dbo].[tblChapter] ([ChapterID], [SubjectID], [ChapterName], [Description]) VALUES (18, 39, N'asdsadasd', N'asdasdasdsa')
INSERT [dbo].[tblChapter] ([ChapterID], [SubjectID], [ChapterName], [Description]) VALUES (19, 39, N'sadasd', N'3212312')
INSERT [dbo].[tblChapter] ([ChapterID], [SubjectID], [ChapterName], [Description]) VALUES (20, 39, N'asdasd', N'213123')
INSERT [dbo].[tblChapter] ([ChapterID], [SubjectID], [ChapterName], [Description]) VALUES (21, 39, N'asdasd', N'213123')
SET IDENTITY_INSERT [dbo].[tblChapter] OFF
GO
SET IDENTITY_INSERT [dbo].[tblContent] ON 

INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (16, 16, N'https://www.youtube.com/watch?v=kIT1iND15As&ab_cha', N'<p>123asdas</p>', N'sadas')
INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (17, 16, N'https://www.youtube.com/watch?v=1Rs2ND1ryYc', N'<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>', N'sadasdasdas')
INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (18, 17, N'https://www.youtube.com/watch?v=kIT1iND15As&ab_cha', N'<p>123123</p>', N'asdasd')
INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (19, 18, N'https://www.youtube.com/watch?v=QWqMnRNBvAM&ab_channel=RapNh%C3%A0L%C3%A0m', N'<p>ewqeqweqweqweqwweqwewqewqewqe</p>
', N'eqweqweqw')
INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (20, 18, N'https://www.youtube.com/watch?v=kIT1iND15As&ab_cha', N'12312312
', N'dsadsadsa')
INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (21, 19, N'https://www.youtube.com/watch?v=kIT1iND15As&ab_cha', N'<p>sadasdasdsadsadsadas</p>
', N'dsadsadsa')
INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (22, 18, N'https://www.youtube.com/watch?v=kIT1iND15As&ab_cha', N'<p>asdasdsadsadas</p>', N'dsadsadsa')
INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (23, 19, N'https://www.youtube.com/watch?v=1Rs2ND1ryYc', N'<p>dsadasas</p>', N'First Lesson')
INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (24, 18, N'https://www.youtube.com/watch?v=1Rs2ND1ryYc', N'<p>eqwewqe</p>
', N'First Lesson')
INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (25, 19, N'https://www.youtube.com/watch?v=1Rs2ND1ryYc', N'qwewqewqewq', N'dsadsadsa')
INSERT [dbo].[tblContent] ([ContentID], [ChapterID], [VideoURL], [Blog], [ContentName]) VALUES (26, 21, N'https://www.youtube.com/watch?v=g8F23R-P14k&ab_channel=EstudiarDerecho', N'<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
', N'dsadsadsa')
SET IDENTITY_INSERT [dbo].[tblContent] OFF
GO
INSERT [dbo].[tblFeedBack] ([UserID], [FeedbackContent], [Stars]) VALUES (N'mentorr1', N'', 123)
INSERT [dbo].[tblFeedBack] ([UserID], [FeedbackContent], [Stars]) VALUES (N'mentorr', N'', 2322)
INSERT [dbo].[tblFeedBack] ([UserID], [FeedbackContent], [Stars]) VALUES (N'mentor6', N'', 100)
INSERT [dbo].[tblFeedBack] ([UserID], [FeedbackContent], [Stars]) VALUES (N'mentor10', N'', 500)
INSERT [dbo].[tblFeedBack] ([UserID], [FeedbackContent], [Stars]) VALUES (N'mentor100', N'', 1000)
INSERT [dbo].[tblFeedBack] ([UserID], [FeedbackContent], [Stars]) VALUES (N'Mentor7', N'', 500)
INSERT [dbo].[tblFeedBack] ([UserID], [FeedbackContent], [Stars]) VALUES (N'mentor444', N'', 4)
GO
INSERT [dbo].[tblRegister] ([SubjectID], [UserID], [Status], [Name]) VALUES (28, N'se11', 1, N'')
INSERT [dbo].[tblRegister] ([SubjectID], [UserID], [Status], [Name]) VALUES (39, N'Se0112', 1, N'Hoai Nam')
INSERT [dbo].[tblRegister] ([SubjectID], [UserID], [Status], [Name]) VALUES (39, N'men111', 1, N'')
INSERT [dbo].[tblRegister] ([SubjectID], [UserID], [Status], [Name]) VALUES (36, N'Se0112', 1, N'Hoai Nam')
INSERT [dbo].[tblRegister] ([SubjectID], [UserID], [Status], [Name]) VALUES (41, N'Se0112', 1, N'Hoai Nam')
GO
SET IDENTITY_INSERT [dbo].[tblRequestMentor] ON 

INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (0, N'se15', N'namhoaidoan15@gmail.com', N'', NULL, 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (1, N'se1500000', N'namhoaidoan15@gmail.com', N'dsadasdasdas', NULL, 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (3, N'Fanglong', N'Fang.longpc@gmail.com', N'31231313', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (4, N'hoainam@gmail.com', N'hoainam@gmail.com', N'adsads', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (5, N'se112', N'se112', N'', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (6, N'se1134', N'se1134', N'', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (7, N'se11213', N'se11213', N'CV\se11213.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (8, N'se1123', N'se1123', N'CV\se1123.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (9, N'se2001', N'se2001', N'CV\se2001.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (10, N'seee11', N'seee11', N'CV\seee11.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (11, N'hoainam1', N'hoainam1', N'CV\hoainam1.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (15, N'mentor6', N'mentor6', N'CV\mentor6.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (16, N'mentorr', N'mentorr', N'CV\mentorr.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (17, N'mentorr1', N'mentorr1', N'CV\mentorr1.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (18, N'mentor10', N'mentor10', N'CV\mentor10.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (19, N'mentor100', N'mentor100', N'CV\mentor100.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (20, N'Mentor7', N'Mentor7', N'CV\Mentor7.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (21, N'mentor44', N'mentor44', N'CV\mentor44.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (22, N'mentor45', N'mentor45', N'CV\mentor45.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (23, N'mentor55', N'mentor55', N'CV\mentor55.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (24, N'mentor444', N'', N'CV\mentor444.jpg', N'', 0)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (25, N'men111', N'', N'CV\men111.jpg', N'', 1)
INSERT [dbo].[tblRequestMentor] ([RequestID], [UserID], [Name], [Certificate], [Description], [Status]) VALUES (26, N'mentorr304', N'', N'CV\mentorr304.jpg', N'', 1)
SET IDENTITY_INSERT [dbo].[tblRequestMentor] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRequestSubject] ON 

INSERT [dbo].[tblRequestSubject] ([RequestCourseID], [UserID], [CourseName], [CategoryName], [Images], [Description], [Status]) VALUES (1, N'se15', N'Vat li', N'CSS', N'IM\Vat lise15.jpg', N'asdasdasdas', 1)
INSERT [dbo].[tblRequestSubject] ([RequestCourseID], [UserID], [CourseName], [CategoryName], [Images], [Description], [Status]) VALUES (2, N'se15', N'Vat li 1', N'Javascript', N'IM\Vat li 1se15.jpg', N'sadasdasdasd', 1)
INSERT [dbo].[tblRequestSubject] ([RequestCourseID], [UserID], [CourseName], [CategoryName], [Images], [Description], [Status]) VALUES (3, N'se15', N'Vat li 3', N'CSS', N'IM\Vat li 3se15.jpg', N'asdasdasdas', 1)
INSERT [dbo].[tblRequestSubject] ([RequestCourseID], [UserID], [CourseName], [CategoryName], [Images], [Description], [Status]) VALUES (5, N'se15', N'nam11', N'Javascript', N'IM\nam11se15.jpg', N'<p>asd</p>', 1)
INSERT [dbo].[tblRequestSubject] ([RequestCourseID], [UserID], [CourseName], [CategoryName], [Images], [Description], [Status]) VALUES (7, N'mentor444', N'Vat li', N'CSS', N'IM\Vat limentor444.jpg', N'<p>asdasdasdasdasdsa</p>', 1)
INSERT [dbo].[tblRequestSubject] ([RequestCourseID], [UserID], [CourseName], [CategoryName], [Images], [Description], [Status]) VALUES (20, N'mentorr', N'123###', N'Javascript', N'IM\123aaamentorr.jpg', N'<p>asdsadsadsadasdasd12312312</p>
', 1)
SET IDENTITY_INSERT [dbo].[tblRequestSubject] OFF
GO
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (N'MT', N'Mentor')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (N'US', N'User')
GO
SET IDENTITY_INSERT [dbo].[tblSubject] ON 

INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (28, N'Vat li 1', N'SubjectImage\Vat li 1se15.jpg', N'se15', N'JS', N'<p>sadasdasdasd</p>', 0)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (36, N'aaaaa', N'SubjectImage\aaaaahoainam@gmail.com.jpg', N'hoainam@gmail.com', N'CSS', N'<p>123as</p>
', 1)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (37, N'b####', N'SubjectImage\b####hoainam@gmail.com.jpg', N'hoainam@gmail.com', N'CSS', N'<p>asdasd</p>
', 1)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (38, N'dasasdas#', N'dasasdasahoainam@gmail.com.jpg', N'hoainam@gmail.com', N'CSS', N'<p>asdsadasdas</p>', 1)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (39, N'123###', N'SubjectImage\123aaamentorr.jpg', N'mentorr', N'CSS', N'<p>sadsadas111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</p>
', 1)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (40, N'3456##', N'SubjectImage\3456aamentor111.jpg', N'mentor111', N'Web', N'<p>sdadasdasdas1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
', 1)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (41, N'Vat li1111111111111111111111', N'SubjectImage\Vat li1111111111111111111111mentor444.jpg', N'mentor444', N'CSS', N'<p>dasaaaaaaaaaaaaaaaaaaaa</p>', 1)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (42, N'Vat li', N'IM\Vat limentor444.jpg', N'mentor444', N'CSS', N'<p>asdasdasdasdasdsa</p>', 1)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (43, N'Vat li 33', N'IM\Vat li 33mentorr.jpg', N'mentorr', N'JS', NULL, 1)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (44, N'nam11', N'IM\nam11se15.jpg', N'se15', N'JS', N'<p>asd</p>', 1)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (45, N'123##', N'IM\123aaamentorr.jpg', N'mentorr', N'CSS', N'<p>asdsadsadsadasdasd12312312</p>
', 1)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (46, N'b####', N'SubjectImage\baaaamentor10.jpg', N'mentor10', N'CSS', N'<p>sadasdasdsadsadsadsa</p>
', 0)
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectName], [Images], [UserID], [CategoryID], [Description], [Status]) VALUES (47, N'Vat li 33', N'SubjectImage\Vat li 33hoainam@gmail.com.jpg', N'hoainam@gmail.com', N'CSS', N'<p>12312312313</p>
', 1)
SET IDENTITY_INSERT [dbo].[tblSubject] OFF
GO
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'12345', N'', N'namhoaidoan1511@gmail.com', N'US', N'1234567899', N'131231232', N'Hoainam1@', N'asdasdadas', 1, CAST(N'1900-01-01' AS Date), NULL)
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'Fanglong', N'', N'Fang.longpc@gmail.com', N'US', N'', N'', N'Cunplong115@', N'31231313', 1, CAST(N'1900-01-01' AS Date), NULL)
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'hoainam@gmail.com', N'', N'hoainam@gmail.com', N'MT', N'', N'', N'Hoainam1@', N'adsads', 1, CAST(N'1900-01-01' AS Date), NULL)
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'hoainam1', N'', N'hoainam1', N'MT', N'', N'', N'Hoainam1@', N'CV\hoainam1.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'hoainamvkl1@gmail.com', N'', N'hoainamvkl1@gmail.com', N'US', N'', N'', N'117911712977561089994', N'', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'men111', N'asdasdsadsad', N'se2001@gmail.com', N'US', N'1234567890', N'312312', N'Hoainam1@', N'CV\men111.jpg', 1, CAST(N'1940-01-26' AS Date), N'Images_Profile\men111.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor0', N'', N'mentor0', N'US', N'', N'', N'Hoainam1@', N'CV\mentor0.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'Mentor1', N'', N'Mentor1', N'US', N'', N'', N'Hoainam1@', N'CV\Mentor1.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor10', N'', N'mentor10', N'MT', N'', N'', N'Hoainam1@', N'CV\mentor10.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor100', N'Doan Vu Hoai Nam', N'mentor100@gmail.com', N'MT', N'0298991231', N'Q7 , Ho Chi Minh', N'Hoainam1@', N'CV\mentor100.jpg', 1, CAST(N'1941-06-01' AS Date), N'Images_Profile\mentor100.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor111', N'Nammmmmm11111', N'mentor111@gmail.com', N'MT', N'1234567890', N'312312', N'Hoainam1@', N'CV\mentor111.jpg', 1, CAST(N'1940-01-25' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor4', N'', N'mentor4', N'MT', N'', N'', N'Hoainam1@', N'CV\mentor4.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor411', N'', N'', N'US', N'', N'', N'Hoainam1@', N'CV\mentor411.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor44', N'', N'mentor44', N'US', N'', N'', N'Hoainam1@', N'CV\mentor44.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor444', N'Namm Hoaiiiii VU', N'se30011@gmail.com', N'MT', N'1234567890', N'312312', N'Hoainam1@', N'CV\mentor444.jpg', 1, CAST(N'1940-01-24' AS Date), N'Images_Profile\mentor444.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor45', N'', N'mentor45', N'US', N'', N'', N'hOAINAM1@', N'CV\mentor45.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor5', N'', N'mentor5', N'MT', N'', N'', N'Hoainam1@', N'CV\mentor5.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor55', N'', N'mentor55', N'US', N'', N'', N'Hoainam1@', N'CV\mentor55.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentor6', N'', N'mentor6', N'MT', N'', N'', N'Hoainam1@', N'CV\mentor6.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'Mentor7', N'', N'Mentor7', N'MT', N'', N'', N'Hoainam1@', N'CV\Mentor7.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentorr', N'Hoai Nam', N'mentorr@gmail.com', N'MT', N'2131231232', N'312312', N'Hoainam1@', N'CV\mentorr.jpg', 1, CAST(N'1940-01-09' AS Date), N'Images_Profile\mentorr.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentorr1', N'', N'mentorr1', N'MT', N'', N'', N'Hoainam1@', N'CV\mentorr1.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'mentorr304', N'', N'', N'US', N'', N'', N'Hoainam1@', N'CV\mentorr304.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'MT01', N'', N'MT01', N'US', N'', N'', N'Hoainam1@', N'CV\MT01.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'namdvhse151200@fpt.edu.vn', N'NNNNN', N'namhoaidoan15@gmail.com', N'US', N'0392799276', N'asddas', N'116990530561332974903', N'', 1, CAST(N'1900-01-01' AS Date), N'images\hinh-anh-2-mat-song-gia-tao-anh-gia-doi-lua-gat-18.jpeg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'namhoaidoan15@gmail.com', N'Hoai Nam1', N'se2001112@gmail.com', N'US', N'1234567899', N'131231232', N'116435178641833651859', N'', 1, CAST(N'2002-01-20' AS Date), N'Images_Profile\namhoaidoan15@gmail.com.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se01', N'Hoai Nam1', N'hoainam1@gmail.com', N'US', N'1234567899', N'123123213213', N'Hoainam1@', N'', 1, CAST(N'2020-10-23' AS Date), N'Images_Profile\se01.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'Se0112', N'Hoai Nam', N'Se0112@gmail.com', N'US', N'1234567890', N'312312', N'Hoainam1@', N'', 1, CAST(N'2000-01-01' AS Date), N'Images_Profile\Se0112.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'Se0234', N'', N'Se0234', N'US', N'', N'', N'Hoainam1@', N'', 1, CAST(N'1900-01-01' AS Date), N'default.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'Se0255', N'Hoai Nam', N'Se0255@gmail.com', N'US', N'0392799276', N'sda123', N'Hoainam1@', N'', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se11', N'', N'se11', N'US', N'', N'', N'Hoainam1@', N'CV\se11.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se111', N'se34', N'se2001@gmail.com', N'US', N'1234567890', N'312312', N'Hoainam1@', N'CV\se111.jpg', 1, CAST(N'1940-01-24' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se112', N'Hoai Nam', N'se112@gmail.com', N'MT', N'0392799276', N'sda123', N'Hoainam1@', N'31231313', 1, CAST(N'1900-01-01' AS Date), N'Images_Profile\se112.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se11213', N'', N'se11213', N'MT', N'', N'', N'Hoainam1@', N'CV\se11213.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se1123', N'', N'se1123', N'MT', N'', N'', N'Hoainam1@', N'CV\se1123.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se11234', N'', N'se11234', N'US', N'', N'', N'Hoainam1@', N'CV\se11234.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se1134', N'', N'se1134', N'MT', N'', N'', N'Hoainam1@', N'', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se15', N'Hoai Nam1', N'se2001@gmail.com', N'MT', N'1234567890', N'312312', N'Hoainam1@', N'', 1, CAST(N'1997-02-04' AS Date), N'Images_Profile\se15.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se1500000', N'', N'namhoaidoan15@gmail.com', N'US', N'', N'', N'Hoainam1@', N'dsadasdasdas', 1, CAST(N'1900-01-01' AS Date), NULL)
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se2001', N'Hoai Nam', N'se2001@gmail.com', N'MT', N'1234567890', N'312312', N'Hoainam1@', N'CV\se2001.jpg', 1, CAST(N'1900-01-01' AS Date), N'Images_Profile\se2001.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se2002', N'Hoai Nam', N'se2002@gmail.com', N'US', N'1234567899', N'131231232', N'Hoainam1@', N'', 1, CAST(N'1900-01-01' AS Date), NULL)
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se3042001', N'', N'', N'US', N'', N'', N'Hoainam1@', N'CV\se3042001.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se34', N'Hoainam', N'se2002@gmail.com', N'AD', N'1234567890', N'21313', N'1', N'dsadasdasdas', 1, CAST(N'2000-01-01' AS Date), N'Images_Profile\se34.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'se343444', N'', N'', N'US', N'', N'', N'Hoainam1@', N'CV\se343444.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'seee11', N'', N'seee11', N'MT', N'', N'', N'Hoainam1@', N'CV\seee11.jpg', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'student1', N'', N'student1', N'US', N'', N'', N'Hoainam1@', N'CV\student1.jpg', 1, CAST(N'1900-01-01' AS Date), N'https://i.imgur.com/GwvY1F9.png')
INSERT [dbo].[tblUser] ([UserID], [Name], [Email], [RoleID], [PhoneNumber], [Address], [Password], [Certificate], [Status], [BirthDay], [Images]) VALUES (N'toannhse140397@fpt.edu.vn', N'toannhse140397@fpt.edu.vn', N'toannhse140397@fpt.edu.vn', N'US', N'', N'', N'113562640118723630919', N'', 1, CAST(N'1900-01-01' AS Date), N'images\mat-na1-ohay-tv-90395.jpg')
GO
ALTER TABLE [dbo].[tblChapter]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[tblSubject] ([SubjectID])
GO
ALTER TABLE [dbo].[tblContent]  WITH CHECK ADD FOREIGN KEY([ChapterID])
REFERENCES [dbo].[tblChapter] ([ChapterID])
GO
ALTER TABLE [dbo].[tblFeedBack]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedBa__UserI__2A4B4B5E] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblFeedBack] CHECK CONSTRAINT [FK__tblFeedBa__UserI__2A4B4B5E]
GO
ALTER TABLE [dbo].[tblRegister]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[tblSubject] ([SubjectID])
GO
ALTER TABLE [dbo].[tblRegister]  WITH CHECK ADD  CONSTRAINT [FK__tblRegist__UserI__1CF15040] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblRegister] CHECK CONSTRAINT [FK__tblRegist__UserI__1CF15040]
GO
ALTER TABLE [dbo].[tblRequestMentor]  WITH CHECK ADD  CONSTRAINT [FK__tblReques__UserI__15502E78] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblRequestMentor] CHECK CONSTRAINT [FK__tblReques__UserI__15502E78]
GO
ALTER TABLE [dbo].[tblRequestSubject]  WITH CHECK ADD  CONSTRAINT [FK__tblReques__UserI__628FA481] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblRequestSubject] CHECK CONSTRAINT [FK__tblReques__UserI__628FA481]
GO
ALTER TABLE [dbo].[tblSubject]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__RoleID__1273C1CD] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRole] ([RoleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__RoleID__1273C1CD]
GO
