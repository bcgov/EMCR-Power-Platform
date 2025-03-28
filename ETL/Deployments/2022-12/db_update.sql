use embc
go

ALTER TABLE [dfa_stage].[contact] ALTER COLUMN [emailaddress1] NVARCHAR (300) NULL;

ALTER TABLE [dfa_stage].[contact] ALTER COLUMN [emailaddress2] NVARCHAR (300) NULL;

ALTER TABLE [dfa_stage].[contact] ALTER COLUMN [emailaddress3] NVARCHAR (300) NULL;

ALTER TABLE [dfa_stage].[contact] ALTER COLUMN [lastname] NVARCHAR (100) NULL;


ALTER TABLE [dfa_stage].[contact] ALTER COLUMN [Address1_PostalCode] NVARCHAR(50) NULL;
ALTER TABLE [dfa_stage].[contact] ALTER COLUMN [Address2_PostalCode] NVARCHAR(50) NULL;
ALTER TABLE [dfa_stage].[contact] ALTER COLUMN [Address3_PostalCode] NVARCHAR(50) NULL;

ALTER TABLE [dfa_stage].[contact] ALTER COLUMN [MobilePhone] NVARCHAR(100) NULL;
ALTER TABLE [dfa_stage].[dfa_buildingownerlandlord] ALTER COLUMN [dfa_contactphone] NVARCHAR(50) NULL;
ALTER TABLE [dfa_stage].[dfa_buildingownerlandlord] ALTER COLUMN [dfa_contactphone2] NVARCHAR(50) NULL;

alter table [dfa_stage].[dfa_effectedregioncommunity] alter column [dfa_eventidname] NVARCHAR(100) NULL;

alter table [dfa_stage].[dfa_event] alter column [dfa_id] nvarchar(50) null;

Alter table [dfa_stage].[dfa_privatesectorstatusreport] alter column [dfa_eventidname] NVARCHAR(100) NULL;
Alter table [dfa_stage].[dfa_projectstatusreport] alter column [dfa_eventidname] NVARCHAR(100) NULL;

Alter table [dfa_stage].[dfa_publicsectorstatusreport] alter column [dfa_eventidname] NVARCHAR(100) NULL;
Alter table [dfa_stage].[dfa_publicsectorstatusreport] alter column [dfa_name] NVARCHAR(200) NULL;

Alter table [dfa_stage].[incident] alter column [dfa_eventidname] NVARCHAR(100) NULL;
Alter table [dfa_stage].[incident] alter column [dfa_pid] NVARCHAR(500) NULL;
Alter table [dfa_stage].[incident] alter column [dfa_mailingaddresspostalcode] NVARCHAR(50) NULL;
Alter table [dfa_stage].[incident] alter column [dfa_damagedpropertypostalcode] NVARCHAR(50) NULL;

