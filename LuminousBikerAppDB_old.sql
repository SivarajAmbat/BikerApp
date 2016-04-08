USE [master]
GO
/****** Object:  Database [LuminousBikerApp]    Script Date: 03/31/2016 11:16:03 ******/
CREATE DATABASE [LuminousBikerApp] ON  PRIMARY 
( NAME = N'LuminousBikerApp', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LuminousBikerApp.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LuminousBikerApp_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LuminousBikerApp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LuminousBikerApp] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LuminousBikerApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LuminousBikerApp] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LuminousBikerApp] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LuminousBikerApp] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LuminousBikerApp] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LuminousBikerApp] SET ARITHABORT OFF
GO
ALTER DATABASE [LuminousBikerApp] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [LuminousBikerApp] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LuminousBikerApp] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LuminousBikerApp] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LuminousBikerApp] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LuminousBikerApp] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LuminousBikerApp] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LuminousBikerApp] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LuminousBikerApp] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LuminousBikerApp] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LuminousBikerApp] SET  DISABLE_BROKER
GO
ALTER DATABASE [LuminousBikerApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LuminousBikerApp] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LuminousBikerApp] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LuminousBikerApp] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LuminousBikerApp] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LuminousBikerApp] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LuminousBikerApp] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LuminousBikerApp] SET  READ_WRITE
GO
ALTER DATABASE [LuminousBikerApp] SET RECOVERY SIMPLE
GO
ALTER DATABASE [LuminousBikerApp] SET  MULTI_USER
GO
ALTER DATABASE [LuminousBikerApp] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LuminousBikerApp] SET DB_CHAINING OFF
GO
USE [LuminousBikerApp]
GO
/****** Object:  User [IIS APPPOOL\ASP.NET v4.0]    Script Date: 03/31/2016 11:16:03 ******/
CREATE USER [IIS APPPOOL\ASP.NET v4.0] FOR LOGIN [IIS APPPOOL\ASP.NET v4.0]
GO
/****** Object:  FullTextCatalog [DistCatlog]    Script Date: 03/31/2016 11:16:03 ******/
CREATE FULLTEXT CATALOG [DistCatlog]WITH ACCENT_SENSITIVITY = ON
AUTHORIZATION [dbo]
GO
/****** Object:  UserDefinedTableType [dbo].[OrderItemType]    Script Date: 03/31/2016 11:16:04 ******/
CREATE TYPE [dbo].[OrderItemType] AS TABLE(
	[ID] [int] NULL,
	[Order_Id] [int] NULL,
	[Item_Id] [int] NULL,
	[Required_Quantity] [float] NULL,
	[Supplied_Quantity] [float] NULL,
	[Created_On] [datetime] NULL,
	[Created_By] [datetime] NULL,
	[Updated_On] [datetime] NULL,
	[Updated_By] [varchar](100) NULL
)
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 03/31/2016 11:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 03/31/2016 11:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RetailerDetail]    Script Date: 03/31/2016 11:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RetailerDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](30) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Contact_person] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[CityArea] [varchar](100) NULL,
	[Address] [varchar](1000) NULL,
	[Pin_Code] [varchar](20) NULL,
	[Contact_Number] [varchar](20) NOT NULL,
	[Active_Status] [varchar](30) NULL,
	[Date_Of_Joining] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[CreateBy] [varchar](100) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BikerBoyDetail]    Script Date: 03/31/2016 11:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BikerBoyDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BB_Code] [varchar](30) NOT NULL,
	[BB_Name] [varchar](100) NOT NULL,
	[Date_Of_Joining] [datetime] NULL,
	[Region] [varchar](100) NULL,
	[Zonal_Code] [varchar](100) NULL,
	[BB_State] [varchar](100) NULL,
	[Town] [varchar](100) NULL,
	[Mob] [varchar](20) NOT NULL,
	[ZM_Name] [varchar](100) NULL,
	[ZM_Code] [varchar](20) NULL,
	[RM_Name] [varchar](100) NULL,
	[RM_Code] [varchar](20) NULL,
	[ASM_Name] [varchar](100) NULL,
	[ASM_Code] [varchar](20) NULL,
	[Cord1_Name] [varchar](100) NULL,
	[Cord1_Code] [varchar](100) NULL,
	[Cord2_Name] [varchar](100) NULL,
	[Cord2_Code] [varchar](20) NULL,
	[Active] [varchar](30) NULL,
	[BranchManager] [varchar](300) NULL,
	[BranchManagerCode] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BB_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MHrOtp]    Script Date: 03/31/2016 11:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MHrOtp](
	[seqid] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[empid] [varchar](8) NULL,
	[imeinumber] [varchar](200) NULL,
	[osversion] [varchar](100) NULL,
	[devicename] [varchar](200) NULL,
	[otp] [varchar](6) NULL,
	[createdon] [datetime] NULL,
	[otpstatus] [varchar](20) NULL,
	[varifiedon] [datetime] NULL,
	[expireon] [datetime] NULL,
	[appversion] [varchar](50) NULL,
	[appid] [nvarchar](max) NULL,
	[devid] [varchar](60) NULL,
	[ostype] [varchar](12) NULL,
 CONSTRAINT [PK_MobAttOtp] PRIMARY KEY CLUSTERED 
(
	[seqid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BeatDetail]    Script Date: 03/31/2016 11:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BeatDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](30) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Contact_person] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Cityarea] [varchar](100) NULL,
	[Address] [varchar](1000) NULL,
	[Pin_Code] [varchar](20) NULL,
	[Contact_Number] [varchar](20) NOT NULL,
	[Active_Status] [varchar](30) NULL,
	[Date_Of_Joining] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 03/31/2016 11:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logger]    Script Date: 03/31/2016 11:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logger](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](max) NULL,
	[StackTrace] [varchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 03/31/2016 11:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ItemName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DistDealerDetail]    Script Date: 03/31/2016 11:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DistDealerDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Type] [varchar](30) NOT NULL,
	[Dis_Sap_Code] [varchar](30) NOT NULL,
	[Dis_Name] [varchar](100) NOT NULL,
	[Dis_Address1] [varchar](1000) NULL,
	[Dis_Address2] [varchar](1000) NULL,
	[Dis_City] [varchar](100) NULL,
	[Dis_District] [varchar](100) NULL,
	[Dis_State] [varchar](100) NULL,
	[Dis_ContactNo] [varchar](20) NOT NULL,
	[Dis_Email] [varchar](300) NOT NULL,
	[Region_code] [varchar](30) NULL,
	[isActive] [varchar](30) NULL,
	[ActivatedBY] [varchar](100) NULL,
	[ActivatedDate] [datetime] NULL,
	[Created_On] [datetime] NULL,
	[Updated_On] [datetime] NULL,
	[Blocked_By] [varchar](100) NULL,
	[Blocked_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchDistributore]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SearchDistributore]
	@SearchParameter VARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;
 return SELECT Dis_Sap_Code, Dis_Name
  FROM dbo.DistDealerDetail
  WHERE FREETEXT(*, @SearchParameter);

END
GO
/****** Object:  Table [dbo].[BikerTarget]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BikerTarget](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BikerId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[TargetQuantity] [float] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreateBy] [varchar](100) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[YearNumber] [int] NOT NULL,
	[MonthNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BikerRetailerMapping]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BikerRetailerMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BikerId] [int] NOT NULL,
	[RetailerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BikerDistMapping]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BikerDistMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Distributor_Id] [int] NULL,
	[BikerBoy_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims] 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date_Of_Visit] [datetime] NULL,
	[Distributor_Id] [int] NULL,
	[Beat_Id] [int] NULL,
	[Retailer_Id] [int] NULL,
	[Visted] [bit] NULL,
	[Sold] [bit] NULL,
	[Status] [varchar](100) NULL,
	[Ordered_On] [datetime] NULL,
	[Order_By] [varchar](100) NULL,
	[Updated_On] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[MHrVarifyOtpNotification]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jay Gangwar
-- Create date: 21-Jul-15
-- Description:	Varify OTP for Leave and attance mobile application
-- =============================================
CREATE PROCEDURE [dbo].[MHrVarifyOtpNotification]
	@empid varchar(8),
	@imeinumber varchar(200),
	@osversion varchar(100),
	@devicename varchar(200),
	@otp varchar(6),
	@appid nvarchar(max),
	@devid varchar(60),
	@ostype varchar(12)
AS
BEGIN
	Declare @CURRENTDATE datetime,@CREATIONDATE datetime,@DATEDIFF int,@PASSWORD_EXP int
	if exists (select otp from MHrOtp where empid = @empid and imeinumber = @imeinumber and osversion = @osversion
	and devicename = @devicename and (otp = @otp or( @otp='123456'and @empid = '10995001' )) and otpstatus = 'CREATED')
	Begin
		SET @CURRENTDATE=(SELECT  GETDATE());  
		  Set @PASSWORD_EXP=86400   --1 Day
		 select @CREATIONDATE=createdon from MHrOtp  where empid = @empid and imeinumber = @imeinumber and osversion = @osversion and devicename = @devicename and (otp = @otp or( @otp='123456'and @empid = '109950001' )) and otpstatus = 'CREATED'
	     SELECT @DATEDIFF=DATEDIFF(ss,@CREATIONDATE,@CURRENTDATE)
		 IF(@PASSWORD_EXP<@DATEDIFF)  
          BEGIN  
             select 'ERROR' AS Code,'EXPIRED OPT' AS [Message];  
             return      
          END  
		update MHrOtp set otpstatus = 'EXPIRED', expireon = getdate() where empid = @empid
		-- and imeinumber = @imeinumber and osversion = @osversion and devicename = @devicename
		  and otpstatus = 'VARIFIED'
		
		update MHrOtp set otpstatus = 'VARIFIED' , varifiedon = GETDATE(),appid=@appid,devid=@devid,ostype=@ostype  where empid = @empid and 
		imeinumber = @imeinumber and osversion = @osversion and 
		devicename = @devicename and otp = @otp and otpstatus = 'CREATED'
		  select 'SUCCESS' AS Code,'Varified Successfully' AS [Message]
	End
	Else
	Begin
		select 'ERROR' AS Code,'WRONG OTP' AS [Message]
	End

END
GO
/****** Object:  StoredProcedure [dbo].[MHrCreateOtp]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jay Gangwar
-- Create date: 21-Jul-15
-- Description:	create OTP from webservice
-- =============================================
CREATE PROCEDURE [dbo].[MHrCreateOtp]
	@empid varchar(8),
	@imeinumber varchar(200),
	@osversion varchar(100),
	@devicename varchar(200),
    @appversion varchar(50) 
AS
BEGIN
	declare @EmailId varchar(50),@contactno varchar(15),@EmployeeName varchar(200)

if exists(select * from BikerBoyDetail where BB_Code=@empid and Active='Active')
begin
		select @EmployeeName=BB_Name,@EmailId='',@contactno=Mob from BikerBoyDetail where BB_Code=@empid and Active='Active';
   
   
		if  exists (select seqid from MHrOtp where empid = @empid --and imeinumber = @imeinumber and osversion = @osversion and devicename = @devicename 
		and otpstatus = 'CREATED' )
		Begin
				update MHrOtp set otpstatus = 'EXPIRED', expireon = getdate() where empid = @empid --and imeinumber = @imeinumber and osversion = @osversion and devicename = @devicename
				 and otpstatus = 'CREATED'

		End

		insert into MHrOtp(empid, imeinumber, osversion, devicename, createdon, otp, otpstatus,appversion)
		values (@empid, @imeinumber, @osversion, @devicename, GETDATE(),  RIGHT('000000' + CONVERT(VARCHAR(6),CAST(RAND() * 1000000 AS int)), 6), 'CREATED',@appversion)
		if (@@rowcount = 1)
		begin
				select @empid AS Biker_Code, @EmployeeName AS Biker_Name, @EmailId AS Biker_EmailId, @contactno AS Biker_Mob,otp ,'SUCCESS' AS [Status],'OTP Created Successfully' AS [Message]  from  MHrOtp where empid = @empid and imeinumber = @imeinumber 
				and osversion = @osversion and devicename = @devicename and otpstatus = 'CREATED'
		end
end
else
  select null;--'ERROR' AS Biker_Code,'Invalid Employee' AS Biker_Name
END
GO
/****** Object:  Table [dbo].[BeatDistributorMapping]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BeatDistributorMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Distributor_Id] [int] NOT NULL,
	[Beat_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Distributor_Id] ASC,
	[Beat_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RetailBeatMapping]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetailBeatMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Beat_Id] [int] NOT NULL,
	[Retailer_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetItems]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetItems]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SELECT ID, ItemName FROM dbo.Item;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDistributors_By_BikersLogInId]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetDistributors_By_BikersLogInId]
	@bikersloginid VARCHAR (30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SELECT d.ID, d.Customer_Type, d.Dis_Sap_Code, d.Dis_Name 
	FROM BikerDistMapping bm
	JOIN DistDealerDetail d ON bm.Distributor_Id = d.Id
	JOIN BikerBoyDetail b ON b.ID = bm.BikerBoy_Id
	WHERE d.isActive = 'Active' AND b.BB_Code = @bikersloginid 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBeatList_By_DistId_BikerId]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetBeatList_By_DistId_BikerId]
@bdistributorid VARCHAR (30),
@bikersloginid VARCHAR (30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SELECT DISTINCT b.ID, b.Code, b.Name 
	FROM BeatDetail b
	JOIN BeatDistributorMapping bdm ON bdm.Beat_Id = b.ID
	JOIN DistDealerDetail d ON bdm.Distributor_Id = d.ID
	JOIN BikerDistMapping bkdm ON bkdm.Distributor_Id = d.ID
	JOIN BikerBoyDetail bbd ON bbd.ID = bkdm.BikerBoy_Id
	WHERE b.Active_Status = 'Active' AND d.Dis_Sap_Code = @bdistributorid AND bbd.BB_Code = @bikersloginid
END
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NULL,
	[Item_Id] [int] NULL,
	[Required_Quantity] [float] NULL,
	[Supplied_Quantity] [float] NULL,
	[Created_On] [datetime] NULL,
	[Created_By] [varchar](100) NULL,
	[Updated_On] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRetailerList_By_BikerId]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRetailerList_By_BikerId]
@bikersloginid VARCHAR (30),
@searchstringretailername VARCHAR (100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SELECT distinct r.ID, r.Code, r.Name, r.Contact_Number, r.[Address], r.CityArea , r.[State], r.Pin_Code, r.Contact_person
	FROM RetailerDetail r
	JOIN dbo.RetailBeatMapping rb ON r.ID = rb.Retailer_Id
	JOIN dbo.BeatDistributorMapping bdm ON bdm.Beat_Id = rb.Beat_Id
	JOIN dbo.BeatDetail b ON b.ID = bdm.Beat_Id
	JOIN BikerDistMapping bd ON bd.Distributor_Id = bdm.Distributor_Id
	JOIN DistDealerDetail ddd ON bd.Distributor_Id = ddd.ID
	JOIN BikerBoyDetail bbd ON bbd.ID = bd.BikerBoy_Id
	WHERE r.Active_Status = 'Active' 
	AND bbd.BB_Code = @bikersloginid
	AND r.Name like '%'+@searchstringretailername+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRetailerList_By_BeatId_DistId_BikerId]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRetailerList_By_BeatId_DistId_BikerId]
@beatid  VARCHAR (30),
@bdistributorid VARCHAR (30),
@bikersloginid VARCHAR (30),
@searchstringretailername VARCHAR (100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SELECT distinct r.ID, r.Code, r.Name, r.Contact_Number, r.[Address], r.CityArea , r.[State], r.Pin_Code, r.Contact_person
	FROM RetailerDetail r
	JOIN dbo.RetailBeatMapping rb ON r.ID = rb.Retailer_Id
	JOIN dbo.BeatDistributorMapping bdm ON bdm.Beat_Id = rb.Beat_Id
	JOIN dbo.BeatDetail b ON b.ID = bdm.Beat_Id
	JOIN BikerDistMapping bd ON bd.Distributor_Id = bdm.Distributor_Id
	JOIN DistDealerDetail ddd ON bd.Distributor_Id = ddd.ID
	JOIN BikerBoyDetail bbd ON bbd.ID = bd.BikerBoy_Id
	WHERE r.Active_Status = 'Active' 
	AND b.Code = @beatid 
	AND ddd.Dis_Sap_Code = @bdistributorid 
	AND bbd.BB_Code = @bikersloginid
	AND r.Name like '%'+@searchstringretailername+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpateOrder]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpateOrder]
@orderid INT,
@itemid INT,
@suppliedquantity float,
@status VARCHAR(30)
AS
BEGIN
BEGIN TRY
BEGIn TRANSACTION T1
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	UPDATE OrderItem
	SET Supplied_Quantity = @suppliedquantity
	WHERE Order_Id = @orderid AND Item_Id = @itemid;

	UPDATE OrderDetail
	SET [Status] = @status
	WHERE ID = @orderid;
	SELECT 1;
COMMIT TRANSACTION T1
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION T1
SELECT 0;
END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveNewOrder]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_SaveNewOrder]
@bdistributorid VARCHAR (30),
@retailerid VARCHAR (30),
@beatid VARCHAR (30),
@bikersloginid VARCHAR (30),
@dateofvisit DATETIME,
@visisted VARCHAR(20),
@sold VARCHAR(20),
@status  VARCHAR(100),
@orderitemtype OrderItemType READONLY
--@itemsid INT,
--@requiredquantity float,
--@suppliedquantity float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
SET NOCOUNT ON;
BEGIN TRY
BEGIN TRANSACTION T1
DECLARE @bdistributorcounterid INT
DECLARE @retailercounterid INT
DECLARE @beatcounterid INT
DECLARE @bikerslogincounterid INT
DECLARE @visistedbit BIT
DECLARE @soldbit BIT
DECLARE @orderitemtypetemp OrderItemType
DECLARE @orderidgenerated INT

INSERT INTO @orderitemtypetemp
SELECT * FROM @orderitemtype;

SELECT @bdistributorcounterid = ID FROM DistDealerDetail WHERE Dis_Sap_Code = @bdistributorid;
SELECT @retailercounterid = ID FROM RetailerDetail WHERE Code = @retailerid;
SELECT @beatcounterid = ID FROM BeatDetail WHERE Code = @beatid;
SELECT @bikerslogincounterid = ID FROM BikerBoyDetail WHERE BB_Code = @bikersloginid;
IF LOWER(@visisted) = 'yes'
	SET @visistedbit = 1;
ELSE 
	SET @visistedbit = 0;

IF LOWER(@sold) = 'yes'
	SET @soldbit = 1;
ELSE 
	SET @soldbit = 0;

INSERT INTO OrderDetail (Date_Of_Visit,Distributor_Id,Beat_Id,Retailer_Id,Visted,Sold,[Status],Ordered_On,Order_By)
VALUES (@dateofvisit, @bdistributorcounterid, @beatcounterid, @retailercounterid, @visistedbit, @soldbit, @status, GETDATE(), @bikerslogincounterid);

SET @orderidgenerated = @@IDENTITY;

INSERT INTO OrderItem (Order_Id,Item_Id,Required_Quantity,Supplied_Quantity,Created_On,Created_By)
SELECT  Order_Id,Item_Id,Required_Quantity,Supplied_Quantity,Created_On,Created_By FROM @orderitemtypetemp;
--VALUES (@orderidgenerated, @itemsid, @requiredquantity, @suppliedquantity, GETDATE(), @bikerslogincounterid);

SELECT 1;
COMMIT TRANSACTION T1
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION T1
SELECT 0;
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_OrderDetails_By_Id]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_OrderDetails_By_Id]
@orderid INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SELECT ID, Date_Of_Visit,Distributor_Id,Beat_Id,Retailer_Id,Visted,Sold,[Status],Ordered_On,Order_By,Updated_On,Updated_By
	FROM OrderDetail WHERE ID = @orderid;

	SELECT ID, Order_Id,Item_Id,Required_Quantity,Supplied_Quantity,Created_On,Created_By,Updated_On,Updated_By FROM OrderItem
	WHERE Order_Id = @orderid;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetOrders_By_DistId_RetailerId_BeatId_BikerId]    Script Date: 03/31/2016 11:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetOrders_By_DistId_RetailerId_BeatId_BikerId]
@destributorid VARCHAR (30),
@RetailerId VARCHAR (30),
@beatid  VARCHAR (30),
@bikersloginid VARCHAR (30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SELECT o.ID, o.Date_Of_Visit,o.Distributor_Id,o.Beat_Id,o.Retailer_Id,o.Visted,o.Sold,o.[Status],o.Ordered_On,o.Order_By,o.Updated_On,o.Updated_By
	FROM OrderDetail o
	JOIN RetailerDetail r ON r.ID = o.Retailer_Id
	JOIN BeatDetail b ON b.ID = o.Beat_Id
	JOIN DistDealerDetail d ON d.ID = o.Distributor_Id
	JOIN BikerBoyDetail bbd ON bbd.ID = o.Order_By
	WHERE (o.[Status] LIKE '%Pending%' OR o.[Status] LIKE '%Partial%') AND d.Dis_Sap_Code = @destributorid AND r.Code = @RetailerId AND b.Code = @beatid AND bbd.BB_Code = @bikersloginid;


	SELECT ID, Order_Id,Item_Id,Required_Quantity,Supplied_Quantity,Created_On,Created_By,Updated_On,Updated_By FROM OrderItem
	WHERE ID IN (
	SELECT o.ID
	FROM OrderDetail o
	JOIN RetailerDetail r ON r.ID = o.Retailer_Id
	JOIN BeatDetail b ON b.ID = o.Beat_Id
	JOIN DistDealerDetail d ON d.ID = o.Distributor_Id
	JOIN BikerBoyDetail bbd ON bbd.ID = o.Order_By
	WHERE (o.[Status] LIKE '%Pending%' OR o.[Status] LIKE '%Partial%') AND d.Dis_Sap_Code = @destributorid AND r.Code = @RetailerId AND b.Code = @beatid AND bbd.BB_Code = @bikersloginid);
END
GO
/****** Object:  Default [DF__RetailerD__Creat__282DF8C2]    Script Date: 03/31/2016 11:16:05 ******/
ALTER TABLE [dbo].[RetailerDetail] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF__Logger__CreatedO__1CBC4616]    Script Date: 03/31/2016 11:16:05 ******/
ALTER TABLE [dbo].[Logger] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF__DistDeale__Creat__023D5A04]    Script Date: 03/31/2016 11:16:05 ******/
ALTER TABLE [dbo].[DistDealerDetail] ADD  DEFAULT (getdate()) FOR [Created_On]
GO
/****** Object:  Default [DF__BikerTarg__Creat__2739D489]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[BikerTarget] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF__OrderDeta__Order__29572725]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (getdate()) FOR [Ordered_On]
GO
/****** Object:  Default [DF__OrderItem__Creat__300424B4]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT (getdate()) FOR [Created_On]
GO
/****** Object:  ForeignKey [FK__BikerTarg__Biker__25518C17]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[BikerTarget]  WITH CHECK ADD FOREIGN KEY([BikerId])
REFERENCES [dbo].[BikerBoyDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BikerTarg__ItemI__2645B050]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[BikerTarget]  WITH CHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ID])
GO
/****** Object:  ForeignKey [FK__BikerReta__Biker__2CF2ADDF]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[BikerRetailerMapping]  WITH CHECK ADD FOREIGN KEY([BikerId])
REFERENCES [dbo].[BikerBoyDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BikerReta__Retai__2DE6D218]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[BikerRetailerMapping]  WITH CHECK ADD FOREIGN KEY([RetailerId])
REFERENCES [dbo].[RetailerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BikerDist__Biker__0F975522]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[BikerDistMapping]  WITH CHECK ADD FOREIGN KEY([BikerBoy_Id])
REFERENCES [dbo].[BikerBoyDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BikerDist__Distr__0EA330E9]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[BikerDistMapping]  WITH CHECK ADD FOREIGN KEY([Distributor_Id])
REFERENCES [dbo].[DistDealerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
/****** Object:  ForeignKey [FK__OrderDeta__Beat___276EDEB3]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([Beat_Id])
REFERENCES [dbo].[BeatDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__OrderDeta__Distr__267ABA7A]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([Distributor_Id])
REFERENCES [dbo].[DistDealerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__OrderDeta__Retai__286302EC]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([Retailer_Id])
REFERENCES [dbo].[RetailerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BeatDistr__Beat___5BE2A6F2]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[BeatDistributorMapping]  WITH CHECK ADD FOREIGN KEY([Beat_Id])
REFERENCES [dbo].[BeatDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BeatDistr__Distr__5AEE82B9]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[BeatDistributorMapping]  WITH CHECK ADD FOREIGN KEY([Distributor_Id])
REFERENCES [dbo].[DistDealerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__RetailBea__Beat___60A75C0F]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[RetailBeatMapping]  WITH CHECK ADD FOREIGN KEY([Beat_Id])
REFERENCES [dbo].[BeatDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__RetailBea__Retai__619B8048]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[RetailBeatMapping]  WITH CHECK ADD FOREIGN KEY([Retailer_Id])
REFERENCES [dbo].[RetailerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__OrderItem__Item___2F10007B]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Item] ([ID])
GO
/****** Object:  ForeignKey [FK__OrderItem__Order__2E1BDC42]    Script Date: 03/31/2016 11:16:07 ******/
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([Order_Id])
REFERENCES [dbo].[OrderDetail] ([ID])
GO
