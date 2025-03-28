
-- Insert the new builds for era_stage
INSERT INTO [dbo].[AdmLoadControl]
           ([SchemaName]
           ,[TableName]
           ,[LastLoadDate]
           ,[PackageName]
           ,[IsEnabled]
           ,[IsFullLoad])
SELECT 'era_stage', tabs.name, '1900-01-01', CONCAT('extract_', tabs.name), 1, 0
FROM   SYS.all_objects tabs
WHERE  tabs.schema_id IN (SELECT schema_id FROM sys.schemas WHERE name = 'era_stage')
AND    tabs.name NOT IN (SELECT DISTINCT [TableName] FROM [dbo].[AdmLoadControl] WHERE [SchemaName] = 'era_stage')
AND    type = 'U';

-- set everything to ZERO for INCREMENTAL
UPDATE [dbo].[AdmLoadControl]
    SET [IsFullLoad] = 0;

-- Grants for the stored proc reset
GRANT ALTER ON OBJECT::[era_stage].[era_animal]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_bscaddress]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_castest]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_country]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_customautonumberdefinition]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_customautonumberrequest]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_eligibilitycheck]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_eligiblesupport]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_embcregion]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_era_etransfertransaction_era_evacueesup]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_era_evacueesupport_era_etransfertransac]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_era_householdmember_era_evacueesupport]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_era_householdmember_era_needassessment]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_era_referralprint_era_evacueesupport]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_essevacueeetransfersupport]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_essfilenote]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_essincidentcategoryidentifier]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_esssupportrate]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_esstaskchangerequest]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_essteam]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_essteamarea]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_essteamsupplier]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_essteamuser]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_etransfertransaction]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_evacuationfile]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_evacueeemailinvite]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_evacueesupport]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_eventlevel]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_householdmember]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_jurisdiction]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_needassessment]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_portalaccessauditlogs]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_portalbanner]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_provinceterritories]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_referral]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_referralprint]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_regionaldistrict]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_selfservesupportlimits]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_supplier]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_suppliercontact]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_supplierinvoice]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_supplierpayments]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_support]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_supportflag]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_supportflagtype]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_supportlimit]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_supportlineitem]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_supportpathway]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_systemconfig]  TO [embc_etl];
GRANT ALTER ON OBJECT::[era_stage].[era_task]  TO [embc_etl];