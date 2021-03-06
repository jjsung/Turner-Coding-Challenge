USE [Employee]
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 10/10/2018 11:52:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[Name] [varchar](50) NOT NULL,
	[SSN] [char](9) NOT NULL,
	[ManagerSSN] [char](9) NULL,
	[Level] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROJECT]    Script Date: 10/10/2018 11:52:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJECT](
	[PID] [tinyint] NOT NULL,
	[Pname] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorksOn]    Script Date: 10/10/2018 11:52:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorksOn](
	[EmpSSN] [char](9) NOT NULL,
	[PID] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpSSN] ASC,
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[EMPLOYEE] ([Name], [SSN], [ManagerSSN], [Level]) VALUES (N'John', N'1        ', N'5        ', 3)
INSERT [dbo].[EMPLOYEE] ([Name], [SSN], [ManagerSSN], [Level]) VALUES (N'sam', N'10       ', N'5        ', 3)
INSERT [dbo].[EMPLOYEE] ([Name], [SSN], [ManagerSSN], [Level]) VALUES (N'Mark', N'2        ', N'8        ', 2)
INSERT [dbo].[EMPLOYEE] ([Name], [SSN], [ManagerSSN], [Level]) VALUES (N'steve', N'3        ', N'8        ', 2)
INSERT [dbo].[EMPLOYEE] ([Name], [SSN], [ManagerSSN], [Level]) VALUES (N'tom', N'4        ', N'3        ', 3)
INSERT [dbo].[EMPLOYEE] ([Name], [SSN], [ManagerSSN], [Level]) VALUES (N'lara', N'5        ', N'8        ', 2)
INSERT [dbo].[EMPLOYEE] ([Name], [SSN], [ManagerSSN], [Level]) VALUES (N'simon', N'6        ', N'2        ', 3)
INSERT [dbo].[EMPLOYEE] ([Name], [SSN], [ManagerSSN], [Level]) VALUES (N'david', N'7        ', N'4        ', 4)
INSERT [dbo].[EMPLOYEE] ([Name], [SSN], [ManagerSSN], [Level]) VALUES (N'ben', N'8        ', NULL, 1)
INSERT [dbo].[EMPLOYEE] ([Name], [SSN], [ManagerSSN], [Level]) VALUES (N'stacy', N'9        ', N'2        ', 3)
INSERT [dbo].[PROJECT] ([PID], [Pname]) VALUES (1, N'Project1')
INSERT [dbo].[PROJECT] ([PID], [Pname]) VALUES (2, N'Project2')
INSERT [dbo].[PROJECT] ([PID], [Pname]) VALUES (3, N'Project3')
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'1        ', 1)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'10       ', 3)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'2        ', 1)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'3        ', 1)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'4        ', 1)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'4        ', 2)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'5        ', 1)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'5        ', 2)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'5        ', 3)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'6        ', 2)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'7        ', 2)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'8        ', 3)
INSERT [dbo].[WorksOn] ([EmpSSN], [PID]) VALUES (N'9        ', 3)
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([EmpSSN])
REFERENCES [dbo].[EMPLOYEE] ([SSN])
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD FOREIGN KEY([PID])
REFERENCES [dbo].[PROJECT] ([PID])
GO
