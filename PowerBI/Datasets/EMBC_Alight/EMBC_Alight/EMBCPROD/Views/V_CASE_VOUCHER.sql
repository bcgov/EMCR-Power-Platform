﻿CREATE VIEW EMBCPROD.V_CASE_VOUCHER (
   REPORT_ID, 
   STATUS, 
   AMOUNT, 
   CASE_AGENCY, 
   CASE_WORKER, 
   ISSUE_DATE, 
   PROVIDER, 
   VOUCHER_TYPE, 
   VOUCHER_NUMBER)
AS 
   SELECT 
      CV.REPORT_ID, 
      CV.STATUS, 
      CV.AMOUNT, 
      CV.CASE_AGENCY, 
      CV.CASE_WORKER, 
      CV.ISSUE_DATE, 
      CV.PROVIDER, 
      CV.VOUCHER_TYPE, 
      CV.VOUCHER_NUMBER
   FROM EMBCPROD.TBL_CASE_VOUCHER  AS CV
GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'EMBCPROD.V_CASE_VOUCHER', @level0type = N'SCHEMA', @level0name = N'EMBCPROD', @level1type = N'VIEW', @level1name = N'V_CASE_VOUCHER';

