﻿CREATE TABLE [Eteam].[TBL_ORGANIZATION_SITREP] (
    [ORGANIZATION_SITREP_ID] NVARCHAR (100) NOT NULL,
    [REPORTING_ORG]          NVARCHAR (300) NULL,
    [REPORTING_ORG_ID]       NVARCHAR (300) NULL,
    [OP_STATUS]              NVARCHAR (300) NULL,
    [STATUS_AS_OF]           DATETIME       NULL,
    [ESTIMATED_NORMOPS]      DATETIME       NULL,
    [ACTUAL_NORMOPS]         DATETIME       NULL,
    [SUMMARY]                NTEXT          NULL,
    [RESOURCE_NEEDS]         NTEXT          NULL,
    [OVERALL_PERSSTATUS]     NVARCHAR (300) NULL,
    [EMPLOYEE_FATALITIES]    NVARCHAR (100) NULL,
    [EMPLOYEE_INJURIES]      NVARCHAR (100) NULL,
    [EMPLOYEE_COMMENTS]      NTEXT          NULL,
    [NONEMP_FATALITIES]      NVARCHAR (100) NULL,
    [NONEMP_INJURIES]        NVARCHAR (100) NULL,
    [NONEMP_COMMENTS]        NTEXT          NULL,
    [PERS_CAT1]              NVARCHAR (100) NULL,
    [PERS_ASSIGNED1]         NVARCHAR (100) NULL,
    [PERS_AVAIL1]            NVARCHAR (100) NULL,
    [PERS_CAT2]              NVARCHAR (100) NULL,
    [PERS_ASSIGNED2]         NVARCHAR (100) NULL,
    [PERS_AVAIL2]            NVARCHAR (100) NULL,
    [PERS_CAT3]              NVARCHAR (100) NULL,
    [PERS_ASSIGNED3]         NVARCHAR (100) NULL,
    [PERS_AVAIL3]            NVARCHAR (100) NULL,
    [PERS_CAT4]              NVARCHAR (100) NULL,
    [PERS_ASSIGNED4]         NVARCHAR (100) NULL,
    [PERS_AVAIL4]            NVARCHAR (100) NULL,
    [PERS_CAT5]              NVARCHAR (100) NULL,
    [PERS_ASSIGNED5]         NVARCHAR (100) NULL,
    [PERS_AVAIL5]            NVARCHAR (100) NULL,
    [OTHER_ISSUES]           NTEXT          NULL,
    [OVERALL_FACSTATUS]      NVARCHAR (100) NULL,
    [OCCUPANCY_STATUS]       NVARCHAR (100) NULL,
    [STRUCTURAL_STATUS]      NVARCHAR (100) NULL,
    [NONSTRUCTURAL_STATUS]   NVARCHAR (100) NULL,
    [FACSTATUS_COMMENTS]     NTEXT          NULL,
    [KEYFAC_STATUS]          NTEXT          NULL,
    [KEYFAC_STATUS_IDS]      NTEXT          NULL,
    [OVERALLSYS_STATUS]      NVARCHAR (100) NULL,
    [KEYSTATUS_IT]           NVARCHAR (100) NULL,
    [KEYSTATUS_TELECOM]      NVARCHAR (100) NULL,
    [KEYNAME1]               NVARCHAR (100) NULL,
    [KEYSTATUS1]             NVARCHAR (100) NULL,
    [KEYNAME2]               NVARCHAR (100) NULL,
    [KEYSTATUS2]             NVARCHAR (100) NULL,
    [KEYNAME3]               NVARCHAR (100) NULL,
    [KEYSTATUS3]             NVARCHAR (100) NULL,
    [KEYNAME4]               NVARCHAR (100) NULL,
    [KEYSTATUS4]             NVARCHAR (100) NULL,
    [KEYNAME5]               NVARCHAR (100) NULL,
    [KEYSTATUS5]             NVARCHAR (100) NULL,
    [KEYNAME6]               NVARCHAR (100) NULL,
    [KEYSTATUS6]             NVARCHAR (100) NULL,
    [KEYSYS_COMMENTS]        NTEXT          NULL,
    [DATE_RELOCATED]         DATETIME       NULL,
    [RELOCATION_DESC]        NTEXT          NULL,
    [RELOCATION_CONTACT]     NTEXT          NULL,
    [ESTRETURN_PERM]         DATETIME       NULL,
    [ACTUALRETURN_PERM]      DATETIME       NULL,
    [RELOCATION_COMMENTS]    NTEXT          NULL
);

