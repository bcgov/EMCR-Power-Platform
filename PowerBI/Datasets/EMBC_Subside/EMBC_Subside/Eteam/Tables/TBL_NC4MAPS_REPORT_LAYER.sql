﻿CREATE TABLE [Eteam].[TBL_NC4MAPS_REPORT_LAYER] (
    [REPORT_TYPE]     NVARCHAR (200)   NOT NULL,
    [REPORT_SUB_TYPE] NVARCHAR (200)   NULL,
    [OPACITY]         NUMERIC (18, 10) NULL,
    [REFRESH_RATE]    NUMERIC (18, 10) NULL,
    [STATE]           NUMERIC (18)     NULL,
    [ID]              NVARCHAR (100)   NOT NULL
);

