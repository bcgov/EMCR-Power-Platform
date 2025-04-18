﻿CREATE TABLE [Eteam].[TBL_REGISTRATION_REQUEST] (
    [REG_REQUEST_ID]                 NVARCHAR (100)  NOT NULL,
    [REG_REQUEST_UNAM]               NVARCHAR (100)  NULL,
    [REG_REQUEST_UPWD]               NVARCHAR (100)  NULL,
    [REG_REQUEST_FIRST_NAME]         NVARCHAR (300)  NULL,
    [REG_REQUEST_MIDDLE_NAME]        NVARCHAR (300)  NULL,
    [REG_REQUEST_LAST_NAME]          NVARCHAR (300)  NULL,
    [REG_REQUEST_ORG_LOCATION]       NVARCHAR (300)  NULL,
    [REG_REQUEST_SHIFT]              NVARCHAR (300)  NULL,
    [REG_REQUEST_REGIONAL_OFFICE]    NVARCHAR (300)  NULL,
    [REG_REQUEST_POSITION]           NVARCHAR (300)  NULL,
    [REG_REQUEST_AGENCY]             NVARCHAR (300)  NULL,
    [REG_REQUEST_TITLE]              NVARCHAR (300)  NULL,
    [REG_REQUEST_PHONE]              NVARCHAR (100)  NULL,
    [REG_REQUEST_CELL]               NVARCHAR (100)  NULL,
    [REG_REQUEST_FAX]                NVARCHAR (100)  NULL,
    [REG_REQUEST_EMAIL]              NVARCHAR (100)  NULL,
    [REG_REQUEST_PAGER]              NVARCHAR (100)  NULL,
    [REG_REQUEST_OTHER]              NVARCHAR (300)  NULL,
    [REG_REQUEST_FREQUENCY]          NVARCHAR (300)  NULL,
    [REG_REQUEST_CALL_SIGN]          NVARCHAR (300)  NULL,
    [REG_REQUEST_TALK_GROUP]         NVARCHAR (300)  NULL,
    [REG_REQUEST_TARGET_ALERT]       NVARCHAR (1)    NULL,
    [REG_REQUEST_EMAIL_NOTIFICATION] NVARCHAR (1)    NULL,
    [REG_REQ_EMAIL_NOTIF_COMMENT]    NVARCHAR (300)  NULL,
    [REG_REQUEST_EMAIL_ON_PAGER]     NVARCHAR (1)    NULL,
    [REG_REQ_EMAIL_ON_PAGER_COMMENT] NVARCHAR (300)  NULL,
    [REG_REQUEST_EMAIL_ON_MOBILE]    NVARCHAR (1)    NULL,
    [REG_REQ_EMAIL_ON_MOB_COMMENT]   NVARCHAR (300)  NULL,
    [REG_REQUEST_SKILL_SET]          NVARCHAR (2000) NULL,
    [REG_REQUEST_REPORT_TYPES]       NTEXT           NULL,
    [REG_REQUEST_REPORT_SUB_TYPES]   NTEXT           NULL,
    [REG_REQUEST_STATUS]             NVARCHAR (50)   NULL,
    [REG_SECURITY_QUESTION_ID]       NVARCHAR (100)  NULL,
    [REG_SECURITY_ANSWER]            NVARCHAR (300)  NULL,
    [REG_ORG_LOCATION_ID]            NVARCHAR (100)  NULL,
    [REG_POSITION_ID]                NVARCHAR (100)  NULL
);

