USE [EMBC]
GO

CREATE OR ALTER    VIEW [dfa_rpt].[FactProject]
WITH SCHEMABINDING 
AS

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [dfa_actualcostcalculatedwithapprovedpercentag]  as ActualCostCalculatedWithApprovedPercentage
      ,[dfa_actualcostcalculatedwithapprovedpercentag_base] as ActualCostCalculatedWithApprovedPercentageBase 
      ,[dfa_actualcostwithtax] as ActualCostWithTax
      ,[dfa_actualcostwithtax_base] as ActualCostWithTaxBase
      ,[dfa_approvedcost] as ApprovedCost
      ,[dfa_approvedcost_base] as ApprovedCostBase
      ,[dfa_approvedcostcalculatedwithpercentage] as ApprovedCostCalculatedWithPercentage
      ,[dfa_approvedcostcalculatedwithpercentage_base] as ApprovedCostCalculatedWithPercentageBase
      ,[dfa_approvedpercentages] as ApprovedPercentages
      ,[dfa_caseid] as DimCaseBK
      ,a.[dfa_dateofdamage] as DamageDate
      ,a.[dfa_dateofdamagefrom] as DamafeFromDate
      ,a.[dfa_dateofdamageto] as DamageToDate
      ,[dfa_estimatedcompletiondateofproject] as EstimatedCompletionDate
      ,[dfa_estimatedcost] as EstimatedCost
      ,[dfa_estimatedcost_base] as EstimatedCostBase
      ,[dfa_estimatedcostcalculatedpercentage] as EstimatedCostCalculatedPercentage
      ,[dfa_estimatedcostcalculatedpercentage_base] as EstimatedCostCalculatedPercentageBase
      ,[dfa_latestrequestforinfo] as LatestRequestForInfoDate
      ,[dfa_projectid] as DimProjectDetailBK
	  ,isnull(convert(nvarchar(40), b.[dfa_eventid]), '-1') as DimEventBK
	  , b.dfa_areacommunityid as DimLocationBK
	  , b.incidentid as DimCaseDetailBK
	  , a.dfa_projectapproveddate as 'ProjectApprovedDate'
	  , a.dfa_projectcompletiondate as 'ProjectCompletionDate'
	  , a.dfa_18monthdeadline as '18MonthDeadline'
	  , CONVERT(DATE, a.modifiedon) AS ProjectModifiedOn
	  , CONVERT(DATE, a.createdon) AS ProjectCreatedOn
	  , dfa_totalpaidafterpercent as TotalPaidAfterPercent
  FROM [dfa_stage].[dfa_project] a
  inner join [dfa_stage].incident b
	on a.dfa_caseid = b.incidentid
GO


