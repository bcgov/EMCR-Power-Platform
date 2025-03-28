USE EMBC
go

update AdmLoadControl
Set LastLoadDate = '1900-01-01'
where SchemaName = 'dfa_stage'
;

truncate table dfa_stage.dfa_appeal;
truncate table dfa_stage.dfa_application;
truncate table dfa_stage.dfa_applicationassignee;
truncate table dfa_stage.dfa_areacommunities;
truncate table dfa_stage.dfa_buildingownerlandlord;
truncate table dfa_stage.dfa_cheque;
truncate table dfa_stage.dfa_claimstatusreport;
truncate table dfa_stage.dfa_claimsummary;
truncate table dfa_stage.dfa_cleanuplog;
truncate table dfa_stage.dfa_costpercapitabreakdown;
truncate table dfa_stage.dfa_damageditem;
truncate table dfa_stage.dfa_effectedlocalgovernment;
truncate table dfa_stage.dfa_effectedregioncommunity;
truncate table dfa_stage.dfa_event;
truncate table dfa_stage.dfa_localgovcaseintakeprocess;
truncate table dfa_stage.dfa_occupant;
truncate table dfa_stage.dfa_othercontact;
truncate table dfa_stage.dfa_privatesectorstatusreport;
truncate table dfa_stage.dfa_project;
truncate table dfa_stage.dfa_projectclaim;
truncate table dfa_stage.dfa_projectstatusreport;
truncate table dfa_stage.dfa_publicsectorreportcommunitiesdata;
truncate table dfa_stage.dfa_publicsectorstatusreport;
truncate table dfa_stage.dfa_region;
truncate table dfa_stage.dfa_regionaldistrict;
truncate table dfa_stage.incident;