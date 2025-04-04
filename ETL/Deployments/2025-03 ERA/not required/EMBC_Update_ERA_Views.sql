﻿/*
Deployment script for EMBC

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "EMBC"
:setvar DefaultFilePrefix "EMBC"
:setvar DefaultDataPath "F:\MSSQL\Data\"
:setvar DefaultLogPath "F:\MSSQL\Log\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering [era_rpt].[DimEvacuationFileStatus]...';


GO

ALTER view [era_rpt].[DimEvacuationFileStatus]
as
SELECT distinct  era_essfilestatus as DimEvacuationFileStatusBK, era_essfilestatusname as EvacuationFileStatus, 'ERA Dynamics' as 'Source'
  FROM [EMBC].[era_stage].[era_evacuationfile]
union
	select -1 as DimEvacuationFileStatusBK, 'Unknown' as EvacuationFileStatus,  'ERA_RLS1' as 'Source'
GO
PRINT N'Altering [era_rpt].[DimLocation]...';


GO


ALTER  VIEW [era_rpt].[DimLocation]
WITH SCHEMABINDING
AS 
SELECT DISTINCT
	b.Name as DimLocationBK
     ,  b.Name as 'City'
     , b.Name + ', British Columbia, Canada' as 'Full Location'
	 ,isnull(c.era_regionaldistrictname, 'Unknown') as RegionalDistrict
	 , b.RegionName as EMCRRegion
	 , 'ERA_RLS1' as 'Source'
  FROM [ERA_RLS1].[IncidentTasks] a
  INNER JOIN [ERA_RLS1].[Communities] b
	ON a.CommunityId = b.Id
  left join [era_stage].era_jurisdiction c
	on b.Name = c.era_jurisdictionname
UNION 
SELECT DISTINCT 
		convert(nvarchar(40), era_jurisdictionid) as DimLocationBK
      , era_jurisdictionname as 'City'
	 , era_jurisdictionname + ', British Columbia, Canada' as 'Full Location'
	 , b.era_districtname as RegionalDistrict
	 , b.era_embcregionname as EMCRRegion
	 , 'ERA Dynamics' as 'Source'
FROM [era_stage].[era_jurisdiction] a
left join [era_stage].[era_regionaldistrict] b
	on a.era_regionaldistrict = b.era_regionaldistrictid
GO
PRINT N'Altering [era_rpt].[DimSupportType]...';


GO



ALTER   VIEW [era_rpt].[DimSupportType]
WITH SCHEMABINDING 
AS
select DISTINCT 
		[type] as 'DimSupportTypeBK'
       ,[type] as 'Support Type'
     , 'ERA_RLS1' as 'Source' 
from [ERA_RLS1].[Referrals]
UNION ALL 
select DISTINCT	
	convert(nvarchar(40), era_supporttype) as DimSupportTypeBK
     ,  era_supporttypename as 'Support Type'
	 , 'ERA Dynamics' as 'Source'
from [era_stage].era_evacueesupport
where ltrim(rtrim(era_supporttypename)) not in ('Lodging-Hotel/Motel', 'Shelter-Hotel/Motel/Campground', 'Shelter-Billeting', 'Shelter-Group Lodging')
--order by DimSupportTypeBK
GO
PRINT N'Altering [era_rpt].[DimTask]...';


GO



ALTER   VIEW [era_rpt].[DimTask]
WITH SCHEMABINDING
AS
select DISTINCT 
	convert(nvarchar(40), TaskNumber) as DimTaskBK
     ,  TaskNumber as 'Task Number'
	 , 'Unknown' as SupportPathway
	 , 'Unknown' as IncidentCategory
	 , 'Unknown' as EventLevel
	 , TaskNumberStartDate as TaskStartDate
	 , TaskNumberEndDate as TaskEndDate
     , 'ERA_RLS1' as 'Source'
  from [ERA_RLS1].[IncidentTasks] a
  inner join [ERA_RLS1].[Communities] b
	on a.CommunityId = b.Id
UNION ALL
select DISTINCT 
		convert(nvarchar(40), era_taskid) as DimTaskBK
	 ,  era_name  as 'Task Number'
	 , isnull(era_supportpathwayidname, 'In Person') as SupportPathway
	 , isnull(era_incidentcategoryname, 'Unknown') as IncidentCategory
	 , isnull(era_eventlevelidname, 'Unknown') as EventLevel
	 , era_taskstartdate as TaskStartDate
	 , era_taskenddate as TaskEndDate
     , 'ERA Dynamics' as 'Source'
from [era_stage].[era_task]
GO
PRINT N'Altering [era_rpt].[FactEvacuees]...';


GO





ALTER VIEW [era_rpt].[FactEvacuees]
WITH SCHEMABINDING 
AS
SELECT  DISTINCT 
		LTRIM(RTRIM(convert(nvarchar(20), E.RegistrationId))) + '-' + LTRIM(RTRIM(convert(nvarchar(20), E.EvacueeSequenceNumber))) as FactEvacueesBK
	  , E.LastName + ', ' + E.FirstName as Name
	  , E.EvacueeTypeCode
	  , convert(nvarchar(40), IT.TaskNumber) as DimTaskBK
	  , CONVERT(DATE, IT.TaskNumberStartDate) as TaskStartDate
	  , CONVERT(DATE, IT.TaskNumberEndDate) as TaskEndDate
	  , C.Name as DimLocationBK_Task
	 , convert(NVARCHAR(40), C.Name) as DimLocationBK_EvacuatedFrom
	 , -1 as DimEvacuationFileStatusBK
	 , convert(nvarchar(40), ER.ESSFileNumber) as DimEvacuationFileBK
	  , 'ERA_RLS1' as 'Source'
FROM [ERA_RLS1].[IncidentTasks] IT
JOIN [ERA_RLS1].[EvacueeRegistrations] ER 
  ON IT.Id = ER.IncidentTaskId
JOIN ERA_RLS1.Evacuees E
  ON E.RegistrationId = ER.EssFileNumber		  
JOIN [ERA_RLS1].[Communities] C
  ON IT.CommunityId = C.Id
UNION ALL
select DISTINCT 
       CONVERT(NVARCHAR(40),hhm.era_householdmemberid) as FactEvacueesBK
	    , hhm.era_lastname + ', ' + hhm.era_firstname as 'Name'
       , NULL as 'EvacueeTypeCode'
	 , convert(nvarchar(40), et.era_taskid) as DimTaskBK
	 , CONVERT(DATE, et.era_taskstartdate) as era_taskstartdate
	 , CONVERT(DATE, et.era_taskenddate) as era_taskenddate
--	 , et.era_taskid
	 , convert(nvarchar(40), et.era_jurisdictionid)  as DimLocationBK_task
	 , convert(nvarchar(40), ef.era_evacuatedfromid) as DimLocationBK_EvacuatedFrom
	 , ef.era_essfilestatus as DimEvacuationFileStatusBK
	 ,convert(nvarchar(40), ef.era_evacuationfileid) as DimEvacuationFileBK
	 , 'ERA Dynamics' as 'Source'
from [era_stage].era_householdmember hhm
JOIN [era_stage].era_evacuationfile ef
ON hhm.era_evacuationfileid = ef.era_evacuationfileid
JOIN [era_stage].[era_task] et
  ON et.era_taskid  =ef.era_taskid
GO
PRINT N'Altering [era_rpt].[FactSupport]...';


GO









ALTER VIEW [era_rpt].[FactSupport]
WITH SCHEMABINDING 
AS
select DISTINCT 
	   CONVERT(NVARCHAR(40),R.Id) FactSupportBK
	 , CONVERT(NVARCHAR(40),R.Id) DimSupportBK
	 , CONVERT(NVARCHAR(40), R.[type]) as DimSupportTypeBK
	 , ISNULL(R.TotalAmount, 0.00) as TotalAmount
	 , CONVERT(NVARCHAR(40), IT.TaskNumber) as DimTaskBK_EvacuationFile
	 , convert(NVARCHAR(40), IT.TaskNumber) as DimTaskBK
     , CONVERT(DATE,IT.TaskNumberStartDate) as TaskStartDate
	 , CONVERT(DATE,IT.TaskNumberEndDate) as TaskEndDate
	 , convert(NVARCHAR(40), C.Name) as DimLocationBK_Task
	 , convert(NVARCHAR(40), C.Name) as DimLocationBK_EvacuatedFrom
	 , -1 as DimEvacuationFileStatusBK
	 , CONVERT(DATE, r.ValidFrom) as ValidFromDate
	 , CONVERT(DATE, r.ValidTo) as ValidToDate
	 , convert(nvarchar(40), ER.ESSFileNumber) as DimEvacuationFileBK
	 , '-1' as DimSupportDeliveryTypeBK
	 , '-1' as DimSupportStatusBK
	 , 'ERA_RLS1' as 'Source'
  from [ERA_RLS1].[EvacueeRegistrations] ER
  JOIN [ERA_RLS1].[IncidentTasks] IT
  on IT.Id = ER.IncidentTaskId
  inner join [ERA_RLS1].[Communities] C
	on IT.CommunityId = C.Id
JOIN [ERA_RLS1].[Referrals] R
  on R.RegistrationId = ER.EssFileNumber
UNION ALL 
select DISTINCT 
       CONVERT(NVARCHAR(40), es.era_evacueesupportid) as FactSupportBK
	 , CONVERT(NVARCHAR(40), es.era_evacueesupportid) as DimSupportBK
	 , convert(nvarchar(40), es.era_supporttype) as DimSupportTypeBK
	 , ISNULL(es.era_totalamount , 0.0) as TotalAmount
	 , convert(nvarchar(40), et.era_taskid) as DimTaskBK_EvacuationFile
	 , convert(nvarchar(40), es.era_task) as DimTaskBK
	 , CONVERT(DATE,et.era_taskstartdate) as TaskStartDate
	 , CONVERT(DATE,et.era_taskenddate) as TaskEndDate 
	 , convert(nvarchar(40), et.era_jurisdictionid) as DimLocationBK_Task
	 , convert(nvarchar(40), ef.era_evacuatedfromid) as DimLocationBK_EvacuatedFrom
	 , ef.era_essfilestatus as DimEvacuationFileStatusBK
	 , convert(date, es.era_validfrom) as ValidFromDate
	 , convert(date, es.era_validfrom) as ValidToDate
	 ,convert(nvarchar(40), ef.era_evacuationfileid) as DimEvacuationFileBK
	 , convert(nvarchar(40), es.era_supportdeliverytype) as DimSupportDeliveryTypeBK
	 , convert(nvarchar(40), es.statuscode) as DimSupportStatusBK
	 , 'ERA Dynamics' as 'Source'
from [era_stage].era_evacueesupport es
JOIN [era_stage].era_evacuationfile ef
ON es.era_evacuationfileid = ef.era_evacuationfileid
JOIN [era_stage].[era_task] et
  ON et.era_taskid  =ef.era_taskid
GO
PRINT N'Creating [era_rpt].[DimETransferTransactionStatus]...';


GO









create VIEW [era_rpt].[DimETransferTransactionStatus]
WITH SCHEMABINDING 
AS
--select DISTINCT 
--	   CONVERT(NVARCHAR(40),R.Id) DimSupportBK
--	, CONVERT(NVARCHAR(40),R.Id) SupportNumber
--	 , 'ERA_RLS1' as 'Source'
--  from  [ERA_RLS1].[Referrals] R
--UNION ALL
--**Apparently no RLS1 EtransferInfo**
select DISTINCT 
	   et.statuscode as DimETransferTransactionStatusBK
	 , et.statuscodename as StatusReason
	 , 'ERA Dynamics' as 'Source'
from [era_stage].era_etransfertransaction et
GO
PRINT N'Creating [era_rpt].[DimEvacuationFile]...';


GO

CREATE view [era_rpt].[DimEvacuationFile]
as
SELECT distinct  convert(nvarchar(40), era_evacuationfileid) as DimEvacuationFileBK, era_essfilestatusname as EvacuationFileStatus, 
 (select top 1 isnull(era_insurancecoveragename, 'Unknown') from era_stage.era_needassessment where era_evacuationfile = a.era_evacuationfileid) as Insurance
 ,'ERA Dynamics' as 'Source'
  FROM [EMBC].[era_stage].[era_evacuationfile] a
union
	select DISTINCT convert(nvarchar(40), ESSFileNumber) as DimEvacuationFileBK, 'Unknown' as EvacuationFileStatus, InsuranceCode as Insureance, 'ERA_RLS1' as 'Source'
	from ERA_RLS1.EvacueeRegistrations
GO
PRINT N'Creating [era_rpt].[DimSupport]...';


GO









create VIEW [era_rpt].[DimSupport]
WITH SCHEMABINDING 
AS
select DISTINCT 
	   CONVERT(NVARCHAR(40),R.Id) DimSupportBK
	, CONVERT(NVARCHAR(40),R.Id) SupportNumber
	 , 'ERA_RLS1' as 'Source'
  from  [ERA_RLS1].[Referrals] R
UNION ALL 
select DISTINCT 
       CONVERT(NVARCHAR(40), es.era_evacueesupportid) as DimSupportBK
	 , era_name as SupportNumber
	 , 'ERA Dynamics' as 'Source'
from [era_stage].era_evacueesupport es
GO
PRINT N'Creating [era_rpt].[DimSupportDeliveryType]...';


GO


CREATE VIEW [era_rpt].[DimSupportDeliveryType]
WITH SCHEMABINDING 
as
select Distinct convert(nvarchar(40), era_supportdeliverytype) as DimSupportDeliveryTpeBK, era_supportdeliverytypename as SupportDeliveryType, 'ERA Dynamics' as 'Source'
from era_stage.era_evacueesupport
union
select -1, 'Unknown', 'ERA_RLS1' as 'Source'
GO
PRINT N'Creating [era_rpt].[DimSupportStatus]...';


GO
Create VIEW [era_rpt].[DimSupportStatus]
WITH SCHEMABINDING 
as
select distinct convert(nvarchar(40), statuscode) as DimSupportStatusBK, statuscodename as SupportStatus,  'ERA Dynamics' as 'Source'
from era_stage.era_evacueesupport
union select '-1', 'Unknown', 'ERA_RLS1'
GO
PRINT N'Creating [era_rpt].[FactActiveTask]...';


GO




CREATE VIEW [era_rpt].[FactActiveTask]
WITH SCHEMABINDING
AS
select DISTINCT 
	convert(nvarchar(40), TaskNumber) as DimTaskBK
     ,  TaskNumber as 'Task Number'
	 ,convert(date, TaskNumberStartDate) as TaskStartDate
	 ,convert(date, TaskNumberEndDate) as TaskEndDate--select *
	 , convert(date, b.CAL_DAY_DT) as Date
	 , case when datediff(dd, convert(date, TaskNumberStartDate), convert(date, b.CAL_DAY_DT)) > 9 then 'Yes' else 'No' end as Active10PlusDays
	 , datediff(dd, convert(date, TaskNumberStartDate), convert(date, b.CAL_DAY_DT)) as CurrentDayCount
	 , datediff(dd, convert(date, TaskNumberStartDate), convert(date, TaskNumberEndDate)) as TotalDayCount
	 , convert(NVARCHAR(40), C.Name) as DimLocationBK
     , 'ERA_RLS1' as 'Source'
  from [ERA_RLS1].[IncidentTasks] a
  inner join dbo.D_DATE b
	on convert(date, b.CAL_DAY_DT) between convert(date, TaskNumberStartDate) and convert(date, TaskNumberEndDate)
  inner join [ERA_RLS1].[Communities] C
	on a.CommunityId = C.Id
  --inner join [ERA_RLS1].[Communities] b
	--on a.CommunityId = b.Id
UNION ALL
select DISTINCT 
		convert(nvarchar(40), era_taskid) as DimTaskBK
	 ,  era_name  as 'Task Number'
	 ,convert(date, era_taskstartdate) as TaskStartDate
	 ,convert(date, era_taskenddate) as TaskEndDate--select *
	 ,convert(date, b.CAL_DAY_DT) as Date
	 , case when datediff(dd, convert(date, era_taskstartdate), convert(date, b.CAL_DAY_DT)) > 9 then 'Yes' else 'No' end as Active10PlusDays
	 , datediff(dd, convert(date, era_taskstartdate), convert(date, b.CAL_DAY_DT)) as CurrentDayCount
	 , datediff(dd, convert(date, era_taskstartdate), convert(date, era_taskenddate)) as TotalDayCount
	 , convert(nvarchar(40), era_jurisdictionid) as DimLocationBK_Task
     , 'ERA Dynamics' as 'Source'
from [era_stage].[era_task] a
inner join dbo.D_DATE b
	on convert(date, b.CAL_DAY_DT) between convert(date, era_taskstartdate) and convert(date, era_taskenddate)
GO
PRINT N'Creating [era_rpt].[FactETransferTransaction]...';


GO









create VIEW [era_rpt].[FactETransferTransaction]
WITH SCHEMABINDING 
AS
--select DISTINCT 
--	   CONVERT(NVARCHAR(40),R.Id) DimSupportBK
--	, CONVERT(NVARCHAR(40),R.Id) SupportNumber
--	 , 'ERA_RLS1' as 'Source'
--  from  [ERA_RLS1].[Referrals] R
--UNION ALL
--**Apparently no RLS1 EtransferInfo**
select DISTINCT 
	convert(nvarchar(40), et.era_etransfertransactionid) as FactETransferTransactionBK
       ,CONVERT(NVARCHAR(40), eset.era_evacueesupportid) as DimSupportBK
	   , et.statuscode as DimETransferTransactionStatusBK
	 , et.era_name as TransactionID
	 , convert(date, et.createdon) as CreatedOnDate
	 ,convert(date, et.era_casresponsedate) as CASResponseDate
	 , 'ERA Dynamics' as 'Source'
from [era_stage].era_etransfertransaction et
inner join [era_stage].[era_era_evacueesupport_era_etransfertransac] eset
	on et.era_etransfertransactionid = eset.era_etransfertransactionid
GO
PRINT N'Update complete.';


GO
