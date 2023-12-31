USE [Hospital_AnisimovArkhipenko_4ISP419]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[MedicalServiceID] [int] NOT NULL,
	[DataService] [datetime] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[MName] [nvarchar](50) NULL,
	[PassportSeries] [nchar](4) NOT NULL,
	[PassportNumber] [nchar](6) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[DateOfBirthday] [date] NOT NULL,
	[Phone] [nchar](12) NOT NULL,
	[DepartamentID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
	[GenderID] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[ID] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalService]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TitleService] [nvarchar](100) NOT NULL,
	[Duration] [int] NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[QNT] [int] NULL,
 CONSTRAINT [PK_MedicalService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[MName] [nvarchar](50) NULL,
	[PassportSeries] [nchar](4) NULL,
	[PassportNumber] [nchar](6) NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone] [nchar](12) NULL,
	[GenderID] [int] NULL,
	[DateOfBirthday] [date] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[IsActiv] [bit] NULL,
	[IDTagOfClient] [int] NULL,
	[Login] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[one_v]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[one_v]
as
	select  CONCAT( p.LName, ' ',   p.FName, ' ', p.MName) as 'full name', ms.TitleService as 'Title Service',  CONCAT( e.LName, ' ',   e.FName, ' ', e.MName) as 'full name  employee', po.PostName
	from Patient p join  Gender g on p.GenderID = g.ID
	LEFT join Employee e  on g.ID = e.GenderID join Post po on e.PostID = po.ID
	 join  [order] o on p.ID = o.PatientID
   join Appointment a on o.AppointmentID = a.ID
  join MedicalService ms on a.MedicalServiceID = ms.ID
  where e.ID = a.EmployeeID
GO
/****** Object:  Table [dbo].[Departament]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departament](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartamentName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Departament] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[two_V]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create   view [dbo].[two_V]
  as
  select  CONCAT( p.LName, ' ',   p.FName, ' ', p.MName) as 'full name', ms.TitleService as 'Title Service',  
  CONCAT( e.LName, ' ',   e.FName, ' ', e.MName) as 'full name  employee', d.DepartamentName
FROM Patient p LEFT JOIN [Order] o ON p.ID = o.ID 
	LEFT JOIN Appointment a ON o.AppointmentID = a.ID
	LEFT JOIN MedicalService ms ON a.MedicalServiceID=ms.ID
	LEFT JOIN Employee e ON a.EmployeeID = e.ID
	LEFT JOIN Departament D on e.DepartamentID = d.ID
GO
/****** Object:  View [dbo].[three_V]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[three_V]
	as
	select  CONCAT( e.LName, ' ',   e.FName, ' ', e.MName) as 'full name  employee',ms.TitleService as 'TitleService',p.PostName
	from Employee e join post p on e.PostID = p.ID 
	join Appointment a on e.ID = a.EmployeeID
	join MedicalService ms on a.MedicalServiceID = ms.ID
	where  (Select COUNT(a.MedicalServiceID) from Appointment a ) > 5
GO
/****** Object:  View [dbo].[th_V]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create   view [dbo].[th_V]
	as
	select ms.TitleService as 'TitleService', CONCAT(p.LName, ' ', p.FName, ' ', p.MName) as 'fio', p.DateOfBirthday as 'data'
	from MedicalService ms 
	join Appointment a on ms.ID = a.MedicalServiceID
	join [Order] o on a.ID = o.AppointmentID
	join Patient p on o.PatientID= p.ID
	where MONTH(p.DateOfBirthday) = 10
GO
/****** Object:  View [dbo].[ggg_vv]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[ggg_vv]
as	
SELECT CONCAT(p.LName, ' ', p.FName, ' ', p.MName) AS 'Full name pation', ms.TitleService, ms.Cost, ms.Duration
FROM MedicalService ms  
 right JOIN Appointment a ON ms.ID = a.MedicalServiceID 
 left JOIN [Order] o ON a.ID = o.AppointmentID 
 JOIN Patient p ON o.PatientID=p.ID

Where MONTH(a.DataService) = 5 and year(a.DataService) = 2010
GO
/****** Object:  View [dbo].[gg]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[gg]
as	
SELECT CONCAT(p.LName, ' ', p.FName, ' ', p.MName) AS 'Full name pation', ms.TitleService, ms.Cost, ms.Duration
FROM MedicalService ms  
 right JOIN Appointment a ON ms.ID = a.MedicalServiceID 
 left JOIN [Order] o ON a.ID = o.AppointmentID 
 JOIN Patient p ON o.PatientID=p.ID

Where MONTH(a.DataService) = 5 and year(a.DataService) = 2020
GO
/****** Object:  Table [dbo].[Diagnosis]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnosis](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DiagnosisName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientDiagnosis]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDiagnosis](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DiagnosisID] [int] NOT NULL,
 CONSTRAINT [PK_PatientDiagnosis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[history]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[history]
As
select e.LName as 'врач', ms.TitleService as 'процедура', a.DataService as 'дата', d.DiagnosisName as 'диагноз', p.ID
from Employee e 
join Appointment a on e.ID = a.EmployeeID
join MedicalService ms on a.MedicalServiceID = ms.ID
join [Order] o on a.ID = o.AppointmentID
join Patient p on o.PatientID = p.ID
join PatientDiagnosis ps on p.ID = ps.PatientID
join Diagnosis d on ps.DiagnosisID = d.ID
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 03.11.2023 15:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Employee]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_MedicalService] FOREIGN KEY([MedicalServiceID])
REFERENCES [dbo].[MedicalService] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_MedicalService]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Departament] FOREIGN KEY([DepartamentID])
REFERENCES [dbo].[Departament] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Departament]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Post]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Appointment] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointment] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Appointment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Patient]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Gender]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_TagOfClient] FOREIGN KEY([IDTagOfClient])
REFERENCES [dbo].[TagOfClient] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_TagOfClient]
GO
ALTER TABLE [dbo].[PatientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosis_Diagnosis] FOREIGN KEY([DiagnosisID])
REFERENCES [dbo].[Diagnosis] ([ID])
GO
ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_Diagnosis]
GO
ALTER TABLE [dbo].[PatientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PatientDiagnosis_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[PatientDiagnosis] CHECK CONSTRAINT [FK_PatientDiagnosis_Patient]
GO
