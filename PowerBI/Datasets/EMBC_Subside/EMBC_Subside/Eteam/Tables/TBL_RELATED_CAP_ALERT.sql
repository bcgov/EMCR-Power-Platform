﻿CREATE TABLE [Eteam].[TBL_RELATED_CAP_ALERT] (
    [GLOBAL_REPORT_ID]         NVARCHAR (100) NOT NULL,
    [REPORT_ID]                NVARCHAR (100) NULL,
    [REPORT_TYPE]              NVARCHAR (100) NULL,
    [REPORT_NAME]              NVARCHAR (300) NULL,
    [RELATION_DATE]            DATETIME       NULL,
    [RELATED_GLOBAL_REPORT_ID] NVARCHAR (100) NULL,
    [RELATED_REPORT_ID]        NVARCHAR (100) NULL,
    [RELATED_REPORT_TYPE]      NVARCHAR (100) NULL,
    [RELATED_REPORT_NAME]      NVARCHAR (300) NULL,
    [EIA_REPORT_TYPE]          NVARCHAR (100) NULL,
    [RELATED_CAP_ALERT_PK]     INT            IDENTITY (1, 1) NOT NULL
);

