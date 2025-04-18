﻿CREATE TABLE [Eteam].[TBL_USER_LOG] (
    [USER_LOG_ID]     NVARCHAR (100) NOT NULL,
    [SESSION_ID]      NVARCHAR (100) NULL,
    [USER_ID]         NVARCHAR (100) NULL,
    [USER_NAME]       NVARCHAR (300) NULL,
    [LOGIN_TIME]      DATETIME       NULL,
    [LOGIN_IP_ADDR]   NVARCHAR (100) NULL,
    [LOGIN_HOST_NAME] NVARCHAR (100) NULL,
    [LOGOUT_TIME]     DATETIME       NULL
);

