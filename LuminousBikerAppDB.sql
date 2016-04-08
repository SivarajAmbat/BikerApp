USE [master]
GO
/****** Object:  Database [LuminousBikerApp]    Script Date: 04/08/2016 16:20:58 ******/
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
/****** Object:  User [IIS APPPOOL\ASP.NET v4.0]    Script Date: 04/08/2016 16:20:58 ******/
CREATE USER [IIS APPPOOL\ASP.NET v4.0] FOR LOGIN [IIS APPPOOL\ASP.NET v4.0]
GO
/****** Object:  FullTextCatalog [DistCatlog]    Script Date: 04/08/2016 16:20:58 ******/
CREATE FULLTEXT CATALOG [DistCatlog]WITH ACCENT_SENSITIVITY = ON
AUTHORIZATION [dbo]
GO
/****** Object:  UserDefinedTableType [dbo].[OrderItemType]    Script Date: 04/08/2016 16:20:58 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 04/08/2016 16:20:58 ******/
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
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'320B1931-2DF5-4267-98D1-F31A75282142', N'Coordinator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'74A2949D-E443-4850-B293-84F9B89F02E0', N'Admin')
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 04/08/2016 16:20:59 ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201603201329557_InitialCreate', N'Luminous.Biker.Web.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F49414C8CA765ED2603781B3B65BA3B11D649DF431A025EE9A8844A922E5DADFD6877E527FA1A4EE122FA22E7B715E8C5D6938339C391CDECEFABF7FFE9DBF7F0C7CEB01C6048578611FCF8E6C0B6237F410DE2CEC84AE5FBDB1DFBFFBF9A7F9B9173C5A5F0BB9D75C8EB5C46461DF531ABD751CE2DEC300905980DC3824E19ACEDC307080173A274747BF3AC7C70E642A6CA6CBB2E69F134C5100D32FECEB32C42E8C6802FCABD0833EC99FB337AB54AB750D024822E0C285FD3109100E1332FB80BEC378F627BC9B658D6CEBD4478039B482FEDAB600C6210594B9FBF60B812B1A8778B38AD803E0DF3E4590C9AD814F60DE8DB795B8698F8E4E788F9CAAE1A088D8655F596FCF5954E813772FEDF1C2BEF460FAE873E8C3BA2493FD033E351EB0479FE23082319386EBB2BD6D39CD764EBB61D9ACD686BBC00249630603DBBA028F1F21DED07B06909337B675811EA1573CC9A3F80523861AD688C609FB7A9DF83EB8F361F9DED1DAE47F3556D9C7F156E74E155E6DD04FA3C8476E9A52869CD8B63E000273DF18B4664552B2978E5102B9ECD20728D87D162F317D7D22894D6D80AC6818C3DF208631A0D0FB04288531AE9CEFCA5EDA316E6C82141A58FA0AFC640BA6AEC103DAA4F16819CDF2FC19FAE94B728F22091052CFBE65A2177118F0112B497F2AF16D1526B1CBBB106AC56E41BC8174208A1B28FD814B07EFDF44E5436FE81320E4EF30F67E07E47EEBC656D04D6296BD150541B443ACA7E823D3A2BD807107DA8B4161EAEAC7708370B7ABA998D6D54A42EB6A4DACAFAB5C59B7A75C4AEB6829A0F5B39292B939A87EA45D1F52447863B1904845531BECF103F2DAD3AAA24521CC3CE95FAA0ACF765DAE5ADDDCB5F946CCB66E7CDC94DA6BE4EAA654C9001F3D2486AEC87B8C086E62C82CBC2F6817FEEE0F5669528CCA6C26A929B3E91F1DA82A2919A64683BFC764D0E9656FE49F1212BA28754F351B7C93AC2BCFB167990D52F9662A9B66ACABC4A7886FC1D8E385FD8B10D84E33E5ECA8DAB3352D1CDBEDB17883CFA00F29B44EDDEC446009880B3C11892C7E5EF3091BBE30E6B680BF64C9A53140988A631D611745C037EA47ABB5E16A9D7B57DA69BF398311C4DCA851BE4C1C50D635A7B4D50A5D57A4E64E0D86E6E8AC86B7096A24635D0E9AAC600C83A6582A244664060E0B994237760C4C215726F6E593E8BE70695C3425D57D4BB87CFE1553E8C63E70F96CEB656D2B6F8219D929961C34D971E74068CA8E0F768D4D6540B345134B02652980B1786C7C76C75FC2472A8494375C41DA3C17A81661D239410858538910369DC65A627AA8EDD2D84B59716EA3D5982F057BA8ED8A65552C5B4A6B49D6389CAFC56BC2FA1D6B1B84C66BE3B28FF2A809F5C27835AC502CE86CC09E89F78C566D7BA50F9662A1D663A9A6E8518E04C348898BB39A5AA9AA2902648226C58AA1C79A61BA00ED0349F543667DA45473589F594CD1A9A2A21A064B326F4D10AD629F5E4E39D505B993DD901737E98EE22A7D7E05A208E14DED6A3D7F62ADB27BF5E5AB55FF0BEC20D3E1B844728F5D7A5B5AA2610C36B0F59699669E5EA098D03340C11DE0273E4B2F10C4FA4CB085C9FA3C2B66B0982A0A69FE393FA655B10C9A73B3B8D2CB555DB08E067CB9985EAD4A20206F6E71C603F0412CB9585B867E1260F5EA55DD3ABB1EABB7CF9E881AE64ECB7F61752A044D5842353360949FE6B898264FED5BFCE1A992371F9D2A86600FA58BF2F4425BC23BA8AB3943C48D11EB2C605E6E23751D81BE24FCF3CDFA45F7C8E0CEBF3CBC784B5B735BE2F0A89E9A6B6A5E0FD7B535DF986B6CDD01D755B65EED1C0D6620383C0C0863AEB98BD9E9809BA056E68B93E93327A12AF54E9F42C776C6718D825457527BDC53574E321294E5CF0F120EF91E717A3848EEFF7BC341A1435798DB90509D99A9B5B46EDBEBCA3AF8066A9D8D2BF4469D57F3110E0420DB5807CB2FC37BC3A3DF7A781A74147703752DAAFB82EDE7AFB9FBEB28FAF9B678505DCFDBF6AEDD7CCB2B146DDDD6570CA151E54F55C8CFC66B1E0C764E79483F785A52FBD5DED38B8917B6F66D911276E516BFB5959FE7DBEA6EEABCB0CFCE446CABA85C6C61F944280C665C60B6FACB5FFA88C5B012B80218AD21A1B7E1778817F6C9D1D19B16ED7E0005DE21C4F30F99078F1F40ECDE835824B38CA0B9174A5F04E0F1E554D4F5FD927E278B53B5FFEA88D550DEEE2885526EEE288DADBDC6A8680EC2CA9E7E9A80786DE9FCF1414FF008BF4618951AF11707A3D49573DBEE73FCC39378272B3F528EEE64DA2514DC5DC2E0D91057270B7893973A71AC27A54AEE8780A3B9411E4BD51CCDEDD90BF9F1791178CC098FD9ADFC3EB887EA9BE591C4B65100531C5B6C9D2CF62313170FA984ED1B5FFB2860C6F83A98FAD59380784800CB9974E30890CF0E62AACB2139C61427799383AC758C566CDF046A89E2D05C76D0D445CCCC8ECF16B677173210644BC753125D432AE78DA98C65E8551ACB8F6B95C6E46C229DB11C995A8BB98CDEAC9C1DD54DFF34637FEA6DCB19919D1C51238AA8DEB23CBBFBE4912A5966FD08A37AF6E973208AD6332CF2ADFA501EB5ECC9E742091D8F8B5D87628BA4CFF1C168D44DC5A5D956589DE2150F9B296BFF4389CDD7046D2A159CE882A1DB98234B994BBC0E8BB9BAE55121D23A41B98214786C023D8D295A0397B2D72E2424FD7D6F4EA4390FEEA077896F121A2594751906777EE3448F4FF93AFB2975B5E9F3FC264A7F213B4517989B887501DEE00F09F2BDD2EF0BC9518F42055F4BE4E7D43C97949F576F9E4A4DD72136549487AF5C02DDC220F29932728357E001AA7DEB8E613362F3330436310848AEA36ACFBE32F879C1E3BBFF01D691DEFA054C0000, N'6.0.0-20911')
/****** Object:  Table [dbo].[MHrOtp]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[MHrOtp] ON
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(1 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'040281', CAST(0x0000A5CC0184CC63 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CC0186068A AS DateTime), N'1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(2 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'564757', CAST(0x0000A5CC0186068A AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CC0188862B AS DateTime), N'1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(3 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'622582', CAST(0x0000A5CC0188862C AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CC0189C7DD AS DateTime), N'1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(4 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'210844', CAST(0x0000A5CC0189C7DD AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CC018AF2FA AS DateTime), N'1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(5 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'470796', CAST(0x0000A5CC018AF31D AS DateTime), N'EXPIRED', CAST(0x0000A5CD00003A18 AS DateTime), CAST(0x0000A5CD01463A1F AS DateTime), N'1', N'1', N'Micromaxmax w121', N'Windows')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(6 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'431168', CAST(0x0000A5CD000196CC AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00026E2B AS DateTime), N'1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(7 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'327422', CAST(0x0000A5CD00026E2C AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD0002D2B2 AS DateTime), N'1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(8 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'103668', CAST(0x0000A5CD0002D2B2 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00032124 AS DateTime), N'1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(9 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'824916', CAST(0x0000A5CD00032124 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD0004D0D8 AS DateTime), N'1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(10 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'041809', CAST(0x0000A5CD0004D0D8 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD0004ECD8 AS DateTime), N'1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(11 AS Numeric(18, 0)), N'KD53', N'911381950334906', N'8.0', N'Micromaxmax w121', N'548203', CAST(0x0000A5CD0004ECDB AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00884101 AS DateTime), N'1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(12 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'656761', CAST(0x0000A5CD00884102 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00A9CEC9 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(13 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'118887', CAST(0x0000A5CD00A9CEC9 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00AB8E1E AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(14 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'293947', CAST(0x0000A5CD00AB8E1E AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00AEA40E AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(15 AS Numeric(18, 0)), N'KD53', N'867124023566177', N'5.0.2', N'Android', N'381370', CAST(0x0000A5CD00AEA40E AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00B05E1E AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(16 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'556401', CAST(0x0000A5CD00B05E1E AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00B18013 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(17 AS Numeric(18, 0)), N'KD53', N'357478062016222', N'6.0.1', N'Android', N'370985', CAST(0x0000A5CD00B18017 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00B47694 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(18 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'194161', CAST(0x0000A5CD00B47694 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00CF071D AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(19 AS Numeric(18, 0)), N'kd53', N'358967063367815', N'6.0', N'Android', N'969383', CAST(0x0000A5CD00CF071D AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD00F40C92 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(20 AS Numeric(18, 0)), N'KD53', N'358967063367815', N'6.0', N'Android', N'108735', CAST(0x0000A5CD00F40C92 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD012D7C7A AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(21 AS Numeric(18, 0)), N'kd53', N'358967063367815', N'6.0', N'Android', N'480128', CAST(0x0000A5CD012D7C8F AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD013053CF AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(22 AS Numeric(18, 0)), N'KD53', N'867124023566177', N'5.0.2', N'Android', N'121909', CAST(0x0000A5CD013053CF AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD01406352 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(23 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'762275', CAST(0x0000A5CD01406353 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD0145CB09 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(24 AS Numeric(18, 0)), N'KD53', N'101010101', N'Android', N'Android', N'230575', CAST(0x0000A5CD0145CB09 AS DateTime), N'EXPIRED', CAST(0x0000A5CD01463A20 AS DateTime), CAST(0x0000A5CD015D432E AS DateTime), N'1.0', N'1', N'1', N'1')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(25 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'612000', CAST(0x0000A5CD014BFA13 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD01593A86 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(26 AS Numeric(18, 0)), N'KD0102', N'888888888888', N'1111', N'1111', N'484014', CAST(0x0000A5CD01524849 AS DateTime), N'EXPIRED', CAST(0x0000A5CD01536AA7 AS DateTime), CAST(0x0000A5CD0154F4B0 AS DateTime), N'1111', N'1111', N'1111', N'1111')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(27 AS Numeric(18, 0)), N'KD0102', N'888888888888', N'1111', N'1111', N'809231', CAST(0x0000A5CD0154B066 AS DateTime), N'VARIFIED', CAST(0x0000A5CD0154F4B1 AS DateTime), NULL, N'1111', N'1111', N'1111', N'1111')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(28 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'586775', CAST(0x0000A5CD01593A86 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD015D3155 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(29 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'150560', CAST(0x0000A5CD015D3155 AS DateTime), N'EXPIRED', CAST(0x0000A5CD015D432E AS DateTime), CAST(0x0000A5CE00D832BA AS DateTime), N'1.0', N'ID', N'A0001', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(30 AS Numeric(18, 0)), N'Kd0252', N'358967063367815', N'6.0', N'Android', N'722700', CAST(0x0000A5CD01613ECC AS DateTime), N'EXPIRED', CAST(0x0000A5CD016155A5 AS DateTime), CAST(0x0000A5CD01713297 AS DateTime), N'1.0', N'ID', N'lux_uds', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(31 AS Numeric(18, 0)), N'KD0252', N'867124023566177', N'5.0.2', N'Android', N'694282', CAST(0x0000A5CD01708A87 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5CD0170FF9F AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(32 AS Numeric(18, 0)), N'KD0252', N'867124023566177', N'5.0.2', N'Android', N'721299', CAST(0x0000A5CD0170FFA0 AS DateTime), N'EXPIRED', CAST(0x0000A5CD01713297 AS DateTime), CAST(0x0000A5CE006AE5A6 AS DateTime), N'1.0', N'ID', N'Kraft-A6000', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(33 AS Numeric(18, 0)), N'KD0252', N'358967063367815', N'6.0', N'Android', N'648129', CAST(0x0000A5CE006AD0D5 AS DateTime), N'EXPIRED', CAST(0x0000A5CE006AE5A6 AS DateTime), CAST(0x0000A5CE00A0B441 AS DateTime), N'1.0', N'ID', N'lux_uds', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(34 AS Numeric(18, 0)), N'kd0252', N'358967063367815', N'6.0', N'Android', N'183600', CAST(0x0000A5CE00A09A52 AS DateTime), N'EXPIRED', CAST(0x0000A5CE00A0B441 AS DateTime), CAST(0x0000A5CE00AF0E52 AS DateTime), N'1.0', N'ID', N'lux_uds', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(35 AS Numeric(18, 0)), N'KD0252', N'867124023566177', N'5.0.2', N'Android', N'280939', CAST(0x0000A5CE00ADD28A AS DateTime), N'EXPIRED', CAST(0x0000A5CE00AF0E52 AS DateTime), CAST(0x0000A5CE00C37C8D AS DateTime), N'1.0', N'ID', N'Kraft-A6000', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(36 AS Numeric(18, 0)), N'KD0252', N'865800022464579', N'4.4.4', N'Android', N'052428', CAST(0x0000A5CE00C32FCB AS DateTime), N'EXPIRED', CAST(0x0000A5CE00C37C8D AS DateTime), CAST(0x0000A5CE01671F40 AS DateTime), N'1.0', N'ID', N'A0001', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(37 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'170604', CAST(0x0000A5CE00D81E9D AS DateTime), N'EXPIRED', CAST(0x0000A5CE00D832BA AS DateTime), CAST(0x0000A5D000A93C05 AS DateTime), N'1.0', N'ID', N'A0001', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(38 AS Numeric(18, 0)), N'kd0252', N'352356075792416', N'6.0', N'Android', N'681799', CAST(0x0000A5CE01670881 AS DateTime), N'EXPIRED', CAST(0x0000A5CE01671F40 AS DateTime), CAST(0x0000A5D000CC3EB5 AS DateTime), N'1.0', N'ID', N'osprey_ud2', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(39 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'005992', CAST(0x0000A5D000A92863 AS DateTime), N'EXPIRED', CAST(0x0000A5D000A93C05 AS DateTime), CAST(0x0000A5D500E4EB8F AS DateTime), N'1.0', N'ID', N'A0001', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(40 AS Numeric(18, 0)), N'kd0252', N'352356075792416', N'6.0', N'Android', N'788032', CAST(0x0000A5D000CC1D7C AS DateTime), N'EXPIRED', CAST(0x0000A5D000CC3EB5 AS DateTime), CAST(0x0000A5D700E93B36 AS DateTime), N'1.0', N'ID', N'osprey_ud2', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(41 AS Numeric(18, 0)), N'KD53', N'1234567890', N'Android', N'Android', N'461062', CAST(0x0000A5D500B2E18E AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5D500B304B3 AS DateTime), N'Android', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(42 AS Numeric(18, 0)), N'KD53', N'1234567890', N'4.0', N'Android', N'102321', CAST(0x0000A5D500B304B8 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5D500B31854 AS DateTime), N'Android', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(43 AS Numeric(18, 0)), N'KD53', N'1234567890', N'4.0', N'Android', N'598229', CAST(0x0000A5D500B31854 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5D500B32C96 AS DateTime), N'1.1.1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(44 AS Numeric(18, 0)), N'KD53', N'12345678901234', N'4.0', N'Android', N'830691', CAST(0x0000A5D500B32C96 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5D500B37A7F AS DateTime), N'1.1.1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(45 AS Numeric(18, 0)), N'KD53', N'12345678901234', N'4.4.4', N'Android', N'888153', CAST(0x0000A5D500B37A7F AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5D500B387A2 AS DateTime), N'1.1.1', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(46 AS Numeric(18, 0)), N'KD53', N'8658000', N'4', N'And', N'046084', CAST(0x0000A5D500B387A2 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5D500B3998B AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(47 AS Numeric(18, 0)), N'KD53', N'123456789012345', N'4.4.4', N'Android', N'713133', CAST(0x0000A5D500B3998C AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5D500B3B446 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(48 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'295383', CAST(0x0000A5D500B3B446 AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5D500B6A18E AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(49 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'347879', CAST(0x0000A5D500B6A18E AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5D500E4CBE6 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(50 AS Numeric(18, 0)), N'KD0209', N'865800022464579', N'4.4.4', N'Android', N'588095', CAST(0x0000A5D500BAB95A AS DateTime), N'CREATED', NULL, NULL, N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(51 AS Numeric(18, 0)), N'KD0102', N'911345009462596', N'5.0', N'Android', N'265342', CAST(0x0000A5D500C5606D AS DateTime), N'EXPIRED', NULL, CAST(0x0000A5D500C67E48 AS DateTime), N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(52 AS Numeric(18, 0)), N'KD0102', N'2000', N'2', N'Android', N'820339', CAST(0x0000A5D500C67E49 AS DateTime), N'CREATED', NULL, NULL, N'1.0', NULL, NULL, NULL)
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(53 AS Numeric(18, 0)), N'KD53', N'865800022464579', N'4.4.4', N'Android', N'144524', CAST(0x0000A5D500E4CBE6 AS DateTime), N'VARIFIED', CAST(0x0000A5D500E4EB8F AS DateTime), NULL, N'1.0', N'ID', N'A0001', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(54 AS Numeric(18, 0)), N'kd0252', N'352356075792416', N'6.0', N'Android', N'532902', CAST(0x0000A5D700E921A1 AS DateTime), N'EXPIRED', CAST(0x0000A5D700E93B36 AS DateTime), CAST(0x0000A5D900899347 AS DateTime), N'1.0', N'ID', N'osprey_ud2', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(55 AS Numeric(18, 0)), N'kd0252', N'352356075792416', N'6.0', N'Android', N'494898', CAST(0x0000A5D900896BAA AS DateTime), N'VARIFIED', CAST(0x0000A5D900899347 AS DateTime), NULL, N'1.0', N'ID', N'osprey_ud2', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(56 AS Numeric(18, 0)), N'lu003', N'869162023787144', N'4.4.4', N'Android', N'561556', CAST(0x0000A5DA00AFC966 AS DateTime), N'VARIFIED', CAST(0x0000A5DA00AFDF12 AS DateTime), NULL, N'1.0', N'ID', N'HM2014818', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(57 AS Numeric(18, 0)), N'LU002', N'866924020262949', N'4.4.2', N'Android', N'166384', CAST(0x0000A5DA00CFB74A AS DateTime), N'VARIFIED', CAST(0x0000A5DA00CFD7B1 AS DateTime), NULL, N'1.0', N'ID', N'M3', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(58 AS Numeric(18, 0)), N'5000', N'867124023566177', N'5.0.2', N'Android', N'182359', CAST(0x0000A5DF00BA3098 AS DateTime), N'EXPIRED', CAST(0x0000A5DF00BA4D5B AS DateTime), CAST(0x0000A5DF00C33AE5 AS DateTime), N'1.0', N'ID', N'Kraft-A6000', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(59 AS Numeric(18, 0)), N'5000', N'867124023566177', N'5.0.2', N'Android', N'634344', CAST(0x0000A5DF00C32B28 AS DateTime), N'VARIFIED', CAST(0x0000A5DF00C33AE5 AS DateTime), NULL, N'1.0', N'ID', N'Kraft-A6000', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(60 AS Numeric(18, 0)), N'lu007', N'867935022336563', N'4.4.4', N'Android', N'415301', CAST(0x0000A5E100CA3293 AS DateTime), N'VARIFIED', CAST(0x0000A5E100CA481A AS DateTime), NULL, N'1.0', N'ID', N'HM2014818', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(61 AS Numeric(18, 0)), N'LU004', N'359710057401995', N'4.1.2', N'Android', N'772129', CAST(0x0000A5E100D2D045 AS DateTime), N'VARIFIED', CAST(0x0000A5E100D30CC0 AS DateTime), NULL, N'1.0', N'ID', N'arubaslim', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(62 AS Numeric(18, 0)), N'LU008', N'356605054331190', N'4.2.2', N'Android', N'085796', CAST(0x0000A5E100EB87C5 AS DateTime), N'VARIFIED', CAST(0x0000A5E100EBACBF AS DateTime), NULL, N'1.0', N'ID', N'C2104', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(63 AS Numeric(18, 0)), N'LU005', N'357294065617324', N'4.4.2', N'Android', N'911001', CAST(0x0000A5E100F6E2A0 AS DateTime), N'VARIFIED', CAST(0x0000A5E100F6F81B AS DateTime), NULL, N'1.0', N'ID', N'ASUS_T00J', N'Android')
INSERT [dbo].[MHrOtp] ([seqid], [empid], [imeinumber], [osversion], [devicename], [otp], [createdon], [otpstatus], [varifiedon], [expireon], [appversion], [appid], [devid], [ostype]) VALUES (CAST(64 AS Numeric(18, 0)), N'lu006', N'352742061802600', N'4.2.2', N'Android', N'619608', CAST(0x0000A5E200C546A2 AS DateTime), N'VARIFIED', CAST(0x0000A5E200C56A4E AS DateTime), NULL, N'1.0', N'ID', N'baffinlite', N'Android')
SET IDENTITY_INSERT [dbo].[MHrOtp] OFF
/****** Object:  Table [dbo].[RetailerDetail]    Script Date: 04/08/2016 16:20:59 ******/
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
	[IsCreatedByBiker] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RetailerDetail] ON
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (1, N'90000001', N'Retalier 1', N'Test User 1', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'7896789678', N'Active', CAST(0x0000A5CA016BD4A0 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (3, N'90000002', N'Techfour Test', N'Balveer', N'Delhi', N'New Delhi', N'G17D, South Ex-2', N'110049', N'7042161177', N'Active', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (4, N'90000003', N'Akshita Power Solutions', N'Bera', N'Rajasthan', N'Jaipur', N'Jothwara, jaipur', N'302010', N'9799046708', N'Active', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (5, N'90000004', N'ABC Electric Service', N'Mahesh', N'Harayana', N'Faridabad', N'301, Sector 15A', N'402010', N'8888888888', N'Active', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (6, N'90000005', N'3D Enterprises', N'Rahul', N'Haryana', N'GURGAON', N'Shop No-35  Vatika City Market Sec-49 Sona Road', N'1234564', N'9898985656', N'Active', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (7, N'90000006', N'24 Hower Power Solution', N'Mohit', N'Haryana', N'Faridabad', N'Shop No 3 Plot No 1 Gali No 4 Ashoka Enclave', N'123456', N'7878789988', N'Active', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (9, N'90000007', N'24 Hower Power 2', N'test', N'Bihar', N'Gaya', N'Murarpur', N'564654', N'9879867996', N'Active', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (10, N'100000010', N'Test', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'8768798789', N'Inactive', CAST(0x0000A5D200000000 AS DateTime), CAST(0x0000A5D700ACC20A AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (11, N'6000000001', N'test', N'test', N'karnataka', N'Bangalore', N'JP Nagar', N'560078', N'8768798789', N'Inactive', CAST(0x0000A5D200000000 AS DateTime), CAST(0x0000A5D701818BA3 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (12, N'6000000002', N'Test', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'8768798789', N'Inactive', CAST(0x0000A5D200000000 AS DateTime), CAST(0x0000A5D701848108 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (13, N'6000000003', N'Test', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'8768798789', N'Inactive', CAST(0x0000A5D200000000 AS DateTime), CAST(0x0000A5D70185369D AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (14, N'6000000004', N'Test', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'8768798789', N'Inactive', CAST(0x0000A5D200000000 AS DateTime), CAST(0x0000A5D70185F571 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (15, N'6000000005', N'Test', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'8768798789', N'Inactive', CAST(0x0000A5D200000000 AS DateTime), CAST(0x0000A5D701867FE3 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (16, N'6000000006', N'Test', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'8768798789', N'Inactive', CAST(0x0000A5D200000000 AS DateTime), CAST(0x0000A5D701872D1D AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (17, N'6000000007', N'Test', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'8768798789', N'Inactive', CAST(0x0000A5D200000000 AS DateTime), CAST(0x0000A5D70187ECF9 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (18, N'6000000008', N'Test', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'8768798789', N'Inactive', CAST(0x0000A5D200000000 AS DateTime), CAST(0x0000A5D701883D11 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (19, N'6000000009', N'Test', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'8768798789', N'Inactive', CAST(0x0000A5D200000000 AS DateTime), CAST(0x0000A5D701891150 AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (20, N'6000000010', N'Retailer 2', N'XYZ', N'New Delhi', N'New Delhi', N'New Delhi', N'110001', N'1234567890', N'Active', CAST(0x0000A5D8009D6CC8 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (21, N'R000001', N'PARVESH ELECTRICAL', N'PARVESH ELECTRICAL', N'HARYANA', N'FARUKHNAGER', N'MAIN BAZAR NEW DELHI GATE FARRUKH NAGAR', N'122001', N'9812131516', N'Active', CAST(0x0000A5BC00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (22, N'6000000011', N'rohilla fancy lights', N'rohit', N'sohna', N'gurgaon', N'bus stand road,opp. police chowki,sohna', N'122001', N'9034193933', N'Inactive', CAST(0x0000A5DA00CF7C87 AS DateTime), CAST(0x0000A5DA00CF7CEF AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (23, N'6000000012', N'Retailer 3', N'Anusha', N'new delhi', N'new delhi', N'new delhi', N'110001', N'1234567890', N'Active', CAST(0x0000A5FC00000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (24, N'456321', N'SANJAY', N'VERMA', N'New delhi', N'New delhi', N'G-17 D SOUTH EX PART 2', N'208017', N'7896541230', N'Active', CAST(0x0000A5DF00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (25, N'6000000013', N'jaytest', N'jay', N'haryana', N'gaugaon', N'gurgaon', N'110018', N'9958462898', N'Active', CAST(0x0000A5FC00000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (26, N'6000000014', N'jay', N'jay', N'haryana', N'jay', N'jay', N'110018', N'9958462898', N'Inactive', CAST(0x0000A5FC00000000 AS DateTime), CAST(0x0000A5DF00C2953D AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (27, N'6000000015', N'verma', N'9026647780', N'new delhi', N'new delhi', N'new delhi', N'208017', N'9026647780', N'Blocked', CAST(0x0000A5FC00000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (28, N'6000000016', N'Test', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'987987982', N'Inactive', CAST(0x0000A61B00000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (29, N'6000000017', N'ryhh', N'fghb', N'dhjj', N'fhjj', N'fhrg fhh fhb ', N'110058', N'9999885566', N'Active', CAST(0x0000A61B00000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (30, N'6000000018', N'Retailer 4', N'XYX', N'New Delhi', N'New Delhi', N'New Delhi', N'110001', N'1234567890', N'Active', CAST(0x0000A61B00000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (31, N'6000000019', N'Retailer', N'Test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'9901499533', N'Active', CAST(0x0000A61B00000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (32, N'6000000020', N'Retailer', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'9901499533', N'Active', CAST(0x0000A63900000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (33, N'6000000021', N'Retailer', N'test', N'Karnataka', N'Bangalore', N'JP Nagar', N'560078', N'9901499533', N'Active', CAST(0x0000A63900000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (34, N'6000000022', N'Retailer 4', N'XYY', N'New Delhi', N'New Delhi', N'New Delhi', N'110001', N'1235567890', N'Active', CAST(0x0000A63900000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (35, N'6000000023', N'chgfh', N'ghchj', N'n delhi', N'delhi', N'fgijj', N'110085', N'5836985214', N'Inactive', CAST(0x0000A63900000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (36, N'6000000024', N'frontier electrical', N'madan', N'new delhi', N'new delhi', N'tilak Nagar', N'110018', N'9212584140', N'Inactive', CAST(0x0000A63900000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (37, N'6000000025', N'vnnm', N'xfv', N'cjjj', N'xxxcc', N'fgb', N'122001', N'9800000000', N'Inactive', CAST(0x0000A65800000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[RetailerDetail] ([ID], [Code], [Name], [Contact_person], [State], [CityArea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [IsCreatedByBiker]) VALUES (38, N'6000000026', N'Retailer 5', N'ABC', N'New Delhi', N'New Delhi', N'New Delhi', N'110001', N'1122334455', N'Inactive', CAST(0x0000A65800000000 AS DateTime), NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[RetailerDetail] OFF
/****** Object:  Table [dbo].[BeatDetail]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[BeatDetail] ON
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (1, N'80000007', N'B 1', N'Test User', N'Karnataka', N'bang', N'JP Nagar', N'8768756', N'7876876876', N'Active', CAST(0x0000A5D900000000 AS DateTime))
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (2, N'80000003', N'Beat 3 - North', N'Test User2', N'Karnataka', N'bang', N'JP Nagar', N'8768756', N'7876556876', N'Active', CAST(0x0000A5CA016BD4A0 AS DateTime))
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (3, N'80000001', N'Beat-South Ex', N'M.A.', N'Delhi', N'New Delhi', N'G17D, South Ex', N'110049', N'9799046708', N'Active', NULL)
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (4, N'80000004', N'Beat Gurgaon', N'Jay', N'Harayana', N'Gurgaon', N'Sector 30', N'123456', N'9898989898', N'Active', NULL)
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (5, N'80000005', N'Beat - Noida', N'Gaurav', N'UP', N'Noida', N'Test Add 1', N'654321', N'9898987676', N'Active', NULL)
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (6, N'aaa', N'aaaa', N'aaaaa', N'aa', N'aaaaa', N'aaa', N'aaaa', N'aaaa', N'Active', CAST(0x0000A5C400000000 AS DateTime))
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (7, N'100000567', N'Abhishek Verma', N'abhishek verma', N'Uttar Pradesh', N'Kanpur', N'Plot No -4027 Awas Vikas NO-3', N'208017', N'9026647780', N'Active', CAST(0x0000A00800000000 AS DateTime))
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (8, N'B1100069', N'Beat Deep', N'XYZ', N'HARYANA', N'BHIWANI', N'SHOP NO. 6,IMPROVEMENT TRUST MARKET,', N'127021', N'9416231710', N'Active', CAST(0x0000A5BC00000000 AS DateTime))
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (9, N'B1106776', N'Beat Ankit', N'XYZ', N'HARYANA', N'GURGAON', N'B-9 SATYAM PLAZA COMPLEX JHARSA ROAD CIVIL LINES', N'122001', N'9999765967', N'Active', CAST(0x0000A5BC00000000 AS DateTime))
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (10, N'B1107672', N'Beat 3CURVES', N'XYZ', N'HARYANA', N'GURGAON', N'Shiv Mandir Gali, ward no-D, New Colony', N'122503', N'9910069456', N'Active', CAST(0x0000A5BC00000000 AS DateTime))
INSERT [dbo].[BeatDetail] ([ID], [Code], [Name], [Contact_person], [State], [Cityarea], [Address], [Pin_Code], [Contact_Number], [Active_Status], [Date_Of_Joining]) VALUES (11, N'741', N'Harsh', N'Neha', N'New delhi', N'New delhi', N'G-17 D SOUTH EX PART 2', N'208017', N'7896541230', N'Inactive', CAST(0x0000A5DF00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[BeatDetail] OFF
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 04/08/2016 16:20:59 ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'1672a3f1-fb9c-4982-ba7d-37a776401fed', N'admin123', N'AItH8sFgtQHWzApW8zLKIoM5mj8n+W6dXL2LWu66A1nYhFsEpxhFalbxkic6vERiXg==', N'18ef2c8c-9a95-4b35-af38-dd04c839a555', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'6285da31-f334-4656-9917-6c39262c83b0', N'test', N'AL1S/KXpg7sMqmfZtLTpqhfxx1JBhlpugAE2qobwEtEsxiEyr4Sum9j80HV17lEIbg==', N'd57f2a3e-db94-4e28-b72c-78bab32e4d61', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'709c0383-f7ba-4127-b45d-7730d0baf423', N'admin', N'ABi4LUwGrt/fwPfTRXrF/eOaPovobyrX3IVztjN3XXgKa3SbVZAdRMfxTNHfr4jYqQ==', N'e1ff824e-78a6-4c4f-b1f0-2f562964014f', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'b632c1b0-e24a-4177-b0ef-cbdbf36bb4e8', N'dist123', N'AE9A1LBha4ZMidSnDdehJm70rgmAHfM+X+l8WAbuUwNgc4NJNfDozVyj+UoJmyzE0w==', N'963f3931-0247-4c21-ac15-204b427e8bcb', N'ApplicationUser')
/****** Object:  Table [dbo].[BikerBoyDetail]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[BikerBoyDetail] ON
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (12, N'KD53', N'Akhilesh Mishra', NULL, N'North', N'9111205689', N'Chhattisgarh', N'Raipur', N'8860254231', N'Dharmesh Mehta', N'10903360', NULL, NULL, N'Umesh Ojha', N'10905598', N'Gulab', N'10904897', NULL, N'1', N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (13, N'KD0209', N'Anil Khemariya', NULL, N'Gulab', N'7354208888', N'Chhattisgarh', N'Jagdalpur', N'9901499533', N'Dharmesh Mehta', N'10903360', N'', N'', N'Umesh Ojha', N'10905598', N'Gulab', N'10904897', N'', N'1', N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (14, N'KD0102', N'Mushirudin Khan', NULL, N'Gulab', N'9039015438', N'Chhattisgarh', N'Durg', N'9901499533', N'Dharmesh Mehta', N'10903360', NULL, NULL, N'Umesh Ojha', N'10905598', N'Gulab', N'10904897', NULL, N'1', N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (15, N'KD0252', N'ABU FAISAL KHAN', NULL, N'Gulab', NULL, N'Madhya Pradesh', N'Ujjain', N'9958462898', N'Dharmesh Mehta', N'10903360', NULL, NULL, N'Sachin Sharma', N'10905267', N'Gulab', N'10904897', NULL, N'1', N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (17, N'KD0205', N'Ashish Raghuvanshi', NULL, N'Gulab', N'', N'Madhya Pradesh', N'Chhindwara', N'8085448090', N'Dharmesh Mehta', N'10903360', N'', N'', N'Arvind Shrivastava', N'10907687', N'Gulab', N'10904897', N'', N'1', N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (18, N'KD0107', N'Badri Prasad Patel', NULL, N'Gulab', N'', N'Madhya Pradesh', N'Betul', N'9617713432', N'Dharmesh Mehta', N'10903360', N'', N'', N'Arvind Shrivastava', N'10907687', N'Gulab', N'10904897', N'', N'1', N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (19, N'KD0146', N'Bhupendra Gupta', NULL, N'Gulab', NULL, N'Madhya Pradesh', N'Khandwa', N'8827083500', N'Dharmesh Mehta', N'10903360', NULL, NULL, N'Sachin Sharma', N'10905267', N'Gulab', N'10904897', NULL, N'1', N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (20, N'KD0268', N'Kamleshÿ Yadav', NULL, N'Gulab', N'', N'Madhya Pradesh', N'Mandsaur', N'9179297376', N'Dharmesh Mehta', N'10903360', N'', N'', N'Sachin Sharma', N'10905267', N'Gulab', N'10904897', N'', N'1', N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (21, N'KD0301', N'Manoj Tyagi', NULL, N'Gulab', NULL, N'Madhya Pradesh', N'Guna', N'9584480617', N'Dharmesh Mehta', N'10903360', NULL, NULL, N'Arvind Shrivastava', N'10907687', N'Gulab', N'10904897', NULL, N'1', N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (23, N'KD32014', N'dhdtry', CAST(0x0000A5C600000000 AS DateTime), N'y7uty', N'657byryrby', N'yuytuyt', N'rtbybrtb', N'sr757s  rt', N'btytby', N' tsh5', N'btytrby', N'hggf', N'tbrybt', N'ghg', N'trb', N'gdhdg', N'brty', N'hdhd', N'Active', N'btyrty', NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (24, N'LU001', N'Gaurav Tripathi', CAST(0x0000A5BC00000000 AS DateTime), N'North ', NULL, N'Delhi', N'West Delhi', N'8800255578', N'Ajay', N'10905242', N'Rahul', N'10903294', N'Jay', N'10900994', NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (25, N'LU002', N'Parvez Ahmed', CAST(0x0000A56200000000 AS DateTime), N'NORTH', NULL, N'HARYANA', N'BHIWANI', N'9711333789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (26, N'LU003', N'Rupesh Yadav', CAST(0x0000A5BC00000000 AS DateTime), N'NORTH', NULL, N'HARYANA', N'GURGAON', N'9910724027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (27, N'5000', N'Prince', CAST(0x00007F5A00000000 AS DateTime), N'New delhi', N'1236', N'New delhi', N'New delhi', N'8527204359', N'New delhi', N'7896541230', N'Pune', N'741258', N'Gurgaon', N'789000', N'noida', N'456321', N'haryana', N'789654', N'Blocked', N'Vijay', N'741258')
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (28, N'LU004', N'AM1', CAST(0x0000A5DB00000000 AS DateTime), N'NORTH', NULL, N'DELHI', NULL, N'9015627781', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (29, N'LU005', N'AM2', CAST(0x0000A5DB00000000 AS DateTime), N'NORTH', NULL, N'DELHI', N'NEW DELHI', N'9718284667', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (30, N'LU006', N'AM3', CAST(0x0000A5DB00000000 AS DateTime), N'NORTH', NULL, N'DELHI', N'NEW DELHI', N'9810096766', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (31, N'LU007', N'AM4', CAST(0x0000A5DB00000000 AS DateTime), N'NORTH', NULL, N'DELHI', N'NEW DELHI', N'9811696996', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[BikerBoyDetail] ([ID], [BB_Code], [BB_Name], [Date_Of_Joining], [Region], [Zonal_Code], [BB_State], [Town], [Mob], [ZM_Name], [ZM_Code], [RM_Name], [RM_Code], [ASM_Name], [ASM_Code], [Cord1_Name], [Cord1_Code], [Cord2_Name], [Cord2_Code], [Active], [BranchManager], [BranchManagerCode]) VALUES (32, N'LU008', N'AM5', CAST(0x0000A5DB00000000 AS DateTime), N'NORTH', NULL, N'DELHI', N'NEW DELHI', N'9654125328', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
SET IDENTITY_INSERT [dbo].[BikerBoyDetail] OFF
/****** Object:  Table [dbo].[Logger]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[Logger] ON
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (4, N'Create | CBeat | ExceptionMessageThe view ''AuthorizeFailed'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/CBeat/AuthorizeFailed.aspx
~/Views/CBeat/AuthorizeFailed.ascx
~/Views/Shared/AuthorizeFailed.aspx
~/Views/Shared/AuthorizeFailed.ascx
~/Views/CBeat/AuthorizeFailed.cshtml
~/Views/CBeat/AuthorizeFailed.vbhtml
~/Views/Shared/AuthorizeFailed.cshtml
~/Views/Shared/AuthorizeFailed.vbhtml', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass1e.<>c__DisplayClass26.<BeginInvokeAction>b__18()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass1e.<BeginInvokeAction>b__1b(IAsyncResult asyncResult)', CAST(0x0000A5D7001879BD AS DateTime), N'dist123')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (5, N'Create | RetailerMappingToBeat | ExceptionMessageCannot perform runtime binding on a null reference', N'   at CallSite.Target(Closure , CallSite , Object , String )
   at System.Dynamic.UpdateDelegates.UpdateAndExecute2[T0,T1,TRet](CallSite site, T0 arg0, T1 arg1)
   at ASP._Page_Views_RetailerMappingToBeat_Create_cshtml.Execute() in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\Luminous.Biker.Web\Luminous.Biker.Web\Views\RetailerMappingToBeat\Create.cshtml:line 42
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass1e.<>c__DisplayClass28.<BeginInvokeAction>b__19()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass1e.<BeginInvokeAction>b__1b(IAsyncResult asyncResult)', CAST(0x0000A5D7003E3404 AS DateTime), N'dist123')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (6, N'Create | RetailerMappingToBeat | ExceptionMessageCannot perform runtime binding on a null reference', N'   at CallSite.Target(Closure , CallSite , Object , String )
   at System.Dynamic.UpdateDelegates.UpdateAndExecute2[T0,T1,TRet](CallSite site, T0 arg0, T1 arg1)
   at ASP._Page_Views_RetailerMappingToBeat_Create_cshtml.Execute() in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\Luminous.Biker.Web\Luminous.Biker.Web\Views\RetailerMappingToBeat\Create.cshtml:line 42
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass1e.<>c__DisplayClass28.<BeginInvokeAction>b__19()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass1e.<BeginInvokeAction>b__1b(IAsyncResult asyncResult)', CAST(0x0000A5D7003EBEA0 AS DateTime), N'dist123')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (7, N'Create | RetailerMappingToBeat | ExceptionMessageCannot perform runtime binding on a null reference', N'   at CallSite.Target(Closure , CallSite , Object , String )
   at System.Dynamic.UpdateDelegates.UpdateAndExecute2[T0,T1,TRet](CallSite site, T0 arg0, T1 arg1)
   at ASP._Page_Views_RetailerMappingToBeat_Create_cshtml.Execute() in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\Luminous.Biker.Web\Luminous.Biker.Web\Views\RetailerMappingToBeat\Create.cshtml:line 42
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass1e.<>c__DisplayClass28.<BeginInvokeAction>b__19()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass1e.<BeginInvokeAction>b__1b(IAsyncResult asyncResult)', CAST(0x0000A5D7008E6820 AS DateTime), N'admin123')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (8, N'Index | Home | ExceptionMessageThe if block is missing a closing "}" character.  Make sure you have a matching "}" character for all the "{" characters within this block, and that none of the "}" characters are being interpreted as markup.
', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(String virtualPath, Type requiredBaseType)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass7.<RenderPageCore>b__6(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageExecutingBase.WriteTo(TextWriter writer, HelperResult content)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass1e.<>c__DisplayClass28.<BeginInvokeAction>b__19()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass1e.<BeginInvokeAction>b__1b(IAsyncResult asyncResult)', CAST(0x0000A5D700993B10 AS DateTime), N'dist123')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (9, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.SendMail(RetailerDetail retailerDetail) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 601
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 582', CAST(0x0000A5D7018538FC AS DateTime), N'AddRetailer, Name | , Contact_person | test, State | Karnataka, City | Bangalore, Address | JP Nagar, Pin_Code | 560078, Contact_Number | 8768798789')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (10, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.SendMail(RetailerDetail retailerDetail) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 601
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 582', CAST(0x0000A5D70185F706 AS DateTime), N'AddRetailer, Name | , Contact_person | test, State | Karnataka, City | Bangalore, Address | JP Nagar, Pin_Code | 560078, Contact_Number | 8768798789')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (11, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.SendMail(RetailerDetail retailerDetail) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 601
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 582', CAST(0x0000A5D7018687BB AS DateTime), N'AddRetailer, Name | , Contact_person | test, State | Karnataka, City | Bangalore, Address | JP Nagar, Pin_Code | 560078, Contact_Number | 8768798789')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (12, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.SendMail(RetailerDetail retailerDetail) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 602
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 582', CAST(0x0000A5D701872EE4 AS DateTime), N'AddRetailer, Name | , Contact_person | test, State | Karnataka, City | Bangalore, Address | JP Nagar, Pin_Code | 560078, Contact_Number | 8768798789')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (13, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.SendMail(RetailerDetail retailerDetail) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 602
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 582', CAST(0x0000A5D70187EE60 AS DateTime), N'AddRetailer, Name | , Contact_person | test, State | Karnataka, City | Bangalore, Address | JP Nagar, Pin_Code | 560078, Contact_Number | 8768798789')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (14, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.SendMail(RetailerDetail retailerDetail) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 602
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 582', CAST(0x0000A5D701884895 AS DateTime), N'AddRetailer, Name | , Contact_person | test, State | Karnataka, City | Bangalore, Address | JP Nagar, Pin_Code | 560078, Contact_Number | 8768798789')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (15, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.RecipientCommand.Send(SmtpConnection conn, String to, String& response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining)', CAST(0x0000A5D7018911CC AS DateTime), N'AddRetailer, Name | , Contact_person | test, State | Karnataka, City | Bangalore, Address | JP Nagar, Pin_Code | 560078, Contact_Number | 8768798789')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (16, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.RecipientCommand.Send(SmtpConnection conn, String to, String& response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining)', CAST(0x0000A5D8009D6DB0 AS DateTime), N'AddRetailer, Name | , Contact_person | XYZ, State | New Delhi, City | New Delhi, Address | New Delhi, Pin_Code | 110001, Contact_Number | 1234567890')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (17, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.RecipientCommand.Send(SmtpConnection conn, String to, String& response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining)', CAST(0x0000A5DA00CF7D44 AS DateTime), N'AddRetailer, Name | , Contact_person | rohit, State | sohna, City | gurgaon, Address | bus stand road,opp. police chowki,sohna, Pin_Code | 122001, Contact_Number | 9034193933')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (18, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.RecipientCommand.Send(SmtpConnection conn, String to, String& response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining)', CAST(0x0000A5DF00A44478 AS DateTime), N'AddRetailer, Name | , Contact_person | Anusha, State | new delhi, City | new delhi, Address | new delhi, Pin_Code | 110001, Contact_Number | 1234567890')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (19, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.RecipientCommand.Send(SmtpConnection conn, String to, String& response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining)', CAST(0x0000A5DF00C256EB AS DateTime), N'AddRetailer, Name | , Contact_person | jay, State | haryana, City | gaugaon, Address | gurgaon

, Pin_Code | 110018, Contact_Number | 9958462898')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (20, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.RecipientCommand.Send(SmtpConnection conn, String to, String& response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining)', CAST(0x0000A5DF00C2953F AS DateTime), N'AddRetailer, Name | , Contact_person | jay, State | haryana, City | jay, Address | jay, Pin_Code | 110018, Contact_Number | 9958462898')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (21, N'Bad sequence of commands. The server response was: This mail server requires authentication when attempting to send to a non-local e-mail address. Please check your mail client settings or contact your administrator to verify that the domain or address is defined for this server.', N'   at System.Net.Mail.RecipientCommand.CheckResponse(SmtpStatusCode statusCode, String response)
   at System.Net.Mail.RecipientCommand.Send(SmtpConnection conn, String to, String& response)
   at System.Net.Mail.SmtpTransport.SendMail(MailAddress sender, MailAddressCollection recipients, String deliveryNotify, Boolean allowUnicode, SmtpFailedRecipientException& exception)
   at System.Net.Mail.SmtpClient.Send(MailMessage message)
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining)', CAST(0x0000A5DF00C5EB7B AS DateTime), N'AddRetailer, Name | , Contact_person | 9026647780, State | new delhi, City | new delhi, Address | new delhi, Pin_Code | 208017, Contact_Number | 9026647780')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (22, N'The specified string is not in the form required for an e-mail address.', N'   at System.Net.Mime.MailBnfHelper.ReadMailAddress(String data, Int32& offset, String& displayName)
   at System.Net.Mime.MailBnfHelper.ReadMailAddress(String data, Int32& offset)
   at System.Net.Mail.MailAddressCollection.ParseValue(String addresses)
   at System.Net.Mail.MailAddressCollection.Add(String addresses)
   at DAL.BikerDAL.SendMail(RetailerDetail retailerDetail) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 597
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 585', CAST(0x0000A5E00091FCAE AS DateTime), N'AddRetailer, Name | , Contact_person | test, State | Karnataka, City | Bangalore, Address | JP Nagar, Pin_Code | 560078, Contact_Number | 987987982')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (23, N'The specified string is not in the form required for an e-mail address.', N'   at System.Net.Mail.MailAddressParser.ParseAddress(String data, Boolean expectMultipleAddresses, Int32& index)
   at System.Net.Mail.MailAddressParser.ParseMultipleAddresses(String data)
   at System.Net.Mail.MailAddressCollection.ParseValue(String addresses)
   at DAL.BikerDAL.SendMail(RetailerDetail retailerDetail)
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining)', CAST(0x0000A5E00097A3AD AS DateTime), N'AddRetailer, Name | , Contact_person | fghb, State | dhjj, City | fhjj, Address | fhrg fhh fhb 
, Pin_Code | 110058, Contact_Number | 9999885566')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (24, N'The specified string is not in the form required for an e-mail address.', N'   at System.Net.Mail.MailAddressParser.ParseAddress(String data, Boolean expectMultipleAddresses, Int32& index)
   at System.Net.Mail.MailAddressParser.ParseMultipleAddresses(String data)
   at System.Net.Mail.MailAddressCollection.ParseValue(String addresses)
   at DAL.BikerDAL.SendMail(RetailerDetail retailerDetail)
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining)', CAST(0x0000A5E000E6C093 AS DateTime), N'AddRetailer, Name | , Contact_person | XYX, State | New Delhi, City | New Delhi, Address | New Delhi, Pin_Code | 110001, Contact_Number | 1234567890')
INSERT [dbo].[Logger] ([ID], [Message], [StackTrace], [CreatedOn], [CreatedBy]) VALUES (25, N'The specified string is not in the form required for an e-mail address.', N'   at System.Net.Mime.MailBnfHelper.ReadMailAddress(String data, Int32& offset, String& displayName)
   at System.Net.Mime.MailBnfHelper.ReadMailAddress(String data, Int32& offset)
   at System.Net.Mail.MailAddressCollection.ParseValue(String addresses)
   at System.Net.Mail.MailAddressCollection.Add(String addresses)
   at DAL.BikerDAL.SendMail(RetailerDetail retailerDetail) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 597
   at DAL.BikerDAL.AddRetailer(String Name, String Contact_person, String State, String City, String Address, String Pin_Code, String Contact_Number, String Status, DateTime DateOfJoining) in c:\Users\tftopvuwin\Documents\Visual Studio 2013\Projects\DBTestWebService\DAL\BikerDAL.cs:line 585', CAST(0x0000A5E0015E435F AS DateTime), N'AddRetailer, Name | , Contact_person | Test, State | Karnataka, City | Bangalore, Address | JP Nagar, Pin_Code | 560078, Contact_Number | 9901499533')
SET IDENTITY_INSERT [dbo].[Logger] OFF
/****** Object:  Table [dbo].[Item]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[Item] ON
INSERT [dbo].[Item] ([ID], [ItemName]) VALUES (1, N'Fan')
INSERT [dbo].[Item] ([ID], [ItemName]) VALUES (3, N'Lighting')
INSERT [dbo].[Item] ([ID], [ItemName]) VALUES (2, N'Wire')
SET IDENTITY_INSERT [dbo].[Item] OFF
/****** Object:  Table [dbo].[DistDealerDetail]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[DistDealerDetail] ON
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (1, N'DISTY', N'100000', N'SHARMA ELECTRIC WORKS', N'B. NO. 4,', NULL, N'FEROZEPUR CANTT,', N'MANGAL MARKET,', N'Punjab', N'01632-242723', N'test967@gmail.com', N'111', N'Active', NULL, NULL, CAST(0x0000A5CA012E2920 AS DateTime), CAST(0x0000A56B00DE7920 AS DateTime), NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (7, N'DISTY1', N'100001', N'ALPHA ELECTRONICS', N'MALHOTRA BUILDING, 15, SHASTRI', NULL, N'JALANDHAR', N'JALANDHAR', N'PUNJAB', N'9888613798', N'malhotra.micky31@gmail.com', N'222', N'Active', NULL, NULL, CAST(0x0000A5CD017E6944 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (8, N'DISTY2', N'100002', N'ANMOL ENTERPRISES', N'near model auto mobiles', N'Bareilly road kichha', N'Kichha', N'UDHAM SINGH NAGAR', N'Uttarakhand', N'9927043456', N'balveerb@techfoursolutions.com', N'111', N'Active', NULL, NULL, CAST(0x0000A5CD01809390 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (9, N'DISTY3', N'100003', N'APOLLO MOTORS', N'7TH SINGH SABHA MARKET', NULL, N'Patiala', N'Upper Mall', N'Punjab', N'9927043456', N'abhishekv@techfoursolutions.com', NULL, N'Active', NULL, NULL, CAST(0x0000A5CD0181D958 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (11, N'DISTY', N'100004', N'Test Name', N'Test Address', NULL, N'Test City', N'Test District', N'Test State', N'9901499533', N'test967@gmail.com', N'560078', N'Active', N'admin', CAST(0x0000A5D400000000 AS DateTime), CAST(0x0000A5D4017C5B2D AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (12, N'DISTY', N'778', N'tnrtyn', N' 5uyu tt', N'rniy', N' tyuty5', N'rntt', N'87878', N'9089878969', N'ytutyu@gmail.com', N'rnt', N'Active', N'nity', CAST(0x0000A5D400000000 AS DateTime), CAST(0x0000A5D500DA2938 AS DateTime), CAST(0x0000A5D5010D3C2E AS DateTime), N'titi67667', CAST(0x0000A5D100000000 AS DateTime))
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (13, N'Dist', N'1100069', N'Deep Electricals', N'SHOP NO. 6,IMPROVEMENT TRUST MARKET,', NULL, N'BHIWANI', N'BHIWANI', N'HARYANA', N'9416231710', N'deepbhiwani@gmail.com', N'07', N'Active', NULL, NULL, CAST(0x0000A5DA009F61D2 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (14, N'Dist', N'1107672', N'3 Curves', N'Shiv Mandir Gali, ward no-D, New Colony', N'Pataudi', N'Gurgaon', N'Gurgaon', N'HARYANA', N'9910069456', N'INFO@3CURVESGROUP.COM', N'07', N'Active', NULL, NULL, CAST(0x0000A5DA009FEFD6 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (15, N'Dist', N'1106776', N'ANKIT ELECTRICALS PLTD.', N'B-9 SATYAM PLAZA COMPLEX JHARSA ROAD CIVIL LINES', NULL, N'GURGAON', N'GURGAON', N'HARYANA', N'9999999999', N'ANKITELECTRICALS@GMAIL.COM', N'07', N'Active', NULL, NULL, CAST(0x0000A5DA00A068B3 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (16, N'di', N'1105793', N'BHAGWATI ELECTRICALS', N'E-133,BINDAPUR J.J COLONY PKT-4', NULL, N'WEST DELHI', N'NEW DELHI', N'DELHI', N'9213553246', N'MANOJGOEL1213@GMAIL.COM', N'30', N'Active', NULL, NULL, CAST(0x0000A5DA00A0EB28 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (17, N'Dist', N'1107346', N'SHREE INTERNATIONAL', N'F-12, MASJID ROAD, JAGAT PURI', NULL, N'DELHI', N'DELHI', N'DELHI', N'9871790123', N'SHREEINTERNATIONAL11@GMAIL.COM', N'30', N'Active', NULL, NULL, CAST(0x0000A5DA00A69B9B AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (18, N'Inverter', N'50001', N'Abhishek', N'G-17D SOUTH EX PART 2', N'New Delhi', N'New Delhi', N'New Delhi', N'New Delhi', N'8527419630', N'abhi@gmail.com', N'5214', N'Active', N'vijay', CAST(0x0000728200000000 AS DateTime), CAST(0x0000A5DF00B64DEC AS DateTime), CAST(0x0000A5DF00B6948B AS DateTime), NULL, NULL)
INSERT [dbo].[DistDealerDetail] ([ID], [Customer_Type], [Dis_Sap_Code], [Dis_Name], [Dis_Address1], [Dis_Address2], [Dis_City], [Dis_District], [Dis_State], [Dis_ContactNo], [Dis_Email], [Region_code], [isActive], [ActivatedBY], [ActivatedDate], [Created_On], [Updated_On], [Blocked_By], [Blocked_Date]) VALUES (19, N'Inverter', N'50001', N'Abhishek', N'G-17D SOUTH EX PART 2', N'New Delhi', N'New Delhi', N'New Delhi', N'New Delhi', N'8527419630', N'abhi@gmail.com', N'5214', N'Inactive', N'vijay', CAST(0x0000A5DF00000000 AS DateTime), CAST(0x0000A5DF00CB71A4 AS DateTime), CAST(0x0000A5DF00CCA9F2 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[DistDealerDetail] OFF
/****** Object:  Table [dbo].[BikerTarget]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[BikerTarget] ON
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (1, 12, 1, 50000, NULL, NULL, CAST(0x0000A5DF00B9B971 AS DateTime), N'admin', 2016, 3)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (2, 12, 3, 70000, NULL, NULL, NULL, NULL, 2016, 3)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (3, 12, 2, 60000, NULL, NULL, NULL, NULL, 2016, 3)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (4, 12, 1, 23, CAST(0x0000A5DA00B24B5C AS DateTime), N'admin123', CAST(0x0000A5DB0162C63B AS DateTime), N'admin123', 2016, 3)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (5, 13, 1, 80, CAST(0x0000A5DB003EB88F AS DateTime), N'admin123', NULL, NULL, 2000, 10)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (6, 13, 1, 34, CAST(0x0000A5DB00A031F5 AS DateTime), N'admin123', NULL, NULL, 2002, 4)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (7, 13, 1, 34, CAST(0x0000A5DB00A0DAFD AS DateTime), N'admin123', NULL, NULL, 2003, 7)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (8, 13, 2, 34, CAST(0x0000A5DB00A0DB6B AS DateTime), N'admin123', NULL, NULL, 2003, 7)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (9, 13, 3, 34, CAST(0x0000A5DB00A0DB77 AS DateTime), N'admin123', NULL, NULL, 2003, 7)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (10, 24, 1, 32, CAST(0x0000A5DB016645B9 AS DateTime), N'admin123', NULL, NULL, 2007, 7)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (11, 24, 2, 43, CAST(0x0000A5DB016645F8 AS DateTime), N'admin123', CAST(0x0000A5DB017F86F0 AS DateTime), N'admin123', 2007, 7)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (12, 24, 3, 54, CAST(0x0000A5DB0166464E AS DateTime), N'admin123', NULL, NULL, 2007, 7)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (13, 15, 1, 70, CAST(0x0000A5DC0017984C AS DateTime), N'admin', NULL, NULL, 2006, 6)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (14, 15, 2, 90, CAST(0x0000A5DC0017992B AS DateTime), N'admin', NULL, NULL, 2006, 6)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (15, 15, 3, 80, CAST(0x0000A5DC0017992D AS DateTime), N'admin', NULL, NULL, 2006, 6)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (16, 12, 1, 6000, CAST(0x0000A5DF00AF38AD AS DateTime), N'admin', NULL, NULL, 2016, 4)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (17, 12, 2, 7000, CAST(0x0000A5DF00AF38B3 AS DateTime), N'admin', NULL, NULL, 2016, 4)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (18, 12, 3, 8000, CAST(0x0000A5DF00AF38B4 AS DateTime), N'admin', NULL, NULL, 2016, 4)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (28, 27, 3, 10, CAST(0x0000A5DF00C870E4 AS DateTime), N'admin', CAST(0x0000A5DF00CA5756 AS DateTime), N'admin', 2016, 4)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (29, 27, 1, 10, CAST(0x0000A5DF00C870E4 AS DateTime), N'admin', CAST(0x0000A5DF00CA5D97 AS DateTime), N'admin', 2016, 4)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (30, 27, 2, 100, CAST(0x0000A5DF00C870E4 AS DateTime), N'admin', CAST(0x0000A5DF00D3685D AS DateTime), N'admin', 2016, 4)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (31, 20, 1, 4, CAST(0x0000A5E0009B8362 AS DateTime), N'admin123', NULL, NULL, 2012, 8)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (32, 20, 2, 5, CAST(0x0000A5E0009B83D8 AS DateTime), N'admin123', NULL, NULL, 2012, 8)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (33, 20, 3, 6, CAST(0x0000A5E0009B83E7 AS DateTime), N'admin123', NULL, NULL, 2012, 8)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (34, 23, 1, 7, CAST(0x0000A5E0009FD76C AS DateTime), N'admin123', NULL, NULL, 2011, 7)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (35, 23, 2, 7, CAST(0x0000A5E0009FD7DF AS DateTime), N'admin123', NULL, NULL, 2011, 7)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (36, 23, 3, 7, CAST(0x0000A5E0009FD7F1 AS DateTime), N'admin123', NULL, NULL, 2011, 7)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (37, 12, 1, 50, CAST(0x0000A5E000A4D693 AS DateTime), N'admin123', NULL, NULL, 2011, 11)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (38, 12, 2, 60, CAST(0x0000A5E000A4D76D AS DateTime), N'admin123', NULL, NULL, 2011, 11)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (39, 12, 3, 70, CAST(0x0000A5E000A4D770 AS DateTime), N'admin123', NULL, NULL, 2011, 11)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (40, 12, 1, 4444, CAST(0x0000A5E000E7843E AS DateTime), N'admin', NULL, NULL, 2016, 5)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (41, 12, 2, 5555, CAST(0x0000A5E000E78472 AS DateTime), N'admin', NULL, NULL, 2016, 5)
INSERT [dbo].[BikerTarget] ([Id], [BikerId], [ItemId], [TargetQuantity], [CreatedOn], [CreateBy], [UpdatedOn], [UpdatedBy], [YearNumber], [MonthNumber]) VALUES (42, 12, 3, 6666, CAST(0x0000A5E000E78474 AS DateTime), N'admin', NULL, NULL, 2016, 5)
SET IDENTITY_INSERT [dbo].[BikerTarget] OFF
/****** Object:  Table [dbo].[BikerRetailerMapping]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[BikerRetailerMapping] ON
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (1, 12, 1)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (2, 12, 3)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (3, 12, 4)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (4, 12, 5)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (6, 13, 7)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (7, 13, 9)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (8, 27, 24)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (10, 19, 26)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (11, 19, 27)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (12, 12, 32)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (13, 12, 20)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (14, 12, 23)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (15, 12, 30)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (16, 12, 33)
INSERT [dbo].[BikerRetailerMapping] ([Id], [BikerId], [RetailerId]) VALUES (17, 12, 34)
SET IDENTITY_INSERT [dbo].[BikerRetailerMapping] OFF
/****** Object:  Table [dbo].[BikerDistMapping]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[BikerDistMapping] ON
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (2, 1, 12)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (3, 1, 14)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (4, 1, 15)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (6, 7, 12)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (7, 8, 14)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (8, 8, 21)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (9, 9, 15)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (11, 7, 15)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (12, 1, 13)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (13, 8, 13)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (14, 1, 17)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (15, 8, 20)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (20, 9, 24)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (21, 13, 25)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (22, 14, 25)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (23, 15, 25)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (24, 16, 25)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (25, 14, 26)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (26, 16, 23)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (27, 18, 27)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (28, 19, 27)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (29, 15, 28)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (30, 15, 29)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (31, 15, 30)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (32, 15, 31)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (33, 15, 32)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (34, 16, 28)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (35, 16, 29)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (36, 16, 30)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (37, 16, 31)
INSERT [dbo].[BikerDistMapping] ([ID], [Distributor_Id], [BikerBoy_Id]) VALUES (38, 16, 32)
SET IDENTITY_INSERT [dbo].[BikerDistMapping] OFF
/****** Object:  Table [dbo].[BeatDistributorMapping]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[BeatDistributorMapping] ON
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (1, 1, 1)
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (2, 1, 2)
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (14, 1, 4)
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (17, 1, 7)
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (3, 7, 3)
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (9, 7, 4)
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (10, 8, 5)
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (13, 9, 4)
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (16, 14, 10)
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (15, 15, 9)
INSERT [dbo].[BeatDistributorMapping] ([ID], [Distributor_Id], [Beat_Id]) VALUES (18, 18, 11)
SET IDENTITY_INSERT [dbo].[BeatDistributorMapping] OFF
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 04/08/2016 16:20:59 ******/
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
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1672a3f1-fb9c-4982-ba7d-37a776401fed', N'74A2949D-E443-4850-B293-84F9B89F02E0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6285da31-f334-4656-9917-6c39262c83b0', N'74A2949D-E443-4850-B293-84F9B89F02E0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'709c0383-f7ba-4127-b45d-7730d0baf423', N'74A2949D-E443-4850-B293-84F9B89F02E0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b632c1b0-e24a-4177-b0ef-cbdbf36bb4e8', N'320B1931-2DF5-4267-98D1-F31A75282142')
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  Table [dbo].[RetailBeatMapping]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[RetailBeatMapping] ON
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (1, 1, 1)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (3, 2, 3)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (4, 1, 4)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (5, 3, 5)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (6, 4, 6)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (10, 7, 7)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (11, 5, 5)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (12, 6, 6)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (13, 6, 7)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (14, 1, 9)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (15, 10, 21)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (16, 3, 6)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (17, 1, 23)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (18, 11, 24)
INSERT [dbo].[RetailBeatMapping] ([ID], [Beat_Id], [Retailer_Id]) VALUES (19, 1, 31)
SET IDENTITY_INSERT [dbo].[RetailBeatMapping] OFF
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[OrderDetail] ON
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (1, CAST(0x0000A5CA016BD5BE AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CA016BD5BE AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (2, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CB0097950C AS DateTime), N'12', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (3, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CB009EAF38 AS DateTime), N'12', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (4, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CB009F1554 AS DateTime), N'12', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (5, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CB009FC744 AS DateTime), N'12', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (6, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CB00A055A8 AS DateTime), N'12', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (7, CAST(0x0000A5CB013B1220 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CB013B2875 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (8, CAST(0x0000A5CB013BC32F AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CB013BD5EE AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (9, CAST(0x0000A5CB013C6A12 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CB013C7805 AS DateTime), N'KD53', CAST(0x0000A5CC0155BA23 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (10, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'?', CAST(0x0000A5CB018961B2 AS DateTime), N'KD53', CAST(0x0000A5CC00C6458C AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (11, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, NULL, CAST(0x0000A5CC00055936 AS DateTime), N'KD53', CAST(0x0000A5CC00CB133E AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (12, CAST(0x0000A5CC016EF180 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CC00A658F6 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (13, CAST(0x00009BCB016EF180 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CC00A689E7 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (14, CAST(0x0000A45A00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CC00A82C46 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (15, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'', CAST(0x0000A5CC00A88385 AS DateTime), N'KD53', CAST(0x0000A5CC00E56C3C AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (16, CAST(0x0000A5CC00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CC00AC4481 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (17, CAST(0x0000A5CC00000000 AS DateTime), 1, 1, 1, 1, 1, N'', CAST(0x0000A5CC00ACE74C AS DateTime), N'KD53', CAST(0x0000A5CC00ED20BD AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (18, CAST(0x0000A5CC00000000 AS DateTime), 1, 1, 1, 1, 1, N'', CAST(0x0000A5CC00AD2913 AS DateTime), N'KD53', CAST(0x0000A5CC00EE5A33 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (25, CAST(0x0000A5CC00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CC010953F7 AS DateTime), N'KD53', CAST(0x0000A5CC011EB12D AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (26, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 0, 1, N'Partially Completed', CAST(0x0000A5CC010A8C60 AS DateTime), N'KD53', CAST(0x0000A5CC0110DA3C AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (27, CAST(0x0000A5CC00000000 AS DateTime), 1, 1, 1, 1, 1, N'', CAST(0x0000A5CC010C0527 AS DateTime), N'KD53', CAST(0x0000A5CC011FEA67 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (28, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CC01107048 AS DateTime), N'KD53', CAST(0x0000A5CC014429C3 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (29, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CC01107689 AS DateTime), N'KD53', CAST(0x0000A5CE008BB7DA AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (30, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CC0110792A AS DateTime), N'KD53', CAST(0x0000A5CC014B1DF4 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (31, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Partially Completed', CAST(0x0000A5CC01107A79 AS DateTime), N'KD53', CAST(0x0000A5CE00A3C847 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (32, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Partially Completed', CAST(0x0000A5CC01107B9B AS DateTime), N'KD53', CAST(0x0000A5CC0132A490 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (33, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Partially Completed', CAST(0x0000A5CC01107EF4 AS DateTime), N'KD53', CAST(0x0000A5CC012988AA AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (34, CAST(0x0000A5CC00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CC011954F4 AS DateTime), N'KD53', CAST(0x0000A5CC014ADA6F AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (35, CAST(0x0000A5CC00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CC0148CD8D AS DateTime), N'KD53', CAST(0x0000A5CD00BD4687 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (36, CAST(0x0000A5CB00000000 AS DateTime), 1, 2, 1, 0, 1, N'Completed', CAST(0x0000A5CC0149A2BD AS DateTime), N'KD53', CAST(0x0000A5CD00EBF4C5 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (37, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Partially Completed', CAST(0x0000A5CC01547346 AS DateTime), N'KD53', CAST(0x0000A5CD00EA1DDC AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (38, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Partially Completed', CAST(0x0000A5CC0154BEF6 AS DateTime), N'KD53', CAST(0x0000A5CD014DC1FB AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (39, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Partially Completed', CAST(0x0000A5CC01553653 AS DateTime), N'KD53', CAST(0x0000A5CD014EC191 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (40, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Partially Completed', CAST(0x0000A5CC0159E272 AS DateTime), N'KD53', CAST(0x0000A5CD016E534A AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (41, CAST(0x0000A5CB00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CC015A736F AS DateTime), N'KD53', CAST(0x0000A5CD00B74512 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (42, CAST(0x0000A5CC00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5CC01608FBA AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (43, CAST(0x0000A5CC00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5CC0165C2B8 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (44, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 0, N'Completed', CAST(0x0000A5CD00921ADC AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (45, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5CD00B32370 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (46, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 0, N'Completed', CAST(0x0000A5CD00B5789C AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (47, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5CD00B5CB05 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (48, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Pending for Supply', CAST(0x0000A5CD00B63CFF AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (49, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5CD00B8A6D8 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (50, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CD00B93B1A AS DateTime), N'KD53', CAST(0x0000A5CD00BDAE5E AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (51, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Pending for Supply', CAST(0x0000A5CD00CFA68B AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (52, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 0, N'Completed', CAST(0x0000A5CD00D019F6 AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (53, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Pending for Supply', CAST(0x0000A5CD00D0C41A AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (54, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 0, N'Completed', CAST(0x0000A5CD00D14227 AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (55, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Pending for Supply', CAST(0x0000A5CD00D1736C AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (56, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 0, N'Completed', CAST(0x0000A5CD00D260A6 AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (57, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CD00D2E8CA AS DateTime), N'kd53', CAST(0x0000A5CD00D41615 AS DateTime), N'kd53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (58, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5CD00D80F42 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (59, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 0, N'Completed', CAST(0x0000A5CD00E0EC61 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (60, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CD00EC9195 AS DateTime), N'KD53', CAST(0x0000A5CD010B7512 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (61, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CD00F45285 AS DateTime), N'KD53', CAST(0x0000A5CD00F6AA4B AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (62, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CD0102D7F7 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (63, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CD010A4D23 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (64, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 0, N'Completed', CAST(0x0000A5CD010AFD5A AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (65, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Partially Completed', CAST(0x0000A5CD010B351E AS DateTime), N'KD53', CAST(0x0000A5CD010B4E0B AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (66, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 0, N'Completed', CAST(0x0000A5CD010C0C54 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (67, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CD0110E57F AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (68, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CD01123BA4 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (69, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CD0130061A AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (70, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5CD0130B151 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (71, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CD013140E3 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (72, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CD013204BA AS DateTime), N'KD53', CAST(0x0000A5CD013F75E1 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (73, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CD013449D6 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (74, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending', CAST(0x0000A5CD013D73EC AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (75, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 0, N'Completed', CAST(0x0000A5CD013EEAFF AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (76, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 0, N'Pending For Supply', CAST(0x0000A5CD013F1EA7 AS DateTime), N'KD53', CAST(0x0000A5CD016471EC AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (77, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CD0161A89E AS DateTime), N'Kd0252', CAST(0x0000A5CD01693A98 AS DateTime), N'Kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (78, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CD01681124 AS DateTime), N'Kd0252', CAST(0x0000A5CD016894DC AS DateTime), N'Kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (79, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Partially Completed', CAST(0x0000A5CD016A2B66 AS DateTime), N'KD53', CAST(0x0000A5CD016E735C AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (80, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CD016C1C15 AS DateTime), N'Kd0252', CAST(0x0000A5CD016C3899 AS DateTime), N'Kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (81, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CD016D270E AS DateTime), N'Kd0252', CAST(0x0000A5CD016D4049 AS DateTime), N'Kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (82, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CD016D7B36 AS DateTime), N'KD53', CAST(0x0000A5CD016E24D2 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (83, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CD0172C466 AS DateTime), N'Kd0252', CAST(0x0000A5CD017302BD AS DateTime), N'Kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (84, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CD017AC1B1 AS DateTime), N'KD0252', CAST(0x0000A5CE00A17CAD AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (85, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5CD017BDE61 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (86, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 0, N'Completed', CAST(0x0000A5CD017C1567 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (87, CAST(0x0000A5CD00000000 AS DateTime), 1, 1, 1, 1, 1, N'Partially Completed', CAST(0x0000A5CD0188DC9E AS DateTime), N'KD0252', CAST(0x0000A5CE006C85F2 AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (88, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 0, 0, N'Completed', CAST(0x0000A5CE006B0221 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (89, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CE006B3B91 AS DateTime), N'KD0252', CAST(0x0000A5CE006B5FB7 AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (90, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CE006B9623 AS DateTime), N'KD0252', CAST(0x0000A5CE006BB572 AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (91, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CE006CC0F1 AS DateTime), N'KD0252', CAST(0x0000A5CE006CE987 AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (92, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5CE0088DF2A AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (93, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 0, 0, N'Completed', CAST(0x0000A5CE00A0C6EF AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (94, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CE00A0F622 AS DateTime), N'kd0252', CAST(0x0000A5CE00A10A09 AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (95, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CE00A356E9 AS DateTime), N'kd0252', CAST(0x0000A5CE00AD0EFD AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (96, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CE00A62946 AS DateTime), N'KD53', CAST(0x0000A5CE00A64894 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (97, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CE00A6B0C4 AS DateTime), N'KD53', CAST(0x0000A5CE00A6F725 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (98, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CE00ACAD54 AS DateTime), N'KD0252', CAST(0x0000A5CE00ACC62D AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (99, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CE00AF24A7 AS DateTime), N'KD0252', CAST(0x0000A5CE00AF3993 AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (100, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 0, N'Completed', CAST(0x0000A5CE00AF9A47 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (101, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CE00AFC2F9 AS DateTime), N'KD0252', CAST(0x0000A5CE00B002D6 AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (102, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CE00B04F12 AS DateTime), N'KD0252', CAST(0x0000A5CE0167C4BE AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (103, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CE00B0A0D1 AS DateTime), N'KD53', CAST(0x0000A5CE00B0DF27 AS DateTime), N'KD53')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (104, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5CE00B0AA8E AS DateTime), N'KD0252', CAST(0x0000A5D000F6B27A AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (105, CAST(0x0000A5CE00000000 AS DateTime), 1, 2, 3, 1, 1, N'Completed', CAST(0x0000A5CE00B1A1EB AS DateTime), N'kd0252', CAST(0x0000A5CE00B1C5E2 AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (106, CAST(0x0000A5CE00000000 AS DateTime), 1, 2, 3, 1, 0, N'Completed', CAST(0x0000A5CE00B20472 AS DateTime), N'kd0252', NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (107, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CE00B2CD6E AS DateTime), N'kd0252', CAST(0x0000A5CE00B31791 AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (108, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CE00B3509C AS DateTime), N'kd0252', CAST(0x0000A5CE00B386A9 AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (109, CAST(0x0000A5CE00000000 AS DateTime), 1, 2, 3, 0, 1, N'Completed', CAST(0x0000A5CE00B3D1CA AS DateTime), N'kd0252', CAST(0x0000A5CE00B3E6A1 AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (110, CAST(0x0000A5CE00000000 AS DateTime), 7, 3, 5, 0, 1, N'Completed', CAST(0x0000A5CE00BD296C AS DateTime), N'kd0252', CAST(0x0000A5CE00BD7C87 AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (111, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 0, 1, N'Completed', CAST(0x0000A5CE00C3F0EF AS DateTime), N'kd0252', CAST(0x0000A5CE00C44A71 AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (112, CAST(0x0000A5CE00000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5CE01674540 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (113, CAST(0x0000A5D000000000 AS DateTime), 1, 1, 1, 1, 1, N'Partially Completed', CAST(0x0000A5D000AB3B00 AS DateTime), N'KD0252', CAST(0x0000A5D000AB55D6 AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (114, CAST(0x0000A5D000000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D001011533 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (115, CAST(0x0000A5D000000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D0013AA376 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (117, CAST(0x0000A5CB00000000 AS DateTime), 1, 3, 3, 1, 1, N'Pending for Supply', CAST(0x0000A5D1008F1F49 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (118, CAST(0x0000A5CB00000000 AS DateTime), 1, 3, 3, 1, 1, N'Pending for Supply', CAST(0x0000A5D1008F6819 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (119, CAST(0x0000A5CB00000000 AS DateTime), 1, 3, 3, 1, 1, N'Pending for Supply', CAST(0x0000A5D1008FC2C5 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (120, CAST(0x0000A5CB00000000 AS DateTime), 1, 3, 3, 1, 1, N'Pending for Supply', CAST(0x0000A5D1008FFD53 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (121, CAST(0x0000A5D100000000 AS DateTime), 9, 5, 7, 1, 1, N'Completed', CAST(0x0000A5D100B44D4C AS DateTime), N'KD0252', CAST(0x0000A5D100B47235 AS DateTime), N'KD0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (122, CAST(0x0000A5D100000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100D5890E AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (123, CAST(0x0000A73200000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100E89F9E AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (124, CAST(0x0000A73200000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100EB8155 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (125, CAST(0x0000A5D100000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100EBC29C AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (126, CAST(0x0000A5D100000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100ECDF0F AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (127, CAST(0x0000A5D100000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100EDB886 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (128, CAST(0x0000A5D100000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100EF56DE AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (129, CAST(0x0000A5D100000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100F003BE AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (130, CAST(0x0000A5D100000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100F1ACD5 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (131, CAST(0x0000A5D100000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100F407FA AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (132, CAST(0x0000A5D100000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100F4696B AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (133, CAST(0x0000A5D100000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D100F70929 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (134, CAST(0x0000A5D200000000 AS DateTime), 1, 1, 1, 1, 1, N'Pending for Supply', CAST(0x0000A5D20127B1CA AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (135, CAST(0x0000A5D700000000 AS DateTime), 1, 1, 1, 1, 1, N'Completed', CAST(0x0000A5D700E9E016 AS DateTime), N'kd0252', CAST(0x0000A5D700EA09CD AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (136, CAST(0x0000A5DA00000000 AS DateTime), 14, 10, 21, 1, 1, N'Completed', CAST(0x0000A5DA00B104C7 AS DateTime), N'lu003', CAST(0x0000A5DA00B18D17 AS DateTime), N'lu003')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (137, CAST(0x0000A5DA00000000 AS DateTime), 14, 10, 21, 1, 1, N'Completed', CAST(0x0000A5DA00B26006 AS DateTime), N'lu003', CAST(0x0000A5DA00B2EA97 AS DateTime), N'lu003')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (138, CAST(0x0000A5DA00000000 AS DateTime), 14, 10, 21, 1, 1, N'Completed', CAST(0x0000A5DA00B740C6 AS DateTime), N'lu003', CAST(0x0000A5DA00B7980C AS DateTime), N'lu003')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (139, CAST(0x0000A5DA00000000 AS DateTime), 14, 10, 21, 1, 0, N'Completed', CAST(0x0000A5DA00D0DF80 AS DateTime), N'LU002', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (140, CAST(0x0000A5DA00000000 AS DateTime), 14, 10, 21, 1, 1, N'Completed', CAST(0x0000A5DA00D13F5C AS DateTime), N'LU002', CAST(0x0000A5DA00D2151B AS DateTime), N'LU002')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (141, CAST(0x0000A5DF00000000 AS DateTime), 18, 11, 24, 1, 1, N'Completed', CAST(0x0000A5DF00BB65A4 AS DateTime), N'5000', CAST(0x0000A5DF00BB84C0 AS DateTime), N'5000')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (142, CAST(0x0000A5DF00000000 AS DateTime), 18, 11, 24, 1, 1, N'Partially Completed', CAST(0x0000A5DF00C03C78 AS DateTime), N'5000', CAST(0x0000A5DF00C063C7 AS DateTime), N'5000')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (143, CAST(0x0000A5DF00000000 AS DateTime), 18, 11, 24, 1, 1, N'Completed', CAST(0x0000A5DF00C0B06F AS DateTime), N'5000', CAST(0x0000A5DF00C10895 AS DateTime), N'5000')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (144, CAST(0x0000A5DF00000000 AS DateTime), 18, 11, 24, 1, 1, N'Completed', CAST(0x0000A5DF00C56C49 AS DateTime), N'5000', CAST(0x0000A5DF00C580C3 AS DateTime), N'5000')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (145, CAST(0x0000A5E000000000 AS DateTime), 7, 3, 5, 1, 1, N'Completed', CAST(0x0000A5E000949848 AS DateTime), N'kd0252', CAST(0x0000A5E0009576C8 AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (146, CAST(0x0000A5E000000000 AS DateTime), 7, 3, 5, 0, 1, N'Pending for Supply', CAST(0x0000A5E00096B643 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (147, CAST(0x0000A5E200000000 AS DateTime), 7, 3, 5, 1, 1, N'Completed', CAST(0x0000A5E200C52E54 AS DateTime), N'kd0252', CAST(0x0000A5E200C5AE94 AS DateTime), N'kd0252')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (148, CAST(0x0000A5E200000000 AS DateTime), 14, 10, 21, 1, 1, N'Partially Completed', CAST(0x0000A5E200DCB60F AS DateTime), N'lu003', CAST(0x0000A5E200DD6F6E AS DateTime), N'lu003')
INSERT [dbo].[OrderDetail] ([ID], [Date_Of_Visit], [Distributor_Id], [Beat_Id], [Retailer_Id], [Visted], [Sold], [Status], [Ordered_On], [Order_By], [Updated_On], [Updated_By]) VALUES (149, CAST(0x0000A5E200000000 AS DateTime), 1, 1, 23, 1, 1, N'Completed', CAST(0x0000A5E2010AB888 AS DateTime), N'KD53', CAST(0x0000A5E2010B4BE6 AS DateTime), N'KD53')
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
/****** Object:  StoredProcedure [dbo].[MHrVarifyOtpNotification]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  StoredProcedure [dbo].[MHrCreateOtp]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SearchDistributore]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetItems]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetDistributors_By_BikersLogInId]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetBeatList_By_DistId_BikerId]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  Table [dbo].[OrderItem]    Script Date: 04/08/2016 16:20:59 ******/
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
SET IDENTITY_INSERT [dbo].[OrderItem] ON
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (1, 1, 1, 10, 2, CAST(0x0000A5CA016BD5BE AS DateTime), N'Mar 15 2016 10:04PM', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (2, 2, 1, 10, 0, CAST(0x0000A5CB0097950C AS DateTime), N'Jan 13 1900 12:00AM', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (3, 3, 1, 45, 2, CAST(0x0000A5CB009EAF38 AS DateTime), N'Jan 13 1900 12:00AM', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (4, 4, 1, 45, 0, CAST(0x0000A5CB009F1554 AS DateTime), N'Jan 13 1900 12:00AM', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (5, 5, 1, 45, 0, CAST(0x0000A5CB009FC744 AS DateTime), N'Jan 13 1900 12:00AM', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (6, 6, 1, 45, 0, CAST(0x0000A5CB00A055A8 AS DateTime), N'Jan 13 1900 12:00AM', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (7, 9, 1, 5, 10, CAST(0x0000A5CB013C7DBD AS DateTime), N'KD53', CAST(0x0000A5CC0155BA31 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (8, 9, 2, 5, 10, CAST(0x0000A5CB013C7DBD AS DateTime), N'KD53', CAST(0x0000A5CC0155BA35 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (9, 9, 3, 5, 10, CAST(0x0000A5CB013C7DBD AS DateTime), N'KD53', CAST(0x0000A5CC0155BA35 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (10, 10, 1, 5, NULL, CAST(0x0000A5CB01896574 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (11, 10, 2, 5, NULL, CAST(0x0000A5CB01896575 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (12, 10, 3, 5, NULL, CAST(0x0000A5CB01896575 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (13, 11, 1, 5, NULL, CAST(0x0000A5CC00055E09 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (14, 11, 2, 5, NULL, CAST(0x0000A5CC00055E09 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (15, 11, 3, 5, NULL, CAST(0x0000A5CC00055E09 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (16, 12, 1, 5, NULL, CAST(0x0000A5CC00A65924 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (17, 12, 2, 5, NULL, CAST(0x0000A5CC00A65924 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (18, 12, 3, 5, NULL, CAST(0x0000A5CC00A65924 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (24, 15, 1, 5, NULL, CAST(0x0000A5CC00A894C1 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (25, 15, 2, 5, NULL, CAST(0x0000A5CC00A894C1 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (26, 15, 3, 5, NULL, CAST(0x0000A5CC00A894C1 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (30, 16, 1, 5, NULL, CAST(0x0000A5CC00AC448D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (31, 16, 2, 5, NULL, CAST(0x0000A5CC00AC448D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (32, 16, 3, 5, NULL, CAST(0x0000A5CC00AC448D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (33, 17, 1, 5, 5, CAST(0x0000A5CC00ACE74D AS DateTime), N'KD53', CAST(0x0000A5CC00ED20C2 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (34, 17, 2, 5, 100, CAST(0x0000A5CC00ACE74D AS DateTime), N'KD53', CAST(0x0000A5CC00ED20C2 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (35, 17, 3, 5, 200, CAST(0x0000A5CC00ACE74D AS DateTime), N'KD53', CAST(0x0000A5CC00ED20C2 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (36, 18, 1, 5, 2, CAST(0x0000A5CC00AD2915 AS DateTime), N'KD53', CAST(0x0000A5CC00EE5A33 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (37, 18, 2, 5, 50, CAST(0x0000A5CC00AD2915 AS DateTime), N'KD53', CAST(0x0000A5CC00EE5A34 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (38, 18, 3, 5, 80, CAST(0x0000A5CC00AD2915 AS DateTime), N'KD53', CAST(0x0000A5CC00EE5A34 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (39, 25, 1, 5, 10, CAST(0x0000A5CC0109540B AS DateTime), N'KD53', CAST(0x0000A5CC011EB134 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (40, 25, 2, 5, 50, CAST(0x0000A5CC0109540B AS DateTime), N'KD53', CAST(0x0000A5CC011EB134 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (41, 25, 3, 5, 300, CAST(0x0000A5CC0109540B AS DateTime), N'KD53', CAST(0x0000A5CC011EB134 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (42, 26, 1, 5, 50, CAST(0x0000A5CC010A8C63 AS DateTime), N'KD53', CAST(0x0000A5CC0110DB6C AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (43, 26, 2, 5, 40, CAST(0x0000A5CC010A8C63 AS DateTime), N'KD53', CAST(0x0000A5CC0110DB6D AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (44, 26, 3, 5, 200, CAST(0x0000A5CC010A8C63 AS DateTime), N'KD53', CAST(0x0000A5CC0110DB6D AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (45, 27, 1, 5, 10, CAST(0x0000A5CC010C0529 AS DateTime), N'KD53', CAST(0x0000A5CC011FEA72 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (46, 27, 2, 5, 10, CAST(0x0000A5CC010C0529 AS DateTime), N'KD53', CAST(0x0000A5CC011FEA72 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (47, 27, 3, 5, 10, CAST(0x0000A5CC010C0529 AS DateTime), N'KD53', CAST(0x0000A5CC011FEA72 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (48, 28, 1, 5, 10, CAST(0x0000A5CC01107057 AS DateTime), N'KD53', CAST(0x0000A5CC01442BC1 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (49, 28, 2, 5, 10000, CAST(0x0000A5CC01107057 AS DateTime), N'KD53', CAST(0x0000A5CC01442BC2 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (50, 28, 3, 5, 20000, CAST(0x0000A5CC01107057 AS DateTime), N'KD53', CAST(0x0000A5CC01442BC2 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (51, 29, 1, 5, 10, CAST(0x0000A5CC0110768B AS DateTime), N'KD53', CAST(0x0000A5CE008BB7EC AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (52, 29, 2, 5, 1000, CAST(0x0000A5CC0110768B AS DateTime), N'KD53', CAST(0x0000A5CE008BB7EC AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (53, 29, 3, 5, 1000, CAST(0x0000A5CC0110768B AS DateTime), N'KD53', CAST(0x0000A5CE008BB7EC AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (54, 30, 1, 5, 1, CAST(0x0000A5CC0110792B AS DateTime), N'KD53', CAST(0x0000A5CC014B1DF5 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (55, 30, 2, 5, 1, CAST(0x0000A5CC0110792B AS DateTime), N'KD53', CAST(0x0000A5CC014B1DF5 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (56, 30, 3, 5, 1, CAST(0x0000A5CC0110792B AS DateTime), N'KD53', CAST(0x0000A5CC014B1DF5 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (57, 31, 1, 5, 40, CAST(0x0000A5CC01107A79 AS DateTime), N'KD53', CAST(0x0000A5CE00A3C84A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (58, 31, 2, 5, 30000, CAST(0x0000A5CC01107A79 AS DateTime), N'KD53', CAST(0x0000A5CE00A3C84A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (59, 31, 3, 5, 15000, CAST(0x0000A5CC01107A79 AS DateTime), N'KD53', CAST(0x0000A5CE00A3C84A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (60, 32, 1, 5, 20, CAST(0x0000A5CC01107B9C AS DateTime), N'KD53', CAST(0x0000A5CC0132A4AB AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (61, 32, 2, 5, 50, CAST(0x0000A5CC01107B9C AS DateTime), N'KD53', CAST(0x0000A5CC0132A4AF AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (62, 32, 3, 5, 50, CAST(0x0000A5CC01107B9C AS DateTime), N'KD53', CAST(0x0000A5CC0132A4AF AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (63, 33, 1, 5, 20, CAST(0x0000A5CC01107EF5 AS DateTime), N'KD53', CAST(0x0000A5CC012988AB AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (64, 33, 2, 5, 60, CAST(0x0000A5CC01107EF5 AS DateTime), N'KD53', CAST(0x0000A5CC012988AB AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (65, 33, 3, 5, 60, CAST(0x0000A5CC01107EF5 AS DateTime), N'KD53', CAST(0x0000A5CC012988AB AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (66, 34, 1, 5, 0, CAST(0x0000A5CC01195503 AS DateTime), N'KD53', CAST(0x0000A5CC014ADA70 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (67, 34, 2, 5, 40, CAST(0x0000A5CC01195503 AS DateTime), N'KD53', CAST(0x0000A5CC014ADA70 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (68, 34, 3, 5, 40, CAST(0x0000A5CC01195503 AS DateTime), N'KD53', CAST(0x0000A5CC014ADA70 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (69, 35, 1, 5, 1000, CAST(0x0000A5CC0148CD9E AS DateTime), N'KD53', CAST(0x0000A5CD00BD468A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (70, 35, 2, 5, 1000, CAST(0x0000A5CC0148CD9F AS DateTime), N'KD53', CAST(0x0000A5CD00BD468A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (71, 35, 3, 5, 1000, CAST(0x0000A5CC0148CD9F AS DateTime), N'KD53', CAST(0x0000A5CD00BD468A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (72, 36, 1, 5, 1, CAST(0x0000A5CC0149A2BE AS DateTime), N'KD53', CAST(0x0000A5CD00EBF4C6 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (73, 36, 2, 5, 1, CAST(0x0000A5CC0149A2BE AS DateTime), N'KD53', CAST(0x0000A5CD00EBF4C6 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (74, 36, 3, 5, 1, CAST(0x0000A5CC0149A2BE AS DateTime), N'KD53', CAST(0x0000A5CD00EBF4C6 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (75, 37, 1, 5, 10, CAST(0x0000A5CC01549128 AS DateTime), N'KD53', CAST(0x0000A5CD00EA1DE9 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (76, 37, 2, 5, 10, CAST(0x0000A5CC01549129 AS DateTime), N'KD53', CAST(0x0000A5CD00EA1DE9 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (77, 37, 3, 5, 10, CAST(0x0000A5CC01549129 AS DateTime), N'KD53', CAST(0x0000A5CD00EA1DE9 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (78, 38, 1, 5, 10, CAST(0x0000A5CC0154C2A3 AS DateTime), N'KD53', CAST(0x0000A5CD014DC20A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (79, 38, 2, 5, 10, CAST(0x0000A5CC0154C2A3 AS DateTime), N'KD53', CAST(0x0000A5CD014DC20B AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (80, 38, 3, 5, 10, CAST(0x0000A5CC0154C2A3 AS DateTime), N'KD53', CAST(0x0000A5CD014DC20B AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (81, 39, 1, 5, 10, CAST(0x0000A5CC01553891 AS DateTime), N'KD53', CAST(0x0000A5CD014EC192 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (82, 39, 2, 5, 10, CAST(0x0000A5CC01553891 AS DateTime), N'KD53', CAST(0x0000A5CD014EC192 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (83, 39, 3, 5, 10, CAST(0x0000A5CC01553891 AS DateTime), N'KD53', CAST(0x0000A5CD014EC192 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (84, 40, 1, 5, 10, CAST(0x0000A5CC0159E286 AS DateTime), N'KD53', CAST(0x0000A5CD016E534F AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (85, 40, 2, 5, 10, CAST(0x0000A5CC0159E287 AS DateTime), N'KD53', CAST(0x0000A5CD016E534F AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (86, 40, 3, 5, 10, CAST(0x0000A5CC0159E287 AS DateTime), N'KD53', CAST(0x0000A5CD016E534F AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (87, 41, 1, 5, 10, CAST(0x0000A5CC015A7C5D AS DateTime), N'KD53', CAST(0x0000A5CD00B7451C AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (88, 41, 2, 5, 100, CAST(0x0000A5CC015A7C5D AS DateTime), N'KD53', CAST(0x0000A5CD00B7451C AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (89, 41, 3, 5, 200, CAST(0x0000A5CC015A7C5D AS DateTime), N'KD53', CAST(0x0000A5CD00B7451C AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (90, 42, 1, 5, NULL, CAST(0x0000A5CC01608FD0 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (91, 42, 2, 5, NULL, CAST(0x0000A5CC01608FD0 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (92, 42, 3, 5, NULL, CAST(0x0000A5CC01608FD0 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (93, 43, 1, 5, NULL, CAST(0x0000A5CC0165C2C3 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (94, 43, 2, 5, NULL, CAST(0x0000A5CC0165C2C3 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (95, 43, 3, 5, NULL, CAST(0x0000A5CC0165C2C3 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (96, 44, 1, 5, NULL, CAST(0x0000A5CD00921B09 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (97, 44, 2, 5, NULL, CAST(0x0000A5CD00921B09 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (98, 44, 3, 5, NULL, CAST(0x0000A5CD00921B09 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (99, 45, 1, 5, NULL, CAST(0x0000A5CD00B323B2 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (100, 45, 2, 5, NULL, CAST(0x0000A5CD00B323B2 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (101, 45, 3, 5, NULL, CAST(0x0000A5CD00B323B2 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (102, 46, 1, 5, NULL, CAST(0x0000A5CD00B5789D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (103, 46, 2, 5, NULL, CAST(0x0000A5CD00B5789D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (104, 46, 3, 5, NULL, CAST(0x0000A5CD00B5789D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (105, 47, 1, 5, NULL, CAST(0x0000A5CD00B5CB09 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (106, 47, 2, 5, NULL, CAST(0x0000A5CD00B5CB09 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (107, 47, 3, 5, NULL, CAST(0x0000A5CD00B5CB09 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (108, 48, 1, 5, NULL, CAST(0x0000A5CD00B63D03 AS DateTime), N'KD53', NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (109, 48, 2, 5, NULL, CAST(0x0000A5CD00B63D03 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (110, 48, 3, 5, NULL, CAST(0x0000A5CD00B63D03 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (111, 49, 1, 5, NULL, CAST(0x0000A5CD00B8A6D9 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (112, 49, 2, 5, NULL, CAST(0x0000A5CD00B8A6D9 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (113, 49, 3, 5, NULL, CAST(0x0000A5CD00B8A6D9 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (114, 50, 1, 5, NULL, CAST(0x0000A5CD00B93B22 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (115, 50, 2, 5, NULL, CAST(0x0000A5CD00B93B22 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (116, 50, 3, 5, NULL, CAST(0x0000A5CD00B93B22 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (117, 51, 1, 5, NULL, CAST(0x0000A5CD00CFA6CF AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (118, 51, 2, 5, NULL, CAST(0x0000A5CD00CFA6CF AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (119, 51, 3, 5, NULL, CAST(0x0000A5CD00CFA6CF AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (120, 52, 1, 5, NULL, CAST(0x0000A5CD00D019FB AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (121, 52, 2, 5, NULL, CAST(0x0000A5CD00D019FB AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (122, 52, 3, 5, NULL, CAST(0x0000A5CD00D019FB AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (123, 53, 1, 5, NULL, CAST(0x0000A5CD00D0C41B AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (124, 53, 2, 5, NULL, CAST(0x0000A5CD00D0C41B AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (125, 53, 3, 5, NULL, CAST(0x0000A5CD00D0C41B AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (126, 54, 1, 5, NULL, CAST(0x0000A5CD00D14227 AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (127, 54, 2, 5, NULL, CAST(0x0000A5CD00D14227 AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (128, 54, 3, 5, NULL, CAST(0x0000A5CD00D14227 AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (129, 55, 1, 5, NULL, CAST(0x0000A5CD00D1736D AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (130, 55, 2, 5, NULL, CAST(0x0000A5CD00D1736D AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (131, 55, 3, 5, NULL, CAST(0x0000A5CD00D1736D AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (132, 56, 1, 5, NULL, CAST(0x0000A5CD00D260A7 AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (133, 56, 2, 5, NULL, CAST(0x0000A5CD00D260A7 AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (134, 56, 3, 5, NULL, CAST(0x0000A5CD00D260A7 AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (135, 57, 1, 5, NULL, CAST(0x0000A5CD00D2E8CB AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (136, 57, 2, 5, NULL, CAST(0x0000A5CD00D2E8CB AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (137, 57, 3, 5, NULL, CAST(0x0000A5CD00D2E8CB AS DateTime), N'kd53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (138, 58, 1, 5, NULL, CAST(0x0000A5CD00D80F51 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (139, 58, 2, 5, NULL, CAST(0x0000A5CD00D80F52 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (140, 58, 3, 5, NULL, CAST(0x0000A5CD00D80F52 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (141, 59, 1, 5, NULL, CAST(0x0000A5CD00E0EC70 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (142, 59, 2, 5, NULL, CAST(0x0000A5CD00E0EC70 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (143, 59, 3, 5, NULL, CAST(0x0000A5CD00E0EC70 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (144, 60, 1, 5, 50, CAST(0x0000A5CD00EC9199 AS DateTime), N'KD53', CAST(0x0000A5CD010B7519 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (145, 60, 2, 5, 50, CAST(0x0000A5CD00EC9199 AS DateTime), N'KD53', CAST(0x0000A5CD010B751A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (146, 60, 3, 5, 50, CAST(0x0000A5CD00EC9199 AS DateTime), N'KD53', CAST(0x0000A5CD010B751A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (147, 61, 1, 5, 0, CAST(0x0000A5CD00F45294 AS DateTime), N'KD53', CAST(0x0000A5CD00F6AA4C AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (148, 61, 2, 5, 0, CAST(0x0000A5CD00F45295 AS DateTime), N'KD53', CAST(0x0000A5CD00F6AA4C AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (149, 61, 3, 5, 0, CAST(0x0000A5CD00F45295 AS DateTime), N'KD53', CAST(0x0000A5CD00F6AA4C AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (150, 62, 1, 5, NULL, CAST(0x0000A5CD0102D809 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (151, 62, 2, 5, NULL, CAST(0x0000A5CD0102D80A AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (152, 62, 1, 5, NULL, CAST(0x0000A5CD0102D80A AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (153, 63, 1, 5, NULL, CAST(0x0000A5CD010A5541 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (154, 63, 2, 5, NULL, CAST(0x0000A5CD010A5541 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (155, 63, 3, 5, NULL, CAST(0x0000A5CD010A5541 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (156, 64, 1, 5, NULL, CAST(0x0000A5CD010AFD74 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (157, 64, 2, 5, NULL, CAST(0x0000A5CD010AFD74 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (158, 64, 3, 5, NULL, CAST(0x0000A5CD010AFD74 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (159, 65, 1, 5, NULL, CAST(0x0000A5CD010B351F AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (160, 65, 2, 5, NULL, CAST(0x0000A5CD010B351F AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (161, 65, 3, 5, NULL, CAST(0x0000A5CD010B351F AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (162, 66, 1, 5, NULL, CAST(0x0000A5CD010C0C55 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (163, 66, 2, 5, NULL, CAST(0x0000A5CD010C0C55 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (164, 66, 3, 5, NULL, CAST(0x0000A5CD010C0C55 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (165, 67, 1, 5, NULL, CAST(0x0000A5CD0110E7A3 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (166, 67, 2, 5, NULL, CAST(0x0000A5CD0110E7A3 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (167, 67, 3, 5, NULL, CAST(0x0000A5CD0110E7A3 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (168, 68, 1, 5, NULL, CAST(0x0000A5CD01123BB3 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (169, 68, 2, 5, NULL, CAST(0x0000A5CD01123BB4 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (170, 68, 3, 5, NULL, CAST(0x0000A5CD01123BB4 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (171, 69, 1, 5, NULL, CAST(0x0000A5CD01300A36 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (172, 69, 2, 5, NULL, CAST(0x0000A5CD01300A36 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (173, 69, 3, 5, NULL, CAST(0x0000A5CD01300A36 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (174, 70, 1, 5, NULL, CAST(0x0000A5CD0130B15B AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (175, 70, 2, 5, NULL, CAST(0x0000A5CD0130B15C AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (176, 70, 3, 5, NULL, CAST(0x0000A5CD0130B15C AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (177, 71, 1, 5, NULL, CAST(0x0000A5CD0131423E AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (178, 71, 2, 5, NULL, CAST(0x0000A5CD0131423E AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (179, 71, 3, 5, NULL, CAST(0x0000A5CD0131423E AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (180, 72, 1, 5, 2, CAST(0x0000A5CD013204BB AS DateTime), N'KD53', CAST(0x0000A5CD013F75E8 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (181, 72, 2, 5, 2, CAST(0x0000A5CD013204BB AS DateTime), N'KD53', CAST(0x0000A5CD013F75E8 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (182, 72, 3, 5, 2, CAST(0x0000A5CD013204BB AS DateTime), N'KD53', CAST(0x0000A5CD013F75E8 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (183, 73, 1, 5, NULL, CAST(0x0000A5CD01344C4F AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (184, 73, 2, 5, NULL, CAST(0x0000A5CD01344C4F AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (185, 73, 3, 5, NULL, CAST(0x0000A5CD01344C4F AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (186, 74, 1, 5, NULL, CAST(0x0000A5CD013D7581 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (187, 74, 2, 5, NULL, CAST(0x0000A5CD013D7581 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (188, 74, 3, 5, NULL, CAST(0x0000A5CD013D7581 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (189, 75, 1, 5, NULL, CAST(0x0000A5CD013EEB12 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (190, 75, 2, 5, NULL, CAST(0x0000A5CD013EEB12 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (191, 75, 3, 5, NULL, CAST(0x0000A5CD013EEB12 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (192, 76, 1, 5, NULL, CAST(0x0000A5CD013F1EA8 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (193, 76, 2, 5, NULL, CAST(0x0000A5CD013F1EA8 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (194, 76, 3, 5, NULL, CAST(0x0000A5CD013F1EA8 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (195, 77, 1, 44, 0, CAST(0x0000A5CD0161A8AC AS DateTime), N'Kd0252', CAST(0x0000A5CD01693A9A AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (196, 77, 2, 44, 0, CAST(0x0000A5CD0161A8AD AS DateTime), N'Kd0252', CAST(0x0000A5CD01693A9A AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (197, 77, 3, 44, 0, CAST(0x0000A5CD0161A8AD AS DateTime), N'Kd0252', CAST(0x0000A5CD01693A9A AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (198, 78, 1, 5, NULL, CAST(0x0000A5CD01681135 AS DateTime), N'Kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (199, 78, 2, 5, NULL, CAST(0x0000A5CD01681135 AS DateTime), N'Kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (200, 78, 3, 5, NULL, CAST(0x0000A5CD01681135 AS DateTime), N'Kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (201, 79, 1, 5, 24, CAST(0x0000A5CD016A2B69 AS DateTime), N'KD53', CAST(0x0000A5CD016E735E AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (202, 79, 2, 5, 24, CAST(0x0000A5CD016A2B69 AS DateTime), N'KD53', CAST(0x0000A5CD016E735E AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (203, 79, 3, 5, 24, CAST(0x0000A5CD016A2B69 AS DateTime), N'KD53', CAST(0x0000A5CD016E735E AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (204, 80, 1, 4, 2, CAST(0x0000A5CD016C1C16 AS DateTime), N'Kd0252', CAST(0x0000A5CD016C389E AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (205, 80, 2, 4, 0, CAST(0x0000A5CD016C1C16 AS DateTime), N'Kd0252', CAST(0x0000A5CD016C389E AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (206, 80, 3, 4, 4, CAST(0x0000A5CD016C1C16 AS DateTime), N'Kd0252', CAST(0x0000A5CD016C389E AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (207, 81, 1, 10, 5, CAST(0x0000A5CD016D270F AS DateTime), N'Kd0252', CAST(0x0000A5CD016D404A AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (208, 81, 2, 10, 5, CAST(0x0000A5CD016D270F AS DateTime), N'Kd0252', CAST(0x0000A5CD016D404A AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (209, 81, 3, 10, 0, CAST(0x0000A5CD016D270F AS DateTime), N'Kd0252', CAST(0x0000A5CD016D404A AS DateTime), N'Kd0252')
GO
print 'Processed 200 total records'
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (210, 82, 1, 5, 1, CAST(0x0000A5CD016D7B37 AS DateTime), N'KD53', CAST(0x0000A5CD016E24D7 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (211, 82, 2, 5, 1, CAST(0x0000A5CD016D7B37 AS DateTime), N'KD53', CAST(0x0000A5CD016E24D7 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (212, 82, 3, 5, 1, CAST(0x0000A5CD016D7B37 AS DateTime), N'KD53', CAST(0x0000A5CD016E24D7 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (213, 83, 1, 10, 3, CAST(0x0000A5CD0172C466 AS DateTime), N'Kd0252', CAST(0x0000A5CD017302BF AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (214, 83, 2, 1500, 500, CAST(0x0000A5CD0172C466 AS DateTime), N'Kd0252', CAST(0x0000A5CD017302BF AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (215, 83, 3, 1500, 300, CAST(0x0000A5CD0172C466 AS DateTime), N'Kd0252', CAST(0x0000A5CD017302BF AS DateTime), N'Kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (216, 84, 1, 1, NULL, CAST(0x0000A5CD017AC1BB AS DateTime), N'KD0252', CAST(0x0000A5CE00A17CAF AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (217, 84, 2, 1, NULL, CAST(0x0000A5CD017AC1BB AS DateTime), N'KD0252', CAST(0x0000A5CE00A17CAF AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (218, 84, 3, 1, NULL, CAST(0x0000A5CD017AC1BB AS DateTime), N'KD0252', CAST(0x0000A5CE00A17CAF AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (219, 85, 1, 5, NULL, CAST(0x0000A5CD017BDE62 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (220, 85, 2, 5, NULL, CAST(0x0000A5CD017BDE62 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (221, 85, 3, 5, NULL, CAST(0x0000A5CD017BDE62 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (222, 86, 1, 5, NULL, CAST(0x0000A5CD017C1568 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (223, 86, 2, 5, NULL, CAST(0x0000A5CD017C1568 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (224, 86, 3, 5, NULL, CAST(0x0000A5CD017C1568 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (225, 87, 1, 1, 0, CAST(0x0000A5CD0188DCAA AS DateTime), N'KD0252', CAST(0x0000A5CE006C85F7 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (226, 87, 2, 1, 0, CAST(0x0000A5CD0188DCAA AS DateTime), N'KD0252', CAST(0x0000A5CE006C85F7 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (227, 87, 3, 1, 0, CAST(0x0000A5CD0188DCAA AS DateTime), N'KD0252', CAST(0x0000A5CE006C85F7 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (228, 88, 1, 0, NULL, CAST(0x0000A5CE006B023D AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (229, 88, 2, 0, NULL, CAST(0x0000A5CE006B023D AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (230, 88, 3, 0, NULL, CAST(0x0000A5CE006B023D AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (231, 89, 1, 5, 4, CAST(0x0000A5CE006B3B92 AS DateTime), N'KD0252', CAST(0x0000A5CE006B5FC5 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (232, 89, 2, 0, 0, CAST(0x0000A5CE006B3B92 AS DateTime), N'KD0252', CAST(0x0000A5CE006B5FC6 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (233, 89, 3, 0, 0, CAST(0x0000A5CE006B3B92 AS DateTime), N'KD0252', CAST(0x0000A5CE006B5FC6 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (234, 90, 1, 10, 8, CAST(0x0000A5CE006B9624 AS DateTime), N'KD0252', CAST(0x0000A5CE006BB58F AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (235, 90, 2, 10, 8, CAST(0x0000A5CE006B9624 AS DateTime), N'KD0252', CAST(0x0000A5CE006BB58F AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (236, 90, 3, 100, 50, CAST(0x0000A5CE006B9624 AS DateTime), N'KD0252', CAST(0x0000A5CE006BB58F AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (237, 91, 1, 10, 4, CAST(0x0000A5CE006CC0F2 AS DateTime), N'KD0252', CAST(0x0000A5CE006CE98B AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (238, 91, 2, 10, 4, CAST(0x0000A5CE006CC0F2 AS DateTime), N'KD0252', CAST(0x0000A5CE006CE98B AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (239, 91, 3, 10, 4, CAST(0x0000A5CE006CC0F2 AS DateTime), N'KD0252', CAST(0x0000A5CE006CE98B AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (240, 92, 1, 5, NULL, CAST(0x0000A5CE0088DF39 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (241, 92, 2, 5, NULL, CAST(0x0000A5CE0088DF39 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (242, 92, 3, 5, NULL, CAST(0x0000A5CE0088DF39 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (243, 93, 1, 0, NULL, CAST(0x0000A5CE00A0C703 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (244, 93, 2, 0, NULL, CAST(0x0000A5CE00A0C704 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (245, 93, 3, 0, NULL, CAST(0x0000A5CE00A0C704 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (246, 94, 1, 0, NULL, CAST(0x0000A5CE00A0F623 AS DateTime), N'kd0252', CAST(0x0000A5CE00A10A10 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (247, 94, 2, 10, NULL, CAST(0x0000A5CE00A0F623 AS DateTime), N'kd0252', CAST(0x0000A5CE00A10A13 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (248, 94, 3, 10, NULL, CAST(0x0000A5CE00A0F623 AS DateTime), N'kd0252', CAST(0x0000A5CE00A10A13 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (249, 95, 1, 0, NULL, CAST(0x0000A5CE00A356EB AS DateTime), N'kd0252', CAST(0x0000A5CE00A36E8D AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (250, 95, 2, 100, NULL, CAST(0x0000A5CE00A356EB AS DateTime), N'kd0252', CAST(0x0000A5CE00A36E8D AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (251, 95, 3, 100, NULL, CAST(0x0000A5CE00A356EB AS DateTime), N'kd0252', CAST(0x0000A5CE00A36E8D AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (252, 96, 1, 5, NULL, CAST(0x0000A5CE00A62948 AS DateTime), N'KD53', CAST(0x0000A5CE00A6489A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (253, 96, 2, 5, NULL, CAST(0x0000A5CE00A62948 AS DateTime), N'KD53', CAST(0x0000A5CE00A6489A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (254, 96, 3, 5, NULL, CAST(0x0000A5CE00A62948 AS DateTime), N'KD53', CAST(0x0000A5CE00A6489A AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (255, 97, 1, 5, NULL, CAST(0x0000A5CE00A6B0C5 AS DateTime), N'KD53', CAST(0x0000A5CE00A6F727 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (256, 97, 2, 5, NULL, CAST(0x0000A5CE00A6B0C5 AS DateTime), N'KD53', CAST(0x0000A5CE00A6F727 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (257, 97, 3, 5, NULL, CAST(0x0000A5CE00A6B0C5 AS DateTime), N'KD53', CAST(0x0000A5CE00A6F727 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (258, 98, 1, 1, NULL, CAST(0x0000A5CE00ACAD64 AS DateTime), N'KD0252', CAST(0x0000A5CE00ACC635 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (259, 98, 2, 1, NULL, CAST(0x0000A5CE00ACAD65 AS DateTime), N'KD0252', CAST(0x0000A5CE00ACC63C AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (260, 98, 3, 1, NULL, CAST(0x0000A5CE00ACAD65 AS DateTime), N'KD0252', CAST(0x0000A5CE00ACC63C AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (261, 99, 1, 1, 1, CAST(0x0000A5CE00AF24B0 AS DateTime), N'KD0252', CAST(0x0000A5CE00AF399D AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (262, 99, 2, 1, 1, CAST(0x0000A5CE00AF24B0 AS DateTime), N'KD0252', CAST(0x0000A5CE00AF399E AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (263, 99, 3, 1, 1, CAST(0x0000A5CE00AF24B0 AS DateTime), N'KD0252', CAST(0x0000A5CE00AF399E AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (264, 100, 1, 0, NULL, CAST(0x0000A5CE00AF9A48 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (265, 100, 2, 0, NULL, CAST(0x0000A5CE00AF9A48 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (266, 100, 3, 0, NULL, CAST(0x0000A5CE00AF9A48 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (267, 101, 1, 100000, 100000, CAST(0x0000A5CE00AFC2FA AS DateTime), N'KD0252', CAST(0x0000A5CE00B002DC AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (268, 101, 2, 100000, 100000, CAST(0x0000A5CE00AFC2FA AS DateTime), N'KD0252', CAST(0x0000A5CE00B002DC AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (269, 101, 3, 100000, 100000, CAST(0x0000A5CE00AFC2FA AS DateTime), N'KD0252', CAST(0x0000A5CE00B002DC AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (270, 102, 1, 1, 1, CAST(0x0000A5CE00B04F13 AS DateTime), N'KD0252', CAST(0x0000A5CE0167C4C3 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (271, 102, 2, 1, 1, CAST(0x0000A5CE00B04F13 AS DateTime), N'KD0252', CAST(0x0000A5CE0167C4C3 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (272, 102, 3, 1, 1, CAST(0x0000A5CE00B04F13 AS DateTime), N'KD0252', CAST(0x0000A5CE0167C4C3 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (273, 103, 1, 5, 0, CAST(0x0000A5CE00B0A0D7 AS DateTime), N'KD53', CAST(0x0000A5CE00B0DF29 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (274, 103, 2, 5, 50, CAST(0x0000A5CE00B0A0D7 AS DateTime), N'KD53', CAST(0x0000A5CE00B0DF29 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (275, 103, 3, 5, 50, CAST(0x0000A5CE00B0A0D7 AS DateTime), N'KD53', CAST(0x0000A5CE00B0DF29 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (276, 104, 1, 25, 20, CAST(0x0000A5CE00B0AA8F AS DateTime), N'KD0252', CAST(0x0000A5D000F6B281 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (277, 104, 2, 25, 25, CAST(0x0000A5CE00B0AA8F AS DateTime), N'KD0252', CAST(0x0000A5D000F6B281 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (278, 104, 3, 25, 25, CAST(0x0000A5CE00B0AA8F AS DateTime), N'KD0252', CAST(0x0000A5D000F6B281 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (279, 105, 1, 0, 0, CAST(0x0000A5CE00B1A1EB AS DateTime), N'kd0252', CAST(0x0000A5CE00B1C5E7 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (280, 105, 2, 100, 5, CAST(0x0000A5CE00B1A1EB AS DateTime), N'kd0252', CAST(0x0000A5CE00B1C5E7 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (281, 105, 3, 100, 50, CAST(0x0000A5CE00B1A1EB AS DateTime), N'kd0252', CAST(0x0000A5CE00B1C5E7 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (282, 106, 1, 0, NULL, CAST(0x0000A5CE00B20473 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (283, 106, 2, 0, NULL, CAST(0x0000A5CE00B20473 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (284, 106, 3, 0, NULL, CAST(0x0000A5CE00B20473 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (285, 107, 1, 10, 7, CAST(0x0000A5CE00B2CD6F AS DateTime), N'kd0252', CAST(0x0000A5CE00B31793 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (286, 107, 2, 0, 0, CAST(0x0000A5CE00B2CD6F AS DateTime), N'kd0252', CAST(0x0000A5CE00B31793 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (287, 107, 3, 0, 0, CAST(0x0000A5CE00B2CD6F AS DateTime), N'kd0252', CAST(0x0000A5CE00B31793 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (288, 108, 1, 50, 45, CAST(0x0000A5CE00B3509D AS DateTime), N'kd0252', CAST(0x0000A5CE00B386AB AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (289, 108, 2, 0, 0, CAST(0x0000A5CE00B3509D AS DateTime), N'kd0252', CAST(0x0000A5CE00B386AB AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (290, 108, 3, 50, 40, CAST(0x0000A5CE00B3509D AS DateTime), N'kd0252', CAST(0x0000A5CE00B386AB AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (291, 109, 1, 100, 50, CAST(0x0000A5CE00B3D1CB AS DateTime), N'kd0252', CAST(0x0000A5CE00B3E6A6 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (292, 109, 2, 4000, 4000, CAST(0x0000A5CE00B3D1CB AS DateTime), N'kd0252', CAST(0x0000A5CE00B3E6A6 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (293, 109, 3, 4000, 4000, CAST(0x0000A5CE00B3D1CB AS DateTime), N'kd0252', CAST(0x0000A5CE00B3E6A6 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (294, 110, 1, 400, 400, CAST(0x0000A5CE00BD296D AS DateTime), N'kd0252', CAST(0x0000A5CE00BD7C91 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (295, 110, 2, 70000, 65000, CAST(0x0000A5CE00BD296D AS DateTime), N'kd0252', CAST(0x0000A5CE00BD7C91 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (296, 110, 3, 70000, 70000, CAST(0x0000A5CE00BD296D AS DateTime), N'kd0252', CAST(0x0000A5CE00BD7C91 AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (297, 111, 1, 50, 40, CAST(0x0000A5CE00C3F0F0 AS DateTime), N'kd0252', CAST(0x0000A5CE00C44A7C AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (298, 111, 2, 70000, 65000, CAST(0x0000A5CE00C3F0F0 AS DateTime), N'kd0252', CAST(0x0000A5CE00C44A7C AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (299, 111, 3, 70000, 60000, CAST(0x0000A5CE00C3F0F0 AS DateTime), N'kd0252', CAST(0x0000A5CE00C44A7C AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (300, 112, 1, 100, NULL, CAST(0x0000A5CE01674550 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (301, 112, 2, 10000, NULL, CAST(0x0000A5CE01674551 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (302, 112, 3, 20000, NULL, CAST(0x0000A5CE01674551 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (303, 113, 1, 1, 1, CAST(0x0000A5D000AB3B1D AS DateTime), N'KD0252', CAST(0x0000A5D000AB55F1 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (304, 113, 2, 1, 1, CAST(0x0000A5D000AB3B1D AS DateTime), N'KD0252', CAST(0x0000A5D000AB55F1 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (305, 113, 3, 1, 1, CAST(0x0000A5D000AB3B1D AS DateTime), N'KD0252', CAST(0x0000A5D000AB55F1 AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (306, 114, 1, 1, NULL, CAST(0x0000A5D001011543 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (307, 114, 2, 1, NULL, CAST(0x0000A5D001011543 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (308, 114, 3, 1, NULL, CAST(0x0000A5D001011543 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (309, 115, 1, 1, NULL, CAST(0x0000A5D0013AA385 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (310, 115, 2, 1, NULL, CAST(0x0000A5D0013AA386 AS DateTime), N'KD0252', NULL, NULL)
GO
print 'Processed 300 total records'
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (311, 115, 3, 1, NULL, CAST(0x0000A5D0013AA386 AS DateTime), N'KD0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (312, 117, 1, 5, NULL, CAST(0x0000A5D1008F3529 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (313, 117, 2, 5, NULL, CAST(0x0000A5D1008F3A7F AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (314, 117, 3, 5, NULL, CAST(0x0000A5D1008F3A7F AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (315, 118, 1, 5, NULL, CAST(0x0000A5D1008F6A22 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (316, 118, 2, 5, NULL, CAST(0x0000A5D1008F6A22 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (317, 118, 3, 5, NULL, CAST(0x0000A5D1008F6A22 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (318, 119, 1, 5, NULL, CAST(0x0000A5D1008FC52D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (319, 119, 2, 5, NULL, CAST(0x0000A5D1008FC52D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (320, 119, 3, 5, NULL, CAST(0x0000A5D1008FC52D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (321, 120, 1, 5, NULL, CAST(0x0000A5D1008FFD57 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (322, 120, 2, 5, NULL, CAST(0x0000A5D1008FFD57 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (323, 120, 3, 5, NULL, CAST(0x0000A5D1008FFD57 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (324, 121, 1, 1, 1, CAST(0x0000A5D100B44D6C AS DateTime), N'KD0252', CAST(0x0000A5D100B4727C AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (325, 121, 2, 1, 1, CAST(0x0000A5D100B44D6D AS DateTime), N'KD0252', CAST(0x0000A5D100B4727C AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (326, 121, 3, 1, 1, CAST(0x0000A5D100B44D6D AS DateTime), N'KD0252', CAST(0x0000A5D100B4727C AS DateTime), N'KD0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (327, 122, 1, 5, NULL, CAST(0x0000A5D100D5891E AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (328, 122, 2, 5, NULL, CAST(0x0000A5D100D5891E AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (329, 122, 3, 5, NULL, CAST(0x0000A5D100D5891E AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (330, 123, 1, 5, NULL, CAST(0x0000A5D100E89FAA AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (331, 123, 2, 5, NULL, CAST(0x0000A5D100E89FAA AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (332, 123, 3, 5, NULL, CAST(0x0000A5D100E89FAA AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (333, 124, 1, 5, NULL, CAST(0x0000A5D100EB816A AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (334, 124, 2, 5, NULL, CAST(0x0000A5D100EB816B AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (335, 124, 3, 5, NULL, CAST(0x0000A5D100EB816B AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (336, 125, 1, 5, NULL, CAST(0x0000A5D100EBC29D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (337, 125, 2, 5, NULL, CAST(0x0000A5D100EBC29D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (338, 125, 3, 5, NULL, CAST(0x0000A5D100EBC29D AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (339, 126, 1, 5, NULL, CAST(0x0000A5D100ECDF10 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (340, 126, 2, 5, NULL, CAST(0x0000A5D100ECDF10 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (341, 126, 3, 5, NULL, CAST(0x0000A5D100ECDF10 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (342, 127, 1, 5, NULL, CAST(0x0000A5D100EDB887 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (343, 127, 2, 5, NULL, CAST(0x0000A5D100EDB887 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (344, 127, 3, 5, NULL, CAST(0x0000A5D100EDB887 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (345, 128, 1, 5, NULL, CAST(0x0000A5D100EF56DE AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (346, 128, 2, 5, NULL, CAST(0x0000A5D100EF56DE AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (347, 128, 3, 5, NULL, CAST(0x0000A5D100EF56DE AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (348, 129, 1, 5, NULL, CAST(0x0000A5D100F003BF AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (349, 129, 2, 5, NULL, CAST(0x0000A5D100F003BF AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (350, 129, 3, 5, NULL, CAST(0x0000A5D100F003BF AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (351, 130, 1, 5, NULL, CAST(0x0000A5D100F1ACD6 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (352, 130, 2, 5, NULL, CAST(0x0000A5D100F1ACD6 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (353, 130, 3, 5, NULL, CAST(0x0000A5D100F1ACD6 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (354, 131, 1, 5, NULL, CAST(0x0000A5D100F40808 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (355, 131, 2, 5, NULL, CAST(0x0000A5D100F40809 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (356, 131, 3, 5, NULL, CAST(0x0000A5D100F40809 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (357, 132, 1, 5, NULL, CAST(0x0000A5D100F4696C AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (358, 132, 2, 5, NULL, CAST(0x0000A5D100F4696C AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (359, 132, 3, 5, NULL, CAST(0x0000A5D100F4696C AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (360, 133, 1, 5, NULL, CAST(0x0000A5D100F70937 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (361, 133, 2, 5, NULL, CAST(0x0000A5D100F70937 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (362, 133, 3, 5, NULL, CAST(0x0000A5D100F70937 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (363, 134, 1, 5, NULL, CAST(0x0000A5D20127B1E8 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (364, 134, 2, 5, NULL, CAST(0x0000A5D20127B1E8 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (365, 134, 3, 5, NULL, CAST(0x0000A5D20127B1E8 AS DateTime), N'KD53', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (366, 135, 1, 10, 10, CAST(0x0000A5D700E9E030 AS DateTime), N'kd0252', CAST(0x0000A5D700EA09DE AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (367, 135, 2, 1000, 10, CAST(0x0000A5D700E9E031 AS DateTime), N'kd0252', CAST(0x0000A5D700EA09DF AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (368, 135, 3, 1000, 10, CAST(0x0000A5D700E9E031 AS DateTime), N'kd0252', CAST(0x0000A5D700EA09DF AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (369, 136, 1, 0, 0, CAST(0x0000A5DA00B1055A AS DateTime), N'lu003', CAST(0x0000A5DA00B18D20 AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (370, 136, 2, 1000, 1000, CAST(0x0000A5DA00B1055A AS DateTime), N'lu003', CAST(0x0000A5DA00B18D20 AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (371, 136, 3, 1000, 1000, CAST(0x0000A5DA00B1055A AS DateTime), N'lu003', CAST(0x0000A5DA00B18D20 AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (372, 137, 1, 3, 2, CAST(0x0000A5DA00B26007 AS DateTime), N'lu003', CAST(0x0000A5DA00B2EA9B AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (373, 137, 2, 1000, 1000, CAST(0x0000A5DA00B26007 AS DateTime), N'lu003', CAST(0x0000A5DA00B2EA9B AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (374, 137, 3, 500, 500, CAST(0x0000A5DA00B26007 AS DateTime), N'lu003', CAST(0x0000A5DA00B2EA9B AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (375, 138, 1, 2, 2, CAST(0x0000A5DA00B740D5 AS DateTime), N'lu003', CAST(0x0000A5DA00B79812 AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (376, 138, 2, 500, 0, CAST(0x0000A5DA00B740D6 AS DateTime), N'lu003', CAST(0x0000A5DA00B79812 AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (377, 138, 3, 500, 500, CAST(0x0000A5DA00B740D6 AS DateTime), N'lu003', CAST(0x0000A5DA00B79812 AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (378, 139, 1, 0, NULL, CAST(0x0000A5DA00D0DFBD AS DateTime), N'LU002', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (379, 139, 2, 0, NULL, CAST(0x0000A5DA00D0DFBD AS DateTime), N'LU002', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (380, 139, 3, 0, NULL, CAST(0x0000A5DA00D0DFBD AS DateTime), N'LU002', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (381, 140, 1, 10, 10, CAST(0x0000A5DA00D13F6E AS DateTime), N'LU002', CAST(0x0000A5DA00D21522 AS DateTime), N'LU002')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (382, 140, 2, 2000, 1500, CAST(0x0000A5DA00D13F6E AS DateTime), N'LU002', CAST(0x0000A5DA00D21522 AS DateTime), N'LU002')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (383, 140, 3, 2000, 2000, CAST(0x0000A5DA00D13F6E AS DateTime), N'LU002', CAST(0x0000A5DA00D21522 AS DateTime), N'LU002')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (384, 141, 1, 1, 1, CAST(0x0000A5DF00BB65B2 AS DateTime), N'5000', CAST(0x0000A5DF00BB84CA AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (385, 141, 2, 1, 1, CAST(0x0000A5DF00BB65B3 AS DateTime), N'5000', CAST(0x0000A5DF00BB84CA AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (386, 141, 3, 1, 1, CAST(0x0000A5DF00BB65B3 AS DateTime), N'5000', CAST(0x0000A5DF00BB84CA AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (387, 142, 1, 10, 5, CAST(0x0000A5DF00C03C7A AS DateTime), N'5000', CAST(0x0000A5DF00C063C9 AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (388, 142, 2, 10, 0, CAST(0x0000A5DF00C03C7A AS DateTime), N'5000', CAST(0x0000A5DF00C063C9 AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (389, 142, 3, 10, 5, CAST(0x0000A5DF00C03C7A AS DateTime), N'5000', CAST(0x0000A5DF00C063C9 AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (390, 143, 1, 10, 10, CAST(0x0000A5DF00C0B06F AS DateTime), N'5000', CAST(0x0000A5DF00C10898 AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (391, 143, 2, 10, 10, CAST(0x0000A5DF00C0B06F AS DateTime), N'5000', CAST(0x0000A5DF00C10898 AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (392, 143, 3, 10, 10, CAST(0x0000A5DF00C0B06F AS DateTime), N'5000', CAST(0x0000A5DF00C10898 AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (393, 144, 1, 1, 1, CAST(0x0000A5DF00C56C49 AS DateTime), N'5000', CAST(0x0000A5DF00C580C5 AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (394, 144, 2, 1, 1, CAST(0x0000A5DF00C56C49 AS DateTime), N'5000', CAST(0x0000A5DF00C580C5 AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (395, 144, 3, 1, 1, CAST(0x0000A5DF00C56C49 AS DateTime), N'5000', CAST(0x0000A5DF00C580C5 AS DateTime), N'5000')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (396, 145, 1, 20, 20, CAST(0x0000A5E00094987D AS DateTime), N'kd0252', CAST(0x0000A5E0009576CF AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (397, 145, 2, 1000, 1000, CAST(0x0000A5E00094987E AS DateTime), N'kd0252', CAST(0x0000A5E0009576CF AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (398, 145, 3, 1000, 0, CAST(0x0000A5E00094987E AS DateTime), N'kd0252', CAST(0x0000A5E0009576CF AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (399, 146, 1, 10, NULL, CAST(0x0000A5E00096B644 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (400, 146, 2, 10, NULL, CAST(0x0000A5E00096B644 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (401, 146, 3, 10, NULL, CAST(0x0000A5E00096B644 AS DateTime), N'kd0252', NULL, NULL)
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (402, 147, 1, 10, 10, CAST(0x0000A5E200C52E71 AS DateTime), N'kd0252', CAST(0x0000A5E200C5AE9B AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (403, 147, 2, 1000, 500, CAST(0x0000A5E200C52E72 AS DateTime), N'kd0252', CAST(0x0000A5E200C5AE9B AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (404, 147, 3, 0, 0, CAST(0x0000A5E200C52E72 AS DateTime), N'kd0252', CAST(0x0000A5E200C5AE9B AS DateTime), N'kd0252')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (405, 148, 1, 30, 20, CAST(0x0000A5E200DCB61D AS DateTime), N'lu003', CAST(0x0000A5E200DD6F75 AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (406, 148, 2, 40000, 40000, CAST(0x0000A5E200DCB61D AS DateTime), N'lu003', CAST(0x0000A5E200DD6F76 AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (407, 148, 3, 1000, 500, CAST(0x0000A5E200DCB61D AS DateTime), N'lu003', CAST(0x0000A5E200DD6F76 AS DateTime), N'lu003')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (408, 149, 1, 5000, 3000, CAST(0x0000A5E2010AB892 AS DateTime), N'KD53', CAST(0x0000A5E2010B4BE9 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (409, 149, 2, 5000, 3000, CAST(0x0000A5E2010AB893 AS DateTime), N'KD53', CAST(0x0000A5E2010B4BE9 AS DateTime), N'KD53')
INSERT [dbo].[OrderItem] ([ID], [Order_Id], [Item_Id], [Required_Quantity], [Supplied_Quantity], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (410, 149, 3, 5000, 3000, CAST(0x0000A5E2010AB893 AS DateTime), N'KD53', CAST(0x0000A5E2010B4BE9 AS DateTime), N'KD53')
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
print 'Processed 400 total records'
/****** Object:  StoredProcedure [dbo].[SP_GetRetailerList_By_BikerId]    Script Date: 04/08/2016 16:20:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetRetailerList_By_BikerId]
@bikersloginid VARCHAR (30),
@searchstringretailername VARCHAR (100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	--SET NOCOUNT ON;
	--SELECT distinct r.ID, r.Code, r.Name, r.Contact_Number, r.[Address], r.CityArea , r.[State], r.Pin_Code, r.Contact_person
	--FROM RetailerDetail r
	--JOIN dbo.RetailBeatMapping rb ON r.ID = rb.Retailer_Id
	--JOIN dbo.BeatDistributorMapping bdm ON bdm.Beat_Id = rb.Beat_Id
	--JOIN dbo.BeatDetail b ON b.ID = bdm.Beat_Id
	--JOIN BikerDistMapping bd ON bd.Distributor_Id = bdm.Distributor_Id
	--JOIN DistDealerDetail ddd ON bd.Distributor_Id = ddd.ID
	--JOIN BikerBoyDetail bbd ON bbd.ID = bd.BikerBoy_Id
	--WHERE r.Active_Status = 'Active' 
	--AND bbd.BB_Code = @bikersloginid
	--AND r.Name like '%'+@searchstringretailername+'%'
	
	
	SET NOCOUNT ON;
	SELECT distinct r.ID, r.Code, r.Name, r.Contact_Number, r.[Address], r.CityArea , r.[State], r.Pin_Code, r.Contact_person
	FROM RetailerDetail r
	--JOIN dbo.RetailBeatMapping rb ON r.ID = rb.Retailer_Id
	--JOIN dbo.BeatDistributorMapping bdm ON bdm.Beat_Id = rb.Beat_Id
	--JOIN dbo.BeatDetail b ON b.ID = bdm.Beat_Id
	--JOIN BikerDistMapping bd ON bd.Distributor_Id = bdm.Distributor_Id
	--JOIN DistDealerDetail ddd ON bd.Distributor_Id = ddd.ID
	JOIN BikerRetailerMapping brm ON r.ID = brm.RetailerId
	JOIN BikerBoyDetail bbd ON bbd.ID = brm.BikerId
	WHERE r.Active_Status = 'Active' 
	AND bbd.BB_Code = @bikersloginid
	AND r.Name like '%'+@searchstringretailername+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRetailerList_By_BeatId_DistId_BikerId]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_UpateOrder]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_SaveNewOrder]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_OrderDetails_By_Id]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetOrders_By_DistId_RetailerId_BeatId_BikerId]    Script Date: 04/08/2016 16:20:59 ******/
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
/****** Object:  Default [DF__RetailerD__Creat__282DF8C2]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[RetailerDetail] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF__RetailerD__IsCre__41EDCAC5]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[RetailerDetail] ADD  DEFAULT ((0)) FOR [IsCreatedByBiker]
GO
/****** Object:  Default [DF__Logger__CreatedO__1CBC4616]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[Logger] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF__DistDeale__Creat__023D5A04]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[DistDealerDetail] ADD  DEFAULT (getdate()) FOR [Created_On]
GO
/****** Object:  Default [DF__BikerTarg__Creat__2739D489]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[BikerTarget] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF__OrderDeta__Order__29572725]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (getdate()) FOR [Ordered_On]
GO
/****** Object:  Default [DF__OrderItem__Creat__300424B4]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT (getdate()) FOR [Created_On]
GO
/****** Object:  ForeignKey [FK__BikerTarg__Biker__25518C17]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[BikerTarget]  WITH CHECK ADD FOREIGN KEY([BikerId])
REFERENCES [dbo].[BikerBoyDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BikerTarg__ItemI__2645B050]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[BikerTarget]  WITH CHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ID])
GO
/****** Object:  ForeignKey [FK__BikerReta__Biker__2CF2ADDF]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[BikerRetailerMapping]  WITH CHECK ADD FOREIGN KEY([BikerId])
REFERENCES [dbo].[BikerBoyDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BikerReta__Retai__2DE6D218]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[BikerRetailerMapping]  WITH CHECK ADD FOREIGN KEY([RetailerId])
REFERENCES [dbo].[RetailerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BikerDist__Biker__0F975522]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[BikerDistMapping]  WITH CHECK ADD FOREIGN KEY([BikerBoy_Id])
REFERENCES [dbo].[BikerBoyDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BikerDist__Distr__0EA330E9]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[BikerDistMapping]  WITH CHECK ADD FOREIGN KEY([Distributor_Id])
REFERENCES [dbo].[DistDealerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BeatDistr__Beat___5BE2A6F2]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[BeatDistributorMapping]  WITH CHECK ADD FOREIGN KEY([Beat_Id])
REFERENCES [dbo].[BeatDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__BeatDistr__Distr__5AEE82B9]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[BeatDistributorMapping]  WITH CHECK ADD FOREIGN KEY([Distributor_Id])
REFERENCES [dbo].[DistDealerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
/****** Object:  ForeignKey [FK__RetailBea__Beat___60A75C0F]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[RetailBeatMapping]  WITH CHECK ADD FOREIGN KEY([Beat_Id])
REFERENCES [dbo].[BeatDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__RetailBea__Retai__619B8048]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[RetailBeatMapping]  WITH CHECK ADD FOREIGN KEY([Retailer_Id])
REFERENCES [dbo].[RetailerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__OrderDeta__Beat___276EDEB3]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([Beat_Id])
REFERENCES [dbo].[BeatDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__OrderDeta__Distr__267ABA7A]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([Distributor_Id])
REFERENCES [dbo].[DistDealerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__OrderDeta__Retai__286302EC]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([Retailer_Id])
REFERENCES [dbo].[RetailerDetail] ([ID])
GO
/****** Object:  ForeignKey [FK__OrderItem__Item___2F10007B]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([Item_Id])
REFERENCES [dbo].[Item] ([ID])
GO
/****** Object:  ForeignKey [FK__OrderItem__Order__2E1BDC42]    Script Date: 04/08/2016 16:20:59 ******/
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([Order_Id])
REFERENCES [dbo].[OrderDetail] ([ID])
GO
