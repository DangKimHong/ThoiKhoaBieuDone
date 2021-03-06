USE [ThoiKhoaBieu]
GO
/****** Object:  User [IIS APPPOOL\.NET v4.5]    Script Date: 08/05/2018 9:05:45 SA ******/
CREATE USER [IIS APPPOOL\.NET v4.5] FOR LOGIN [IIS APPPOOL\.NET v4.5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\.NET v4.5]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\.NET v4.5]
GO
/****** Object:  Table [dbo].[faculty]    Script Date: 08/05/2018 9:05:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[faculty](
	[faculty_id] [varchar](20) NOT NULL,
	[faculty_name] [nvarchar](255) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[faculty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[field]    Script Date: 08/05/2018 9:05:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[field](
	[field_id] [varchar](20) NOT NULL,
	[faculty_id] [varchar](20) NOT NULL,
	[field_name] [nvarchar](255) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[field_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lecturer]    Script Date: 08/05/2018 9:05:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lecturer](
	[lecturer_id] [varchar](20) NOT NULL,
	[faculty_id] [varchar](20) NOT NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[lecturer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lop]    Script Date: 08/05/2018 9:05:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lop](
	[class_id] [varchar](20) NOT NULL,
	[faculty_id] [varchar](20) NOT NULL,
	[field_id] [varchar](20) NOT NULL,
	[class_name] [nvarchar](255) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[room]    Script Date: 08/05/2018 9:05:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[room](
	[room_id] [varchar](20) NOT NULL,
	[room_name] [nvarchar](255) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 08/05/2018 9:05:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class_id] [varchar](20) NULL CONSTRAINT [DF__schedule__class___267ABA7A]  DEFAULT (NULL),
	[year_id] [varchar](20) NULL CONSTRAINT [DF__schedule__year_i__276EDEB3]  DEFAULT (NULL),
	[semester_id] [varchar](20) NULL CONSTRAINT [DF__schedule__semest__286302EC]  DEFAULT (NULL),
	[date] [datetime2](0) NOT NULL CONSTRAINT [DF__schedule__date__29572725]  DEFAULT (getdate()),
	[subject_id] [varchar](20) NULL CONSTRAINT [DF__schedule__subjec__2A4B4B5E]  DEFAULT (NULL),
	[room_id] [varchar](20) NULL CONSTRAINT [DF__schedule__room_i__2B3F6F97]  DEFAULT (NULL),
	[begin_at] [smallint] NOT NULL,
	[num_of_lession] [smallint] NOT NULL,
	[updated_at] [datetime2](0) NOT NULL CONSTRAINT [DF__schedule__update__2C3393D0]  DEFAULT (getdate()),
	[lecturer_id] [varchar](20) NULL,
 CONSTRAINT [PK__schedule__3213E83F35F338B0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[semester]    Script Date: 08/05/2018 9:05:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[semester](
	[semester_id] [varchar](20) NOT NULL,
	[semaster_name] [nvarchar](255) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL DEFAULT (getdate()),
	[date_start] [datetime2](0) NULL,
	[date_end] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[semester_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student]    Script Date: 08/05/2018 9:05:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[student_id] [varchar](20) NOT NULL,
	[class_id] [varchar](20) NULL DEFAULT (NULL),
	[full_name] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[subject]    Script Date: 08/05/2018 9:05:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subject](
	[subject_id] [varchar](20) NOT NULL,
	[semester_id] [varchar](20) NOT NULL,
	[subject_name] [nvarchar](255) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[year]    Script Date: 08/05/2018 9:05:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[year](
	[year_id] [varchar](20) NOT NULL,
	[year_name] [nvarchar](255) NOT NULL,
	[updated_at] [datetime2](0) NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[year_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[faculty] ([faculty_id], [faculty_name], [updated_at]) VALUES (N'MK001', N'Công nghệ đa phương tiện', CAST(N'2018-04-24 16:36:45.0000000' AS DateTime2))
INSERT [dbo].[faculty] ([faculty_id], [faculty_name], [updated_at]) VALUES (N'MK002', N'Công nghệ thông tin', CAST(N'2018-04-24 16:36:45.0000000' AS DateTime2))
INSERT [dbo].[field] ([field_id], [faculty_id], [field_name], [updated_at]) VALUES (N'MN001', N'MK001', N'Phát triển ứng dụng đa phương tiện', CAST(N'2018-04-24 16:38:50.0000000' AS DateTime2))
INSERT [dbo].[field] ([field_id], [faculty_id], [field_name], [updated_at]) VALUES (N'MN002', N'MK001', N'Thiết kế đồ họa', CAST(N'2018-04-24 16:38:50.0000000' AS DateTime2))
INSERT [dbo].[field] ([field_id], [faculty_id], [field_name], [updated_at]) VALUES (N'MN003', N'MK002', N'Lập trình mạng', CAST(N'2018-04-24 16:39:46.0000000' AS DateTime2))
INSERT [dbo].[field] ([field_id], [faculty_id], [field_name], [updated_at]) VALUES (N'MN004', N'MK002', N'Thiết kế web', CAST(N'2018-04-24 16:39:46.0000000' AS DateTime2))
INSERT [dbo].[lecturer] ([lecturer_id], [faculty_id], [full_name], [updated_at]) VALUES (N'GV001', N'MK001', N'Nguyễn Văn A', CAST(N'2018-04-24 16:18:15.0000000' AS DateTime2))
INSERT [dbo].[lecturer] ([lecturer_id], [faculty_id], [full_name], [updated_at]) VALUES (N'GV002', N'MK001', N'Trằn Văn C', CAST(N'2018-04-24 16:18:15.0000000' AS DateTime2))
INSERT [dbo].[lecturer] ([lecturer_id], [faculty_id], [full_name], [updated_at]) VALUES (N'GV003', N'MK002', N'Trần Trung Trưng', CAST(N'2018-04-29 20:08:47.0000000' AS DateTime2))
INSERT [dbo].[lecturer] ([lecturer_id], [faculty_id], [full_name], [updated_at]) VALUES (N'GV004', N'MK002', N'Hồ Đắc Hưng', CAST(N'2018-04-29 20:09:18.0000000' AS DateTime2))
INSERT [dbo].[lecturer] ([lecturer_id], [faculty_id], [full_name], [updated_at]) VALUES (N'GV005', N'MK002', N'Hồ Đức Chính', CAST(N'2018-04-29 20:10:04.0000000' AS DateTime2))
INSERT [dbo].[lop] ([class_id], [faculty_id], [field_id], [class_name], [updated_at]) VALUES (N'D14CQPT01', N'MK001', N'MN001', N'Phát triển ứng dụng', CAST(N'2018-04-24 16:17:22.0000000' AS DateTime2))
INSERT [dbo].[lop] ([class_id], [faculty_id], [field_id], [class_name], [updated_at]) VALUES (N'D14CQPU01', N'MK001', N'MN001', N'Phát triển đa phương tiện', CAST(N'2018-04-24 16:17:22.0000000' AS DateTime2))
INSERT [dbo].[room] ([room_id], [room_name], [updated_at]) VALUES (N'MP001', N'1A102', CAST(N'2018-04-24 16:31:04.0000000' AS DateTime2))
INSERT [dbo].[room] ([room_id], [room_name], [updated_at]) VALUES (N'MP002', N'1A103', CAST(N'2018-04-24 16:31:04.0000000' AS DateTime2))
INSERT [dbo].[room] ([room_id], [room_name], [updated_at]) VALUES (N'MP003', N'1B201', CAST(N'2018-04-24 16:31:04.0000000' AS DateTime2))
INSERT [dbo].[room] ([room_id], [room_name], [updated_at]) VALUES (N'MP004', N'1B102', CAST(N'2018-04-24 16:31:04.0000000' AS DateTime2))
INSERT [dbo].[room] ([room_id], [room_name], [updated_at]) VALUES (N'MP005', N'1A104', CAST(N'2018-04-24 16:31:04.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[schedule] ON 

INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (1, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-04-24 17:00:00.0000000' AS DateTime2), N'MH001', N'MP001', 1, 3, CAST(N'2018-04-24 17:00:15.0000000' AS DateTime2), N'GV001')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (2, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-04-24 17:00:00.0000000' AS DateTime2), N'MH002', N'MP001', 5, 3, CAST(N'2018-04-24 17:00:15.0000000' AS DateTime2), N'GV001')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (3, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-04-25 17:00:00.0000000' AS DateTime2), N'MH003', N'MP002', 1, 3, CAST(N'2018-04-24 17:00:15.0000000' AS DateTime2), N'GV004')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (4, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-04-25 17:00:00.0000000' AS DateTime2), N'MH004', N'MP004', 5, 4, CAST(N'2018-04-24 17:00:15.0000000' AS DateTime2), N'GV005')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (5, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-04-26 17:00:00.0000000' AS DateTime2), N'MH005', N'MP004', 1, 4, CAST(N'2018-04-24 17:00:43.0000000' AS DateTime2), N'GV002')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (6, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-05-01 17:00:00.0000000' AS DateTime2), N'MH006', N'MP001', 1, 4, CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'GV003')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (7, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-05-02 17:00:00.0000000' AS DateTime2), N'MH007', N'MP001', 5, 3, CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'GV003')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (8, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-05-03 17:00:00.0000000' AS DateTime2), N'MH008', N'MP002', 5, 4, CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'GV002')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (9, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-05-04 17:00:00.0000000' AS DateTime2), N'MH009', N'MP004', 1, 4, CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'GV004')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (10, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'MH010', N'MP004', 1, 4, CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'GV001')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (11, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-05-06 17:00:00.0000000' AS DateTime2), N'MH001', N'MP001', 1, 4, CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'GV001')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (12, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-05-07 17:00:00.0000000' AS DateTime2), N'MH007', N'MP001', 1, 3, CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'GV003')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (13, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-05-08 17:00:00.0000000' AS DateTime2), N'MH008', N'MP001', 1, 4, CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'GV002')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (14, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-05-09 17:00:00.0000000' AS DateTime2), N'MH009', N'MP001', 1, 4, CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'GV004')
INSERT [dbo].[schedule] ([id], [class_id], [year_id], [semester_id], [date], [subject_id], [room_id], [begin_at], [num_of_lession], [updated_at], [lecturer_id]) VALUES (15, N'D14CQPT01', N'NH001', N'HK001', CAST(N'2018-05-10 17:00:00.0000000' AS DateTime2), N'MH010', N'MP002', 5, 3, CAST(N'2018-04-24 17:08:57.0000000' AS DateTime2), N'GV001')
SET IDENTITY_INSERT [dbo].[schedule] OFF
INSERT [dbo].[semester] ([semester_id], [semaster_name], [updated_at], [date_start], [date_end]) VALUES (N'HK001', N'Học kỳ 1', CAST(N'2018-04-24 16:32:57.0000000' AS DateTime2), CAST(N'2017-08-14 00:00:00.0000000' AS DateTime2), CAST(N'2017-01-14 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[semester] ([semester_id], [semaster_name], [updated_at], [date_start], [date_end]) VALUES (N'HK002', N'Học kỳ 2', CAST(N'2018-04-24 16:32:57.0000000' AS DateTime2), CAST(N'2018-01-22 00:00:00.0000000' AS DateTime2), CAST(N'2018-07-08 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[student] ([student_id], [class_id], [full_name], [password], [updated_at]) VALUES (N'N14DCPT001', N'D14CQPT01', N'Võ Ngọc Thái Dương', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2018-04-24 15:51:31.0000000' AS DateTime2))
INSERT [dbo].[student] ([student_id], [class_id], [full_name], [password], [updated_at]) VALUES (N'N14DCPT002', N'D14CQPT01', N'Đặng Kim Hồng', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2018-04-24 15:51:31.0000000' AS DateTime2))
INSERT [dbo].[student] ([student_id], [class_id], [full_name], [password], [updated_at]) VALUES (N'N14DCPT003', N'D14CQPT01', N'Lê Thị Quỳnh Như', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2018-04-24 15:56:37.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH001', N'HK001', N'Thiết kế web', CAST(N'2018-04-24 16:22:32.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH002', N'HK001', N'Lập trình mạng', CAST(N'2018-04-24 16:28:26.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH003', N'HK001', N'Lập trình hướng đối tượng', CAST(N'2018-04-24 16:22:32.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH004', N'HK001', N'Thiết kế game', CAST(N'2018-04-24 16:22:32.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH005', N'HK001', N'Lập trình ứng dụng', CAST(N'2018-04-24 16:22:32.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH006', N'HK001', N'Cấu trúc dữ liệu', CAST(N'2018-04-24 16:22:32.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH007', N'HK001', N'Thực hành chuyên sâu', CAST(N'2018-04-24 16:22:32.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH008', N'HK001', N'Thiết kế đồ họa', CAST(N'2018-04-24 16:22:32.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH009', N'HK001', N'Toán cao cấp', CAST(N'2018-04-24 16:22:32.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH010', N'HK002', N'Kỹ thuật đồ họa', CAST(N'2018-04-24 16:22:32.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH011', N'HK002', N'Cơ sở dữ liệu đa phương tiện', CAST(N'2018-04-24 16:27:58.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH012', N'HK002', N'Lập trình e-learning', CAST(N'2018-04-24 16:27:58.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH013', N'HK002', N'Tin học cơ sở 2', CAST(N'2018-04-24 16:27:58.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH014', N'HK002', N'Tin học cơ sở 1', CAST(N'2018-04-24 16:27:58.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH015', N'HK002', N'Phát triển dịch vụ giá trị gia tăng', CAST(N'2018-04-24 16:27:58.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH016', N'HK002', N'Thực hành chuyên sâu 2', CAST(N'2018-04-24 16:27:58.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH017', N'HK002', N'Lý thuyết đồ thị', CAST(N'2018-04-24 16:27:58.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH018', N'HK002', N'Ma trận tuyến tính', CAST(N'2018-04-24 16:27:58.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH019', N'HK001', N'Xác xuất thống kê', CAST(N'2018-04-24 16:27:58.0000000' AS DateTime2))
INSERT [dbo].[subject] ([subject_id], [semester_id], [subject_name], [updated_at]) VALUES (N'MH020', N'HK002', N'Thiết kế đầu cuối di động', CAST(N'2018-04-24 16:27:58.0000000' AS DateTime2))
INSERT [dbo].[year] ([year_id], [year_name], [updated_at]) VALUES (N'NH001', N'2017-2018', CAST(N'2018-04-24 16:35:16.0000000' AS DateTime2))
INSERT [dbo].[year] ([year_id], [year_name], [updated_at]) VALUES (N'NH002', N'2018-2019', CAST(N'2018-04-24 16:35:16.0000000' AS DateTime2))
ALTER TABLE [dbo].[field]  WITH CHECK ADD FOREIGN KEY([faculty_id])
REFERENCES [dbo].[faculty] ([faculty_id])
GO
ALTER TABLE [dbo].[field]  WITH CHECK ADD FOREIGN KEY([faculty_id])
REFERENCES [dbo].[faculty] ([faculty_id])
GO
ALTER TABLE [dbo].[lecturer]  WITH CHECK ADD FOREIGN KEY([faculty_id])
REFERENCES [dbo].[faculty] ([faculty_id])
GO
ALTER TABLE [dbo].[lop]  WITH CHECK ADD FOREIGN KEY([faculty_id])
REFERENCES [dbo].[faculty] ([faculty_id])
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK__schedule__class___34C8D9D1] FOREIGN KEY([class_id])
REFERENCES [dbo].[lop] ([class_id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK__schedule__class___34C8D9D1]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK__schedule__semest__35BCFE0A] FOREIGN KEY([semester_id])
REFERENCES [dbo].[semester] ([semester_id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK__schedule__semest__35BCFE0A]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK__schedule__subjec__36B12243] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([subject_id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK__schedule__subjec__36B12243]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK__schedule__year_i__37A5467C] FOREIGN KEY([year_id])
REFERENCES [dbo].[year] ([year_id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK__schedule__year_i__37A5467C]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK_schedule_lecturer] FOREIGN KEY([lecturer_id])
REFERENCES [dbo].[lecturer] ([lecturer_id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK_schedule_lecturer]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[lop] ([class_id])
GO
ALTER TABLE [dbo].[subject]  WITH CHECK ADD FOREIGN KEY([semester_id])
REFERENCES [dbo].[semester] ([semester_id])
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [CK__schedule__begin___3A81B327] CHECK  (([begin_at]>(0)))
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [CK__schedule__begin___3A81B327]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [CK__schedule__num_of__3B75D760] CHECK  (([num_of_lession]>(0)))
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [CK__schedule__num_of__3B75D760]
GO
