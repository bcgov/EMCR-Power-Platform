﻿CREATE VIEW [EMBCPROD].[TBL_ROLE_PRIVILEGE]AS SELECT ROLE_ID,PRIVILEGE_ID FROM [Eteam_Ora].[TBL_ROLE_PRIVILEGE]  UNION ALL   SELECT ROLE_ID,PRIVILEGE_ID FROM [Eteam].[TBL_ROLE_PRIVILEGE]
