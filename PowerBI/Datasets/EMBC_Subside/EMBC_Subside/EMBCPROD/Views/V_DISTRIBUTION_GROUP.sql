﻿
CREATE VIEW [EMBCPROD].[V_DISTRIBUTION_GROUP] (
   GLOBAL_REPORT_ID, 
   REPORT_NAME, 
   REPORT_TYPE, 
   GROUP_NAME)
AS 
   SELECT DIST.GLOBAL_REPORT_ID, REPT.REPORT_NAME, REPT.REPORT_TYPE, GRP.GROUP_NAME
   FROM EMBCPROD.TBL_REPORT_GROUP_DIST  AS DIST, EMBCPROD.TBL_REPORT  AS REPT, EMBCPROD.TBL_DISTRIBUTION_GROUP  AS GRP
   WHERE 
      DIST.GLOBAL_REPORT_ID = REPT.GLOBAL_REPORT_ID AND 
      REPT.STATUS = 'A' AND 
      DIST.GROUP_ID = GRP.GROUP_ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'EMBCPROD.V_DISTRIBUTION_GROUP', @level0type = N'SCHEMA', @level0name = N'EMBCPROD', @level1type = N'VIEW', @level1name = N'V_DISTRIBUTION_GROUP';

