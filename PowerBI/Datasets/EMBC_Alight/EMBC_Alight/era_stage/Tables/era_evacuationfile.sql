﻿CREATE TABLE [era_stage].[era_evacuationfile] (
    [createdby]                           UNIQUEIDENTIFIER NULL,
    [createdbyname]                       NVARCHAR (200)   NULL,
    [createdbyyominame]                   NVARCHAR (200)   NULL,
    [createdon]                           DATETIME         NULL,
    [createdonbehalfby]                   UNIQUEIDENTIFIER NULL,
    [createdonbehalfbyname]               NVARCHAR (200)   NULL,
    [createdonbehalfbyyominame]           NVARCHAR (200)   NULL,
    [era_currentneedsassessmentid]        UNIQUEIDENTIFIER NULL,
    [era_currentneedsassessmentidname]    NVARCHAR (100)   NULL,
    [era_dayssincecreated]                INT              NULL,
    [era_essfilestatus]                   INT              NULL,
    [era_essfilestatusname]               NVARCHAR (255)   NULL,
    [era_evacuatedfromid]                 UNIQUEIDENTIFIER NULL,
    [era_evacuatedfromidname]             NVARCHAR (100)   NULL,
    [era_evacuationfiledate]              DATETIME         NULL,
    [era_evacuationfileid]                UNIQUEIDENTIFIER NOT NULL,
    [era_haspetfood]                      INT              NULL,
    [era_haspetfoodname]                  NVARCHAR (255)   NULL,
    [era_hasrestriction]                  INT              NULL,
    [era_hasrestriction_date]             DATETIME         NULL,
    [era_hasrestriction_state]            INT              NULL,
    [era_interviewername]                 NVARCHAR (101)   NULL,
    [era_name]                            NVARCHAR (100)   NULL,
    [era_numberofassessments]             INT              NULL,
    [era_numberofassessments_date]        DATETIME         NULL,
    [era_numberofassessments_state]       INT              NULL,
    [era_paperbasedessfile]               NVARCHAR (100)   NULL,
    [era_petcareplans]                    NTEXT            NULL,
    [era_registrant]                      UNIQUEIDENTIFIER NULL,
    [era_registrantname]                  NVARCHAR (160)   NULL,
    [era_registrantyominame]              NVARCHAR (450)   NULL,
    [era_registrationcomplete]            BIT              NULL,
    [era_registrationcompleteddate]       DATETIME         NULL,
    [era_registrationcompletename]        NVARCHAR (255)   NULL,
    [era_securityphrase]                  NVARCHAR (50)    NULL,
    [era_selfregistrationdate]            DATETIME         NULL,
    [era_supportprovided]                 INT              NULL,
    [era_supportstotalamountsummary]      NUMERIC (38, 4)  NULL,
    [era_supportstotalamountsummary_base] NUMERIC (38, 4)  NULL,
    [era_taskid]                          UNIQUEIDENTIFIER NULL,
    [era_taskidname]                      NVARCHAR (100)   NULL,
    [era_totalhouseholdanimals]           INT              NULL,
    [era_totalhouseholdanimals_date]      DATETIME         NULL,
    [era_totalhouseholdanimals_state]     INT              NULL,
    [exchangerate]                        NUMERIC (38, 10) NULL,
    [importsequencenumber]                INT              NULL,
    [modifiedby]                          UNIQUEIDENTIFIER NULL,
    [modifiedbyname]                      NVARCHAR (200)   NULL,
    [modifiedbyyominame]                  NVARCHAR (200)   NULL,
    [modifiedon]                          DATETIME         NULL,
    [modifiedonbehalfby]                  UNIQUEIDENTIFIER NULL,
    [modifiedonbehalfbyname]              NVARCHAR (200)   NULL,
    [modifiedonbehalfbyyominame]          NVARCHAR (200)   NULL,
    [overriddencreatedon]                 DATETIME         NULL,
    [ownerid]                             UNIQUEIDENTIFIER NULL,
    [owneridname]                         NVARCHAR (200)   NULL,
    [owneridtype]                         NVARCHAR (64)    NULL,
    [owneridyominame]                     NVARCHAR (200)   NULL,
    [owningbusinessunit]                  UNIQUEIDENTIFIER NULL,
    [owningteam]                          UNIQUEIDENTIFIER NULL,
    [owninguser]                          UNIQUEIDENTIFIER NULL,
    [statecode]                           INT              NULL,
    [statecodename]                       NVARCHAR (255)   NULL,
    [statuscode]                          INT              NULL,
    [statuscodename]                      NVARCHAR (255)   NULL,
    [timezoneruleversionnumber]           INT              NULL,
    [transactioncurrencyid]               UNIQUEIDENTIFIER NULL,
    [transactioncurrencyidname]           NVARCHAR (100)   NULL,
    [utcconversiontimezonecode]           INT              NULL,
    [versionnumber]                       BIGINT           NULL,
    [Created_Load_Id]                     INT              NULL,
    [Modified_Load_Id]                    INT              NULL,
    [era_totalhouseholdmembers]           INT              NULL,
    [era_totalhouseholdmembers_date]      DATETIME         NULL,
    [era_totalhouseholdmembers_state]     INT              NULL,
    CONSTRAINT [PK_era_evacuationfile] PRIMARY KEY CLUSTERED ([era_evacuationfileid] ASC)
);

