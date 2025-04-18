﻿CREATE TABLE [Eteam].[TBL_ORGANIZATION_POSITIONS] (
    [POSITION_ID]                 NVARCHAR (100)  NOT NULL,
    [COMMENTS]                    NVARCHAR (3000) NULL,
    [CHECK_LIST]                  NTEXT           NULL,
    [ORGANIZATION_ID]             NVARCHAR (100)  NULL,
    [PARENT_POSITION_ID]          NVARCHAR (100)  NULL,
    [POSITION_NAME]               NVARCHAR (300)  NULL,
    [POSITION_TEMPLATE_REPORT_ID] NVARCHAR (100)  NULL,
    [ORGANIZATION_NAME]           NVARCHAR (300)  NULL
);

