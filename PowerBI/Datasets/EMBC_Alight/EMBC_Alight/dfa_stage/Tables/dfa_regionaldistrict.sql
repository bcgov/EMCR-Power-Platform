﻿CREATE TABLE [dfa_stage].[dfa_regionaldistrict] (
    [createdby]                  UNIQUEIDENTIFIER NULL,
    [createdbyname]              NVARCHAR (200)   NULL,
    [createdbyyominame]          NVARCHAR (200)   NULL,
    [createdon]                  DATETIME         NULL,
    [createdonbehalfby]          UNIQUEIDENTIFIER NULL,
    [createdonbehalfbyname]      NVARCHAR (200)   NULL,
    [createdonbehalfbyyominame]  NVARCHAR (200)   NULL,
    [dfa_embcregion]             UNIQUEIDENTIFIER NULL,
    [dfa_embcregionname]         NVARCHAR (250)   NULL,
    [dfa_name]                   NVARCHAR (250)   NULL,
    [dfa_regionaldistrictid]     UNIQUEIDENTIFIER NOT NULL,
    [importsequencenumber]       INT              NULL,
    [modifiedby]                 UNIQUEIDENTIFIER NULL,
    [modifiedbyname]             NVARCHAR (200)   NULL,
    [modifiedbyyominame]         NVARCHAR (200)   NULL,
    [modifiedon]                 DATETIME         NULL,
    [modifiedonbehalfby]         UNIQUEIDENTIFIER NULL,
    [modifiedonbehalfbyname]     NVARCHAR (200)   NULL,
    [modifiedonbehalfbyyominame] NVARCHAR (200)   NULL,
    [organizationid]             UNIQUEIDENTIFIER NULL,
    [organizationidname]         NVARCHAR (160)   NULL,
    [overriddencreatedon]        DATETIME         NULL,
    [statecode]                  INT              NULL,
    [statecodename]              NVARCHAR (255)   NULL,
    [statuscode]                 INT              NULL,
    [statuscodename]             NVARCHAR (255)   NULL,
    [timezoneruleversionnumber]  INT              NULL,
    [utcconversiontimezonecode]  INT              NULL,
    [versionnumber]              BIGINT           NULL,
    [Created_Load_Id]            INT              NULL,
    [Modified_Load_Id]           INT              NULL,
    CONSTRAINT [PK_dfa_regionaldistrict] PRIMARY KEY CLUSTERED ([dfa_regionaldistrictid] ASC)
);

