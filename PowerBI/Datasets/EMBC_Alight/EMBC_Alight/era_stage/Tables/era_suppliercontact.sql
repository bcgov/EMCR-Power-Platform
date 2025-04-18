﻿CREATE TABLE [era_stage].[era_suppliercontact] (
    [createdby]                  UNIQUEIDENTIFIER NULL,
    [createdbyname]              NVARCHAR (200)   NULL,
    [createdbyyominame]          NVARCHAR (200)   NULL,
    [createdon]                  DATETIME         NULL,
    [createdonbehalfby]          UNIQUEIDENTIFIER NULL,
    [createdonbehalfbyname]      NVARCHAR (200)   NULL,
    [createdonbehalfbyyominame]  NVARCHAR (200)   NULL,
    [emailaddress]               NVARCHAR (100)   NULL,
    [era_cellularphone]          NVARCHAR (100)   NULL,
    [era_contactnumber]          NVARCHAR (100)   NULL,
    [era_contacttype]            INT              NULL,
    [era_contacttypename]        NVARCHAR (255)   NULL,
    [era_fax]                    NVARCHAR (100)   NULL,
    [era_firstname]              NVARCHAR (100)   NULL,
    [era_homeaddress]            NVARCHAR (300)   NULL,
    [era_homephone]              NVARCHAR (100)   NULL,
    [era_lastname]               NVARCHAR (100)   NULL,
    [era_preferredname]          NVARCHAR (100)   NULL,
    [era_relatedsupplier]        UNIQUEIDENTIFIER NULL,
    [era_relatedsuppliername]    NVARCHAR (100)   NULL,
    [era_suppliercontactid]      UNIQUEIDENTIFIER NOT NULL,
    [era_workphone]              NVARCHAR (100)   NULL,
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
    CONSTRAINT [PK_era_suppliercontact] PRIMARY KEY CLUSTERED ([era_suppliercontactid] ASC)
);

