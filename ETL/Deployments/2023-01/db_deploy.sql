USE [EMBC]
GO
alter table admaudit
alter column PackageName Varchar(100);
go
alter table admloadcontrol
alter column PackageName Varchar(100);
go

/****** Object:  Schema [era_stage]    Script Date: 1/17/2023 11:15:00 PM ******/
CREATE SCHEMA [era_stage]
GO
/****** Object:  Table [era_stage].[era_animal]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_animal](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_animalid] [uniqueidentifier] NOT NULL,
	[era_essfileid] [uniqueidentifier] NULL,
	[era_essfileidname] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_numberofpets] [int] NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_animal] PRIMARY KEY CLUSTERED 
(
	[era_animalid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_castest]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_castest](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_castestid] [uniqueidentifier] NOT NULL,
	[era_name] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_castest] PRIMARY KEY CLUSTERED 
(
	[era_castestid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_country]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_country](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_countrycode] [nvarchar](10) NULL,
	[era_countryid] [uniqueidentifier] NOT NULL,
	[era_isocountrycode] [nvarchar](20) NULL,
	[era_name] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_country] PRIMARY KEY CLUSTERED 
(
	[era_countryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_customautonumberdefinition]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_customautonumberdefinition](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_customautonumberdefinitionid] [uniqueidentifier] NOT NULL,
	[era_digits] [int] NULL,
	[era_format] [nvarchar](100) NULL,
	[era_lastnumberissued] [int] NULL,
	[era_locktimestamp] [datetime] NULL,
	[era_lockvalue] [nvarchar](100) NULL,
	[era_lockverification] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[organizationid] [uniqueidentifier] NULL,
	[organizationidname] [nvarchar](160) NULL,
	[overriddencreatedon] [datetime] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_customautonumberdefinition] PRIMARY KEY CLUSTERED 
(
	[era_customautonumberdefinitionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_customautonumberrequest]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_customautonumberrequest](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_customautonumberrequestid] [uniqueidentifier] NOT NULL,
	[era_formattednumber] [nvarchar](100) NULL,
	[era_integernumber] [int] NULL,
	[era_lockvalue] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_number] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[organizationid] [uniqueidentifier] NULL,
	[organizationidname] [nvarchar](160) NULL,
	[overriddencreatedon] [datetime] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_customautonumberrequest] PRIMARY KEY CLUSTERED 
(
	[era_customautonumberrequestid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_embcregion]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_embcregion](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_callsign] [nvarchar](100) NULL,
	[era_code] [nvarchar](100) NULL,
	[era_embcregionid] [uniqueidentifier] NOT NULL,
	[era_location] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[organizationid] [uniqueidentifier] NULL,
	[organizationidname] [nvarchar](160) NULL,
	[overriddencreatedon] [datetime] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_embcregion] PRIMARY KEY CLUSTERED 
(
	[era_embcregionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_era_etransfertransaction_era_evacueesup]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_era_etransfertransaction_era_evacueesup](
	[era_era_etransfertransaction_era_evacueesupid] [uniqueidentifier] NOT NULL,
	[era_etransfertransactionid] [uniqueidentifier] NULL,
	[era_evacueesupportid] [uniqueidentifier] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_era_etransfertransaction_era_evacueesup] PRIMARY KEY CLUSTERED 
(
	[era_era_etransfertransaction_era_evacueesupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_era_evacueesupport_era_etransfertransac]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_era_evacueesupport_era_etransfertransac](
	[era_era_evacueesupport_era_etransfertransacid] [uniqueidentifier] NOT NULL,
	[era_etransfertransactionid] [uniqueidentifier] NULL,
	[era_evacueesupportid] [uniqueidentifier] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_era_evacueesupport_era_etransfertransac] PRIMARY KEY CLUSTERED 
(
	[era_era_evacueesupport_era_etransfertransacid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_era_householdmember_era_evacueesupport]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_era_householdmember_era_evacueesupport](
	[era_era_householdmember_era_evacueesupportid] [uniqueidentifier] NOT NULL,
	[era_evacueesupportid] [uniqueidentifier] NULL,
	[era_householdmemberid] [uniqueidentifier] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_era_householdmember_era_evacueesupport] PRIMARY KEY CLUSTERED 
(
	[era_era_householdmember_era_evacueesupportid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_era_householdmember_era_needassessment]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_era_householdmember_era_needassessment](
	[era_era_householdmember_era_needassessmentid] [uniqueidentifier] NOT NULL,
	[era_householdmemberid] [uniqueidentifier] NULL,
	[era_needassessmentid] [uniqueidentifier] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_era_householdmember_era_needassessment] PRIMARY KEY CLUSTERED 
(
	[era_era_householdmember_era_needassessmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_era_referralprint_era_evacueesupport]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_era_referralprint_era_evacueesupport](
	[era_era_referralprint_era_evacueesupportid] [uniqueidentifier] NOT NULL,
	[era_evacueesupportid] [uniqueidentifier] NULL,
	[era_referralprintid] [uniqueidentifier] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_era_referralprint_era_evacueesupport] PRIMARY KEY CLUSTERED 
(
	[era_era_referralprint_era_evacueesupportid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_essevacueeetransfersupport]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_essevacueeetransfersupport](
	[activestageid] [uniqueidentifier] NULL,
	[activestageidname] [nvarchar](100) NULL,
	[activestagestartedon] [datetime] NULL,
	[bpf_duration] [int] NULL,
	[bpf_era_evacueesupportid] [uniqueidentifier] NOT NULL,
	[bpf_era_evacueesupportidname] [nvarchar](100) NULL,
	[bpf_name] [nvarchar](100) NULL,
	[businessprocessflowinstanceid] [uniqueidentifier] NULL,
	[completedon] [datetime] NULL,
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[organizationid] [uniqueidentifier] NULL,
	[organizationidname] [nvarchar](160) NULL,
	[overriddencreatedon] [datetime] NULL,
	[processid] [uniqueidentifier] NULL,
	[processidname] [nvarchar](100) NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[traversedpath] [nvarchar](1250) NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_essevacueeetransfersupport] PRIMARY KEY CLUSTERED 
(
	[bpf_era_evacueesupportid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_essfilenote]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_essfilenote](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_essfileid] [uniqueidentifier] NULL,
	[era_essfileidname] [nvarchar](100) NULL,
	[era_essfilenoteid] [uniqueidentifier] NOT NULL,
	[era_essteamuserid] [uniqueidentifier] NULL,
	[era_essteamuseridname] [nvarchar](100) NULL,
	[era_ishidden] [bit] NULL,
	[era_ishiddenname] [nvarchar](255) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_notetext] [ntext] NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_essfilenote] PRIMARY KEY CLUSTERED 
(
	[era_essfilenoteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_esssupportrate]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_esssupportrate](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_esssupportrateid] [uniqueidentifier] NOT NULL,
	[era_name] [nvarchar](100) NULL,
	[era_ratevalue] [numeric](38, 4) NULL,
	[era_ratevalue_base] [numeric](38, 4) NULL,
	[era_supporttypeid] [uniqueidentifier] NULL,
	[era_supporttypeidname] [nvarchar](100) NULL,
	[exchangerate] [numeric](38, 10) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[organizationid] [uniqueidentifier] NULL,
	[organizationidname] [nvarchar](160) NULL,
	[overriddencreatedon] [datetime] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[transactioncurrencyid] [uniqueidentifier] NULL,
	[transactioncurrencyidname] [nvarchar](100) NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_esssupportrate] PRIMARY KEY CLUSTERED 
(
	[era_esssupportrateid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_esstaskchangerequest]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_esstaskchangerequest](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_esstask] [uniqueidentifier] NULL,
	[era_esstaskchangerequestid] [uniqueidentifier] NOT NULL,
	[era_esstaskname] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_neweventsummary] [nvarchar](40) NULL,
	[era_newprojectnumber] [nvarchar](7) NULL,
	[era_newresponsiblecenter] [nvarchar](5) NULL,
	[era_newserviceline] [nvarchar](5) NULL,
	[era_newstob] [nvarchar](4) NULL,
	[era_supplierinvoice] [uniqueidentifier] NULL,
	[era_supplierinvoicename] [nvarchar](100) NULL,
	[era_updateesstask] [bit] NULL,
	[era_updateesstaskname] [nvarchar](255) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_esstaskchangerequest] PRIMARY KEY CLUSTERED 
(
	[era_esstaskchangerequestid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_essteam]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_essteam](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_essteamid] [uniqueidentifier] NOT NULL,
	[era_name] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_essteam] PRIMARY KEY CLUSTERED 
(
	[era_essteamid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_essteamarea]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_essteamarea](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_essteamareaid] [uniqueidentifier] NOT NULL,
	[era_essteamid] [uniqueidentifier] NULL,
	[era_essteamidname] [nvarchar](100) NULL,
	[era_jurisdictionid] [uniqueidentifier] NULL,
	[era_jurisdictionidname] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_essteamarea] PRIMARY KEY CLUSTERED 
(
	[era_essteamareaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_essteamsupplier]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_essteamsupplier](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_active] [bit] NULL,
	[era_activename] [nvarchar](255) NULL,
	[era_essteamid] [uniqueidentifier] NULL,
	[era_essteamidname] [nvarchar](100) NULL,
	[era_essteamsupplierid] [uniqueidentifier] NOT NULL,
	[era_isprimarysupplier] [bit] NULL,
	[era_isprimarysuppliername] [nvarchar](255) NULL,
	[era_name] [nvarchar](200) NULL,
	[era_sharingteam] [uniqueidentifier] NULL,
	[era_sharingteamname] [nvarchar](100) NULL,
	[era_supplierid] [uniqueidentifier] NULL,
	[era_supplieridname] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_essteamsupplier] PRIMARY KEY CLUSTERED 
(
	[era_essteamsupplierid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_essteamuser]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_essteamuser](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_electronicaccessagreementaccepteddate] [date] NULL,
	[era_email] [nvarchar](150) NULL,
	[era_essteamid] [uniqueidentifier] NULL,
	[era_essteamidname] [nvarchar](100) NULL,
	[era_essteamuserid] [uniqueidentifier] NOT NULL,
	[era_externalsystemtype] [int] NULL,
	[era_externalsystemtypename] [nvarchar](255) NULL,
	[era_externalsystemuser] [nvarchar](100) NULL,
	[era_externalsystemusername] [nvarchar](100) NULL,
	[era_firstname] [nvarchar](150) NULL,
	[era_label] [int] NULL,
	[era_labelname] [nvarchar](255) NULL,
	[era_lastname] [nvarchar](150) NULL,
	[era_lastsuccessfullogin] [datetime] NULL,
	[era_name] [nvarchar](100) NULL,
	[era_phone] [nvarchar](100) NULL,
	[era_role] [int] NULL,
	[era_rolename] [nvarchar](255) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_essteamuser] PRIMARY KEY CLUSTERED 
(
	[era_essteamuserid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_etransfertransaction]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_etransfertransaction](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_casreferencenumber] [nvarchar](100) NULL,
	[era_casresponsedate] [datetime] NULL,
	[era_countrycode] [nvarchar](5) NULL,
	[era_dateinvoicereceived] [datetime] NULL,
	[era_emailaddress] [nvarchar](100) NULL,
	[era_etransfertransactionid] [uniqueidentifier] NOT NULL,
	[era_firstname] [nvarchar](100) NULL,
	[era_gldate] [datetime] NULL,
	[era_invoicebatchname] [nvarchar](50) NULL,
	[era_invoicedate] [datetime] NULL,
	[era_lastname] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_payee] [uniqueidentifier] NULL,
	[era_payeeidtype] [nvarchar](64) NULL,
	[era_payeename] [nvarchar](4000) NULL,
	[era_payeeyominame] [nvarchar](4000) NULL,
	[era_phonenumber] [nvarchar](50) NULL,
	[era_processingresponse] [ntext] NULL,
	[era_queueprocessingstatus] [int] NULL,
	[era_queueprocessingstatusname] [nvarchar](255) NULL,
	[era_queuetransitiondate] [datetime] NULL,
	[era_securityanswer] [nvarchar](250) NULL,
	[era_securityquestion] [nvarchar](250) NULL,
	[era_sitesuppliernumber] [nvarchar](15) NULL,
	[era_suppliernumber] [nvarchar](30) NULL,
	[era_totalamount] [numeric](38, 4) NULL,
	[era_totalamount_base] [numeric](38, 4) NULL,
	[exchangerate] [numeric](38, 10) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[transactioncurrencyid] [uniqueidentifier] NULL,
	[transactioncurrencyidname] [nvarchar](100) NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_etransfertransaction] PRIMARY KEY CLUSTERED 
(
	[era_etransfertransactionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_evacuationfile]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_evacuationfile](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_currentneedsassessmentid] [uniqueidentifier] NULL,
	[era_currentneedsassessmentidname] [nvarchar](100) NULL,
	[era_dayssincecreated] [int] NULL,
	[era_essfilestatus] [int] NULL,
	[era_essfilestatusname] [nvarchar](255) NULL,
	[era_evacuatedfromid] [uniqueidentifier] NULL,
	[era_evacuatedfromidname] [nvarchar](100) NULL,
	[era_evacuationfiledate] [datetime] NULL,
	[era_evacuationfileid] [uniqueidentifier] NOT NULL,
	[era_haspetfood] [int] NULL,
	[era_haspetfoodname] [nvarchar](255) NULL,
	[era_hasrestriction] [int] NULL,
	[era_hasrestriction_date] [datetime] NULL,
	[era_hasrestriction_state] [int] NULL,
	[era_interviewername] [nvarchar](101) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_numberofassessments] [int] NULL,
	[era_numberofassessments_date] [datetime] NULL,
	[era_numberofassessments_state] [int] NULL,
	[era_paperbasedessfile] [nvarchar](100) NULL,
	[era_petcareplans] [ntext] NULL,
	[era_registrant] [uniqueidentifier] NULL,
	[era_registrantname] [nvarchar](160) NULL,
	[era_registrantyominame] [nvarchar](450) NULL,
	[era_registrationcomplete] [bit] NULL,
	[era_registrationcompleteddate] [datetime] NULL,
	[era_registrationcompletename] [nvarchar](255) NULL,
	[era_securityphrase] [nvarchar](50) NULL,
	[era_selfregistrationdate] [datetime] NULL,
	[era_supportprovided] [int] NULL,
	[era_supportstotalamountsummary] [numeric](38, 4) NULL,
	[era_supportstotalamountsummary_base] [numeric](38, 4) NULL,
	[era_taskid] [uniqueidentifier] NULL,
	[era_taskidname] [nvarchar](100) NULL,
	[era_totalhouseholdanimals] [int] NULL,
	[era_totalhouseholdanimals_date] [datetime] NULL,
	[era_totalhouseholdanimals_state] [int] NULL,
	[exchangerate] [numeric](38, 10) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[transactioncurrencyid] [uniqueidentifier] NULL,
	[transactioncurrencyidname] [nvarchar](100) NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_evacuationfile] PRIMARY KEY CLUSTERED 
(
	[era_evacuationfileid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_evacueeemailinvite]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_evacueeemailinvite](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_emailaddress] [nvarchar](100) NULL,
	[era_essteamuser] [uniqueidentifier] NULL,
	[era_essteamusername] [nvarchar](100) NULL,
	[era_evacueeemailinviteid] [uniqueidentifier] NOT NULL,
	[era_expirydate] [datetime] NULL,
	[era_name] [nvarchar](100) NULL,
	[era_registrant] [uniqueidentifier] NULL,
	[era_registrantname] [nvarchar](160) NULL,
	[era_registrantyominame] [nvarchar](450) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_evacueeemailinvite] PRIMARY KEY CLUSTERED 
(
	[era_evacueeemailinviteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_evacueesupport]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_evacueesupport](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_amountoverride] [bit] NULL,
	[era_amountoverridename] [nvarchar](255) NULL,
	[era_approveditems] [ntext] NULL,
	[era_autonumber] [nvarchar](100) NULL,
	[era_billetinglodgingcity] [nvarchar](100) NULL,
	[era_etransferapproved] [int] NULL,
	[era_etransferapprovedname] [nvarchar](255) NULL,
	[era_etransfertransactioncreated] [bit] NULL,
	[era_etransfertransactioncreatedname] [nvarchar](255) NULL,
	[era_evacuationfileid] [uniqueidentifier] NULL,
	[era_evacuationfileidname] [nvarchar](100) NULL,
	[era_evacueesupportid] [uniqueidentifier] NOT NULL,
	[era_expenseauthoritycomments] [ntext] NULL,
	[era_extremewinterconditions] [int] NULL,
	[era_extremewinterconditionsname] [nvarchar](255) NULL,
	[era_fromaddress] [nvarchar](50) NULL,
	[era_grouplodgingcityid] [uniqueidentifier] NULL,
	[era_grouplodgingcityidname] [nvarchar](100) NULL,
	[era_internalqualifiedreceiver] [uniqueidentifier] NULL,
	[era_internalqualifiedreceivername] [nvarchar](200) NULL,
	[era_internalqualifiedreceiveryominame] [nvarchar](200) NULL,
	[era_issuedbyid] [uniqueidentifier] NULL,
	[era_issuedbyidname] [nvarchar](100) NULL,
	[era_lastcontactattempt] [datetime] NULL,
	[era_lodgingaddress] [nvarchar](255) NULL,
	[era_lodgingcity] [nvarchar](100) NULL,
	[era_lodgingcontactnumber] [nvarchar](15) NULL,
	[era_lodgingemailaddress] [nvarchar](100) NULL,
	[era_lodgingname] [nvarchar](100) NULL,
	[era_manualsupport] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_needsassessmentid] [uniqueidentifier] NULL,
	[era_needsassessmentidname] [nvarchar](100) NULL,
	[era_notificationemailaddress] [nvarchar](100) NULL,
	[era_notificationphonenumber] [nvarchar](50) NULL,
	[era_numberofbreakfasts] [int] NULL,
	[era_numberofdays] [int] NULL,
	[era_numberofdinners] [int] NULL,
	[era_numberofevacueesforsupport] [int] NULL,
	[era_numberoflunches] [int] NULL,
	[era_numberofmeals] [int] NULL,
	[era_numberofnights] [int] NULL,
	[era_numberofrooms] [int] NULL,
	[era_paperissuedby] [nvarchar](100) NULL,
	[era_paperreferralcompletedon] [datetime] NULL,
	[era_payeeid] [uniqueidentifier] NULL,
	[era_payeeidname] [nvarchar](160) NULL,
	[era_payeeidyominame] [nvarchar](450) NULL,
	[era_previousstatus] [nvarchar](100) NULL,
	[era_purchaserofgoods] [nvarchar](255) NULL,
	[era_qualifiedreceivercomments] [ntext] NULL,
	[era_queueprocessingstatus] [int] NULL,
	[era_queueprocessingstatusname] [nvarchar](255) NULL,
	[era_queuetransitiondate] [datetime] NULL,
	[era_supplierid] [uniqueidentifier] NULL,
	[era_supplieridname] [nvarchar](100) NULL,
	[era_suppliernote] [ntext] NULL,
	[era_supportdeliverytype] [int] NULL,
	[era_supportdeliverytypename] [nvarchar](255) NULL,
	[era_supportoverrideauthority] [nvarchar](250) NULL,
	[era_supporttype] [int] NULL,
	[era_supporttypename] [nvarchar](255) NULL,
	[era_toaddress] [nvarchar](50) NULL,
	[era_totalamount] [numeric](38, 2) NULL,
	[era_totalamount_base] [numeric](38, 2) NULL,
	[era_transportmode] [nvarchar](50) NULL,
	[era_validfrom] [datetime] NULL,
	[era_validto] [datetime] NULL,
	[era_voidreason] [int] NULL,
	[era_voidreasonname] [nvarchar](255) NULL,
	[exchangerate] [numeric](38, 10) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[processid] [uniqueidentifier] NULL,
	[stageid] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[transactioncurrencyid] [uniqueidentifier] NULL,
	[transactioncurrencyidname] [nvarchar](100) NULL,
	[traversedpath] [nvarchar](1250) NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_evacueesupport] PRIMARY KEY CLUSTERED 
(
	[era_evacueesupportid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_householdmember]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_householdmember](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_dateofbirth] [date] NULL,
	[era_evacuationfileid] [uniqueidentifier] NULL,
	[era_evacuationfileidname] [nvarchar](100) NULL,
	[era_firstname] [nvarchar](100) NULL,
	[era_gender] [int] NULL,
	[era_gendername] [nvarchar](255) NULL,
	[era_householdmemberid] [uniqueidentifier] NOT NULL,
	[era_initials] [nvarchar](50) NULL,
	[era_isprimaryregistrant] [bit] NULL,
	[era_isprimaryregistrantname] [nvarchar](255) NULL,
	[era_isunder19] [bit] NULL,
	[era_isunder19name] [nvarchar](255) NULL,
	[era_lastname] [nvarchar](100) NULL,
	[era_name] [nvarchar](200) NULL,
	[era_registrant] [uniqueidentifier] NULL,
	[era_registrantname] [nvarchar](160) NULL,
	[era_registrantrestricted] [bit] NULL,
	[era_registrantrestrictedname] [nvarchar](255) NULL,
	[era_registrantyominame] [nvarchar](450) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_householdmember] PRIMARY KEY CLUSTERED 
(
	[era_householdmemberid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_jurisdiction]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_jurisdiction](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_essteamid] [uniqueidentifier] NULL,
	[era_essteamidname] [nvarchar](100) NULL,
	[era_jurisdictionid] [uniqueidentifier] NOT NULL,
	[era_jurisdictionname] [nvarchar](100) NULL,
	[era_regionaldistrict] [uniqueidentifier] NULL,
	[era_regionaldistrictname] [nvarchar](100) NULL,
	[era_relatedprovincestate] [uniqueidentifier] NULL,
	[era_relatedprovincestatename] [nvarchar](100) NULL,
	[era_type] [int] NULL,
	[era_typename] [nvarchar](255) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_jurisdiction] PRIMARY KEY CLUSTERED 
(
	[era_jurisdictionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_needassessment]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_needassessment](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_addressline1] [nvarchar](100) NULL,
	[era_addressline2] [nvarchar](100) NULL,
	[era_canevacueeprovideclothing] [int] NULL,
	[era_canevacueeprovideclothingname] [nvarchar](255) NULL,
	[era_canevacueeprovidefood] [int] NULL,
	[era_canevacueeprovidefoodname] [nvarchar](255) NULL,
	[era_canevacueeprovideincidentals] [int] NULL,
	[era_canevacueeprovideincidentalsname] [nvarchar](255) NULL,
	[era_canevacueeprovidelodging] [int] NULL,
	[era_canevacueeprovidelodgingname] [nvarchar](255) NULL,
	[era_canevacueeprovidetransportation] [int] NULL,
	[era_canevacueeprovidetransportationname] [nvarchar](255) NULL,
	[era_dietaryrequirement] [bit] NULL,
	[era_dietaryrequirementdetails] [ntext] NULL,
	[era_dietaryrequirementname] [nvarchar](255) NULL,
	[era_evacuationfile] [uniqueidentifier] NULL,
	[era_evacuationfilename] [nvarchar](100) NULL,
	[era_evacuationimpacttohousehold] [ntext] NULL,
	[era_externalreferralsdetails] [ntext] NULL,
	[era_haschildcarereferral] [bit] NULL,
	[era_haschildcarereferralname] [nvarchar](255) NULL,
	[era_hasenoughsupply] [bit] NULL,
	[era_hasenoughsupplyname] [nvarchar](255) NULL,
	[era_hasfirstaidreferral] [bit] NULL,
	[era_hasfirstaidreferralname] [nvarchar](255) NULL,
	[era_hashealthservicesreferral] [bit] NULL,
	[era_hashealthservicesreferralname] [nvarchar](255) NULL,
	[era_hasinquiryreferral] [bit] NULL,
	[era_hasinquiryreferralname] [nvarchar](255) NULL,
	[era_haspersonalservicesreferral] [bit] NULL,
	[era_haspersonalservicesreferralname] [nvarchar](255) NULL,
	[era_haspetcarereferral] [bit] NULL,
	[era_haspetcarereferralname] [nvarchar](255) NULL,
	[era_householdrecoveryplan] [ntext] NULL,
	[era_insurancecoverage] [int] NULL,
	[era_insurancecoveragename] [nvarchar](255) NULL,
	[era_jurisdictionid] [uniqueidentifier] NULL,
	[era_jurisdictionidname] [nvarchar](100) NULL,
	[era_medicationrequirement] [bit] NULL,
	[era_medicationrequirementname] [nvarchar](255) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_needassessmentid] [uniqueidentifier] NOT NULL,
	[era_needsassessmenttype] [int] NULL,
	[era_needsassessmenttypename] [nvarchar](255) NULL,
	[era_payeeid] [uniqueidentifier] NULL,
	[era_payeeidname] [nvarchar](160) NULL,
	[era_payeeidyominame] [nvarchar](450) NULL,
	[era_postalcode] [nvarchar](20) NULL,
	[era_registrationlocation] [nvarchar](100) NULL,
	[era_reviewedbyid] [uniqueidentifier] NULL,
	[era_reviewedbyidname] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_needassessment] PRIMARY KEY CLUSTERED 
(
	[era_needassessmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_portalbanner]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_portalbanner](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_content] [ntext] NULL,
	[era_enddisplaydate] [datetime] NULL,
	[era_name] [nvarchar](100) NULL,
	[era_outagestartdate] [datetime] NULL,
	[era_portal] [int] NULL,
	[era_portalbannerid] [uniqueidentifier] NOT NULL,
	[era_portalname] [nvarchar](255) NULL,
	[era_startdisplaydate] [datetime] NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_portalbanner] PRIMARY KEY CLUSTERED 
(
	[era_portalbannerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_provinceterritories]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_provinceterritories](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_code] [nvarchar](10) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_provinceterritoriesid] [uniqueidentifier] NOT NULL,
	[era_relatedcountry] [uniqueidentifier] NULL,
	[era_relatedcountryname] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_provinceterritories] PRIMARY KEY CLUSTERED 
(
	[era_provinceterritoriesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_referral]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_referral](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_approvedtotalamount] [numeric](38, 4) NULL,
	[era_approvedtotalamount_base] [numeric](38, 4) NULL,
	[era_invoicereference] [nvarchar](100) NULL,
	[era_partiallyapproved] [bit] NULL,
	[era_partiallyapprovedname] [nvarchar](255) NULL,
	[era_referralid] [uniqueidentifier] NOT NULL,
	[era_referralnumber] [nvarchar](100) NULL,
	[era_relatedsupplierinvoice] [uniqueidentifier] NULL,
	[era_relatedsupplierinvoicename] [nvarchar](100) NULL,
	[era_submissionreference] [nvarchar](100) NULL,
	[era_tasknumber] [nvarchar](100) NULL,
	[era_totalamount] [numeric](38, 4) NULL,
	[era_totalamount_base] [numeric](38, 4) NULL,
	[era_totalgst] [numeric](38, 2) NULL,
	[era_totalgst_base] [numeric](38, 2) NULL,
	[exchangerate] [numeric](38, 10) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[transactioncurrencyid] [uniqueidentifier] NULL,
	[transactioncurrencyidname] [nvarchar](100) NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_referral] PRIMARY KEY CLUSTERED 
(
	[era_referralid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_referralprint]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_referralprint](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_essfileid] [uniqueidentifier] NULL,
	[era_essfileidname] [nvarchar](100) NULL,
	[era_includedsummary] [bit] NULL,
	[era_includedsummaryname] [nvarchar](255) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_referralprintid] [uniqueidentifier] NOT NULL,
	[era_reprintreason] [nvarchar](100) NULL,
	[era_requestinguserid] [uniqueidentifier] NULL,
	[era_requestinguseridname] [nvarchar](100) NULL,
	[era_type] [int] NULL,
	[era_typename] [nvarchar](255) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_referralprint] PRIMARY KEY CLUSTERED 
(
	[era_referralprintid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_regionaldistrict]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_regionaldistrict](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_districtname] [nvarchar](100) NULL,
	[era_embcregion] [uniqueidentifier] NULL,
	[era_embcregionname] [nvarchar](100) NULL,
	[era_regionaldistrictid] [uniqueidentifier] NOT NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[organizationid] [uniqueidentifier] NULL,
	[organizationidname] [nvarchar](160) NULL,
	[overriddencreatedon] [datetime] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_regionaldistrict] PRIMARY KEY CLUSTERED 
(
	[era_regionaldistrictid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_supplier]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_supplier](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_addressline1] [nvarchar](200) NULL,
	[era_addressline2] [nvarchar](200) NULL,
	[era_businessnumber] [nvarchar](100) NULL,
	[era_cassitenumber] [nvarchar](15) NULL,
	[era_cassuppliernumber] [nvarchar](30) NULL,
	[era_fax] [nvarchar](100) NULL,
	[era_gstnumber] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_postalcode] [nvarchar](8) NULL,
	[era_preferredmethodofpayment] [int] NULL,
	[era_preferredmethodofpaymentname] [nvarchar](255) NULL,
	[era_primarycontact] [uniqueidentifier] NULL,
	[era_primarycontactname] [nvarchar](100) NULL,
	[era_relatedcity] [uniqueidentifier] NULL,
	[era_relatedcityname] [nvarchar](100) NULL,
	[era_relatedcountry] [uniqueidentifier] NULL,
	[era_relatedcountryname] [nvarchar](100) NULL,
	[era_relatedprovincestate] [uniqueidentifier] NULL,
	[era_relatedprovincestatename] [nvarchar](100) NULL,
	[era_storenumber] [nvarchar](100) NULL,
	[era_supplierid] [uniqueidentifier] NOT NULL,
	[era_suppliername] [nvarchar](100) NULL,
	[era_supportcategories] [nvarchar](4000) NULL,
	[era_supportcategoriesname] [nvarchar](255) NULL,
	[era_telephone] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[organizationid] [uniqueidentifier] NULL,
	[organizationidname] [nvarchar](160) NULL,
	[overriddencreatedon] [datetime] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_supplier] PRIMARY KEY CLUSTERED 
(
	[era_supplierid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_suppliercontact]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_suppliercontact](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[emailaddress] [nvarchar](100) NULL,
	[era_cellularphone] [nvarchar](100) NULL,
	[era_contactnumber] [nvarchar](100) NULL,
	[era_contacttype] [int] NULL,
	[era_contacttypename] [nvarchar](255) NULL,
	[era_fax] [nvarchar](100) NULL,
	[era_firstname] [nvarchar](100) NULL,
	[era_homeaddress] [nvarchar](300) NULL,
	[era_homephone] [nvarchar](100) NULL,
	[era_lastname] [nvarchar](100) NULL,
	[era_preferredname] [nvarchar](100) NULL,
	[era_relatedsupplier] [uniqueidentifier] NULL,
	[era_relatedsuppliername] [nvarchar](100) NULL,
	[era_suppliercontactid] [uniqueidentifier] NOT NULL,
	[era_workphone] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[organizationid] [uniqueidentifier] NULL,
	[organizationidname] [nvarchar](160) NULL,
	[overriddencreatedon] [datetime] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_suppliercontact] PRIMARY KEY CLUSTERED 
(
	[era_suppliercontactid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_supplierinvoice]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_supplierinvoice](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_addressline1] [nvarchar](100) NULL,
	[era_addressline2] [nvarchar](100) NULL,
	[era_approvedtotalamount] [numeric](38, 4) NULL,
	[era_approvedtotalamount_base] [numeric](38, 4) NULL,
	[era_city] [nvarchar](100) NULL,
	[era_contactemail] [nvarchar](100) NULL,
	[era_contactfax] [nvarchar](100) NULL,
	[era_contactfirstname] [nvarchar](100) NULL,
	[era_contactlastname] [nvarchar](100) NULL,
	[era_contactnumber] [nvarchar](100) NULL,
	[era_country] [nvarchar](100) NULL,
	[era_documentnumber] [nvarchar](100) NULL,
	[era_embcregion] [uniqueidentifier] NULL,
	[era_embcregionname] [nvarchar](100) NULL,
	[era_esstask] [uniqueidentifier] NULL,
	[era_esstaskname] [nvarchar](100) NULL,
	[era_event] [nvarchar](50) NULL,
	[era_gstnumber] [nvarchar](100) NULL,
	[era_invoicedate] [datetime] NULL,
	[era_invoicenumber] [nvarchar](100) NULL,
	[era_invoiceref] [nvarchar](100) NULL,
	[era_invoicetype] [int] NULL,
	[era_invoicetypename] [nvarchar](255) NULL,
	[era_legalbusinessname] [nvarchar](200) NULL,
	[era_partiallyapproved] [bit] NULL,
	[era_partiallyapprovedname] [nvarchar](255) NULL,
	[era_paymenterrormessage] [ntext] NULL,
	[era_postalcode] [nvarchar](10) NULL,
	[era_province] [uniqueidentifier] NULL,
	[era_provincename] [nvarchar](100) NULL,
	[era_referencenumber] [nvarchar](100) NULL,
	[era_referralno] [nvarchar](100) NULL,
	[era_relatedjurisdiction] [uniqueidentifier] NULL,
	[era_relatedjurisdictionname] [nvarchar](100) NULL,
	[era_relatedsupplier] [uniqueidentifier] NULL,
	[era_relatedsuppliername] [nvarchar](100) NULL,
	[era_remitaddress1] [nvarchar](100) NULL,
	[era_remitaddress2] [nvarchar](100) NULL,
	[era_remitcity] [nvarchar](100) NULL,
	[era_remitcountry] [nvarchar](100) NULL,
	[era_remitpaymenttootherbusiness] [bit] NULL,
	[era_remitpaymenttootherbusinessname] [nvarchar](255) NULL,
	[era_remitpostalcode] [nvarchar](100) NULL,
	[era_remitprovincestate] [nvarchar](100) NULL,
	[era_remitsupplier] [uniqueidentifier] NULL,
	[era_remitsuppliername] [nvarchar](100) NULL,
	[era_remittancemessage] [nvarchar](25) NULL,
	[era_sendpaymenttosupplier] [uniqueidentifier] NULL,
	[era_sendpaymenttosuppliername] [nvarchar](100) NULL,
	[era_storenumber] [nvarchar](100) NULL,
	[era_supplierinvoiceid] [uniqueidentifier] NOT NULL,
	[era_supplierinvoicenumber] [nvarchar](100) NULL,
	[era_supplierlegalname] [nvarchar](200) NULL,
	[era_suppliername] [nvarchar](200) NULL,
	[era_tasknumber] [nvarchar](100) NULL,
	[era_totalgst] [numeric](38, 4) NULL,
	[era_totalgst_base] [numeric](38, 4) NULL,
	[era_totalinvoiceamount] [numeric](38, 4) NULL,
	[era_totalinvoiceamount_base] [numeric](38, 4) NULL,
	[exchangerate] [numeric](38, 10) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[transactioncurrencyid] [uniqueidentifier] NULL,
	[transactioncurrencyidname] [nvarchar](100) NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_supplierinvoice] PRIMARY KEY CLUSTERED 
(
	[era_supplierinvoiceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_supplierpayments]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_supplierpayments](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_account] [nvarchar](5) NULL,
	[era_actualamount] [numeric](38, 4) NULL,
	[era_actualamount_base] [numeric](38, 4) NULL,
	[era_approvalresult] [int] NULL,
	[era_approvalresultname] [nvarchar](255) NULL,
	[era_batchnumber] [nvarchar](200) NULL,
	[era_caspayload] [ntext] NULL,
	[era_casresponse] [nvarchar](4000) NULL,
	[era_casvalidationerror] [ntext] NULL,
	[era_casvalidationstatus] [int] NULL,
	[era_casvalidationstatusname] [nvarchar](255) NULL,
	[era_documentnumber] [nvarchar](100) NULL,
	[era_embcregion] [uniqueidentifier] NULL,
	[era_embcregionname] [nvarchar](100) NULL,
	[era_errordetails] [ntext] NULL,
	[era_esstask] [uniqueidentifier] NULL,
	[era_esstaskname] [nvarchar](100) NULL,
	[era_gldate] [datetime] NULL,
	[era_info1] [nvarchar](25) NULL,
	[era_invoicedate] [datetime] NULL,
	[era_name] [nvarchar](100) NULL,
	[era_paygroup] [int] NULL,
	[era_paygroupname] [nvarchar](255) NULL,
	[era_paymentadvicecomments] [nvarchar](40) NULL,
	[era_paymentchequenumber] [nvarchar](100) NULL,
	[era_paymentdate] [datetime] NULL,
	[era_project] [nvarchar](7) NULL,
	[era_readytocancelpayment] [int] NULL,
	[era_readytocancelpaymentname] [nvarchar](255) NULL,
	[era_relatedsupplier] [uniqueidentifier] NULL,
	[era_relatedsupplierinvoice] [uniqueidentifier] NULL,
	[era_relatedsupplierinvoicename] [nvarchar](100) NULL,
	[era_relatedsuppliername] [nvarchar](100) NULL,
	[era_remittancemessage1] [nvarchar](40) NULL,
	[era_resp] [nvarchar](5) NULL,
	[era_stob] [nvarchar](4) NULL,
	[era_suppliernumber] [nvarchar](30) NULL,
	[era_supplierpaymentsid] [uniqueidentifier] NOT NULL,
	[era_suppliersitenumber] [nvarchar](15) NULL,
	[era_tasknumber] [nvarchar](100) NULL,
	[exchangerate] [numeric](38, 10) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[transactioncurrencyid] [uniqueidentifier] NULL,
	[transactioncurrencyidname] [nvarchar](100) NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_supplierpayments] PRIMARY KEY CLUSTERED 
(
	[era_supplierpaymentsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_support]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_support](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_supportid] [uniqueidentifier] NOT NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_support] PRIMARY KEY CLUSTERED 
(
	[era_supportid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_supportflag]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_supportflag](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_amountoverrider] [nvarchar](100) NULL,
	[era_description] [ntext] NULL,
	[era_evacueesupport] [uniqueidentifier] NULL,
	[era_evacueesupportname] [nvarchar](100) NULL,
	[era_flagreviewedby] [uniqueidentifier] NULL,
	[era_flagreviewedbyname] [nvarchar](200) NULL,
	[era_flagreviewedbyyominame] [nvarchar](200) NULL,
	[era_flagtype] [uniqueidentifier] NULL,
	[era_flagtypename] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_supportduplicate] [uniqueidentifier] NULL,
	[era_supportduplicatename] [nvarchar](100) NULL,
	[era_supportflagid] [uniqueidentifier] NOT NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_supportflag] PRIMARY KEY CLUSTERED 
(
	[era_supportflagid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_supportflagtype]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_supportflagtype](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_supportflagtypeid] [uniqueidentifier] NOT NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[organizationid] [uniqueidentifier] NULL,
	[organizationidname] [nvarchar](160) NULL,
	[overriddencreatedon] [datetime] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_supportflagtype] PRIMARY KEY CLUSTERED 
(
	[era_supportflagtypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_supportlineitem]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_supportlineitem](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_amount] [numeric](38, 4) NULL,
	[era_amount_base] [numeric](38, 4) NULL,
	[era_approvedamount] [numeric](38, 2) NULL,
	[era_approvedamount_base] [numeric](38, 2) NULL,
	[era_approvedgst] [numeric](38, 2) NULL,
	[era_approvedgst_base] [numeric](38, 2) NULL,
	[era_description] [nvarchar](300) NULL,
	[era_gst] [numeric](38, 4) NULL,
	[era_gst_base] [numeric](38, 4) NULL,
	[era_itemstatus] [int] NULL,
	[era_itemstatusname] [nvarchar](255) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_receipt] [nvarchar](100) NULL,
	[era_receiptdate] [date] NULL,
	[era_referralreference] [nvarchar](100) NULL,
	[era_relatedreferral] [uniqueidentifier] NULL,
	[era_relatedreferralname] [nvarchar](100) NULL,
	[era_statusdescription] [ntext] NULL,
	[era_submissionreference] [nvarchar](100) NULL,
	[era_supportlineitemid] [uniqueidentifier] NOT NULL,
	[era_supportprovided] [uniqueidentifier] NULL,
	[era_supportprovidedname] [nvarchar](100) NULL,
	[era_totalapprovedamount] [numeric](38, 4) NULL,
	[era_totalapprovedamount_base] [numeric](38, 4) NULL,
	[exchangerate] [numeric](38, 10) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[transactioncurrencyid] [uniqueidentifier] NULL,
	[transactioncurrencyidname] [nvarchar](100) NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_supportlineitem] PRIMARY KEY CLUSTERED 
(
	[era_supportlineitemid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_systemconfig]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_systemconfig](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_group] [nvarchar](100) NULL,
	[era_key] [nvarchar](100) NULL,
	[era_securevalue] [nvarchar](100) NULL,
	[era_systemconfigid] [uniqueidentifier] NOT NULL,
	[era_value] [nvarchar](100) NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_systemconfig] PRIMARY KEY CLUSTERED 
(
	[era_systemconfigid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [era_stage].[era_task]    Script Date: 1/17/2023 11:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [era_stage].[era_task](
	[createdby] [uniqueidentifier] NULL,
	[createdbyname] [nvarchar](200) NULL,
	[createdbyyominame] [nvarchar](200) NULL,
	[createdon] [datetime] NULL,
	[createdonbehalfby] [uniqueidentifier] NULL,
	[createdonbehalfbyname] [nvarchar](200) NULL,
	[createdonbehalfbyyominame] [nvarchar](200) NULL,
	[era_currentdateandtime] [datetime] NULL,
	[era_eventsummary] [nvarchar](40) NULL,
	[era_isreferencedbyessfile] [bit] NULL,
	[era_isreferencedbyessfilename] [nvarchar](255) NULL,
	[era_jurisdictionid] [uniqueidentifier] NULL,
	[era_jurisdictionidname] [nvarchar](100) NULL,
	[era_name] [nvarchar](100) NULL,
	[era_projectnumber] [nvarchar](7) NULL,
	[era_remoteextensiontoggle] [bit] NULL,
	[era_remoteextensiontogglename] [nvarchar](255) NULL,
	[era_responsiblecenter] [nvarchar](5) NULL,
	[era_serviceline] [nvarchar](5) NULL,
	[era_stob] [nvarchar](4) NULL,
	[era_taskdetails] [ntext] NULL,
	[era_taskenddate] [datetime] NULL,
	[era_taskid] [uniqueidentifier] NOT NULL,
	[era_taskstartdate] [datetime] NULL,
	[importsequencenumber] [int] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifiedbyname] [nvarchar](200) NULL,
	[modifiedbyyominame] [nvarchar](200) NULL,
	[modifiedon] [datetime] NULL,
	[modifiedonbehalfby] [uniqueidentifier] NULL,
	[modifiedonbehalfbyname] [nvarchar](200) NULL,
	[modifiedonbehalfbyyominame] [nvarchar](200) NULL,
	[overriddencreatedon] [datetime] NULL,
	[ownerid] [uniqueidentifier] NULL,
	[owneridname] [nvarchar](200) NULL,
	[owneridtype] [nvarchar](64) NULL,
	[owneridyominame] [nvarchar](200) NULL,
	[owningbusinessunit] [uniqueidentifier] NULL,
	[owningteam] [uniqueidentifier] NULL,
	[owninguser] [uniqueidentifier] NULL,
	[statecode] [int] NULL,
	[statecodename] [nvarchar](255) NULL,
	[statuscode] [int] NULL,
	[statuscodename] [nvarchar](255) NULL,
	[timezoneruleversionnumber] [int] NULL,
	[utcconversiontimezonecode] [int] NULL,
	[versionnumber] [bigint] NULL,
	[Created_Load_Id] [int] NULL,
	[Modified_Load_Id] [int] NULL,
 CONSTRAINT [PK_era_task] PRIMARY KEY CLUSTERED 
(
	[era_taskid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

;
MERGE  dbo.AdmLoadControl as Tgt
using (
SELECT *
FROM (VALUES

('era_stage','era_animal','1900-01-01T00:00:00','extract_era_animal')
,('era_stage','era_castest','1900-01-01T00:00:00','extract_era_castest')
,('era_stage','era_country','1900-01-01T00:00:00','extract_era_country')
,('era_stage','era_customautonumberdefinition','1900-01-01T00:00:00','extract_era_customautonumberdefinition')
,('era_stage','era_customautonumberrequest','1900-01-01T00:00:00','extract_era_customautonumberrequest')
,('era_stage','era_embcregion','1900-01-01T00:00:00','extract_era_embcregion')
,('era_stage','era_era_etransfertransaction_era_evacueesup','1900-01-01T00:00:00','extract_era_era_etransfertransaction_era_evacueesup')
,('era_stage','era_era_evacueesupport_era_etransfertransac','1900-01-01T00:00:00','extract_era_era_evacueesupport_era_etransfertransac')
,('era_stage','era_era_householdmember_era_evacueesupport','1900-01-01T00:00:00','extract_era_era_householdmember_era_evacueesupport')
,('era_stage','era_era_householdmember_era_needassessment','1900-01-01T00:00:00','extract_era_era_householdmember_era_needassessment')
,('era_stage','era_era_referralprint_era_evacueesupport','1900-01-01T00:00:00','extract_era_era_referralprint_era_evacueesupport')
,('era_stage','era_essevacueeetransfersupport','1900-01-01T00:00:00','extract_era_essevacueeetransfersupport')
,('era_stage','era_essfilenote','1900-01-01T00:00:00','extract_era_essfilenote')
,('era_stage','era_esssupportrate','1900-01-01T00:00:00','extract_era_esssupportrate')
,('era_stage','era_esstaskchangerequest','1900-01-01T00:00:00','extract_era_esstaskchangerequest')
,('era_stage','era_essteam','1900-01-01T00:00:00','extract_era_essteam')
,('era_stage','era_essteamarea','1900-01-01T00:00:00','extract_era_essteamarea')
,('era_stage','era_essteamsupplier','1900-01-01T00:00:00','extract_era_essteamsupplier')
,('era_stage','era_essteamuser','1900-01-01T00:00:00','extract_era_essteamuser')
,('era_stage','era_etransfertransaction','1900-01-01T00:00:00','extract_era_etransfertransaction')
,('era_stage','era_evacuationfile','1900-01-01T00:00:00','extract_era_evacuationfile')
,('era_stage','era_evacueeemailinvite','1900-01-01T00:00:00','extract_era_evacueeemailinvite')
,('era_stage','era_evacueesupport','1900-01-01T00:00:00','extract_era_evacueesupport')
,('era_stage','era_householdmember','1900-01-01T00:00:00','extract_era_householdmember')
,('era_stage','era_jurisdiction','1900-01-01T00:00:00','extract_era_jurisdiction')
,('era_stage','era_needassessment','1900-01-01T00:00:00','extract_era_needassessment')
,('era_stage','era_portalbanner','1900-01-01T00:00:00','extract_era_portalbanner')
,('era_stage','era_provinceterritories','1900-01-01T00:00:00','extract_era_provinceterritories')
,('era_stage','era_referral','1900-01-01T00:00:00','extract_era_referral')
,('era_stage','era_referralprint','1900-01-01T00:00:00','extract_era_referralprint')
,('era_stage','era_regionaldistrict','1900-01-01T00:00:00','extract_era_regionaldistrict')
,('era_stage','era_supplier','1900-01-01T00:00:00','extract_era_supplier')
,('era_stage','era_suppliercontact','1900-01-01T00:00:00','extract_era_suppliercontact')
,('era_stage','era_supplierinvoice','1900-01-01T00:00:00','extract_era_supplierinvoice')
,('era_stage','era_supplierpayments','1900-01-01T00:00:00','extract_era_supplierpayments')
,('era_stage','era_support','1900-01-01T00:00:00','extract_era_support')
,('era_stage','era_supportflag','1900-01-01T00:00:00','extract_era_supportflag')
,('era_stage','era_supportflagtype','1900-01-01T00:00:00','extract_era_supportflagtype')
,('era_stage','era_supportlineitem','1900-01-01T00:00:00','extract_era_supportlineitem')
,('era_stage','era_systemconfig','1900-01-01T00:00:00','extract_era_systemconfig')
,('era_stage','era_task','1900-01-01T00:00:00','extract_era_task')

) as a(SchemaName, TableName, LastLoadDate, PackageName)
) AS Src
On Src.SchemaName = Tgt.[SchemaName] 
AND Src.TableName = Tgt.TableName
WHEN NOT MATCHED 
THEN INSERT ( [SchemaName], [TableName], [LastLoadDate], [PackageName])
VALUES (Src.SchemaName, Src.TableName, Src.LastLoadDate,src.[PackageName])
WHEN MATCHED  
THEN UPDATE 
SET Tgt.PackageName = Src.PackageName
;
 
 update admloadcontrol set IsEnabled=0 where PackageName='era_castest';