﻿CREATE TABLE [dfa_stage].[dfa_projectclaim] (
    [createdby]                                         UNIQUEIDENTIFIER NULL,
    [createdbyname]                                     NVARCHAR (200)   NULL,
    [createdbyyominame]                                 NVARCHAR (200)   NULL,
    [createdon]                                         DATETIME         NULL,
    [createdonbehalfby]                                 UNIQUEIDENTIFIER NULL,
    [createdonbehalfbyname]                             NVARCHAR (200)   NULL,
    [createdonbehalfbyyominame]                         NVARCHAR (200)   NULL,
    [dfa_caseid]                                        UNIQUEIDENTIFIER NULL,
    [dfa_caseidname]                                    NVARCHAR (200)   NULL,
    [dfa_claimamount]                                   NUMERIC (38, 4)  NULL,
    [dfa_claimamount_base]                              NUMERIC (38, 4)  NULL,
    [dfa_claimpaiddate]                                 DATETIME         NULL,
    [dfa_claimreceiveddate]                             DATETIME         NULL,
    [dfa_name]                                          NVARCHAR (100)   NULL,
    [dfa_onetimedeductionamount]                        NUMERIC (38, 2)  NULL,
    [dfa_onetimedeductionamount_base]                   NUMERIC (38, 2)  NULL,
    [dfa_projectclaimid]                                UNIQUEIDENTIFIER NOT NULL,
    [dfa_projectstatusreportid]                         UNIQUEIDENTIFIER NULL,
    [dfa_projectstatusreportidname]                     NVARCHAR (200)   NULL,
    [dfa_recoveryplanid]                                UNIQUEIDENTIFIER NULL,
    [dfa_recoveryplanidname]                            NVARCHAR (100)   NULL,
    [exchangerate]                                      NUMERIC (38, 10) NULL,
    [importsequencenumber]                              INT              NULL,
    [modifiedby]                                        UNIQUEIDENTIFIER NULL,
    [modifiedbyname]                                    NVARCHAR (200)   NULL,
    [modifiedbyyominame]                                NVARCHAR (200)   NULL,
    [modifiedon]                                        DATETIME         NULL,
    [modifiedonbehalfby]                                UNIQUEIDENTIFIER NULL,
    [modifiedonbehalfbyname]                            NVARCHAR (200)   NULL,
    [modifiedonbehalfbyyominame]                        NVARCHAR (200)   NULL,
    [overriddencreatedon]                               DATETIME         NULL,
    [ownerid]                                           UNIQUEIDENTIFIER NULL,
    [owneridname]                                       NVARCHAR (200)   NULL,
    [owneridtype]                                       NVARCHAR (64)    NULL,
    [owneridyominame]                                   NVARCHAR (200)   NULL,
    [owningbusinessunit]                                UNIQUEIDENTIFIER NULL,
    [owningteam]                                        UNIQUEIDENTIFIER NULL,
    [owninguser]                                        UNIQUEIDENTIFIER NULL,
    [statecode]                                         INT              NULL,
    [statecodename]                                     NVARCHAR (255)   NULL,
    [statuscode]                                        INT              NULL,
    [statuscodename]                                    NVARCHAR (255)   NULL,
    [timezoneruleversionnumber]                         INT              NULL,
    [transactioncurrencyid]                             UNIQUEIDENTIFIER NULL,
    [transactioncurrencyidname]                         NVARCHAR (100)   NULL,
    [utcconversiontimezonecode]                         INT              NULL,
    [versionnumber]                                     BIGINT           NULL,
    [dfa_isfirstclaim]                                  BIT              NULL,
    [dfa_isfirstclaimname]                              NVARCHAR (255)   NULL,
    [Created_Load_Id]                                   INT              NULL,
    [Modified_Load_Id]                                  INT              NULL,
    [dfa_adjudicatoradditionalinfore]                   BIT              NULL,
    [dfa_adjudicatoradditionalinforename]               NVARCHAR (4000)  NULL,
    [dfa_adjudicatorbluebookrates]                      BIT              NULL,
    [dfa_adjudicatorbluebookratesname]                  NVARCHAR (4000)  NULL,
    [dfa_adjudicatorcontracts]                          BIT              NULL,
    [dfa_adjudicatorcontractsname]                      NVARCHAR (4000)  NULL,
    [dfa_adjudicatorgeneralledger]                      BIT              NULL,
    [dfa_adjudicatorgeneralledgername]                  NVARCHAR (4000)  NULL,
    [dfa_adjudicatorovertimewagedocumentation]          BIT              NULL,
    [dfa_adjudicatorovertimewagedocumentationname]      NVARCHAR (4000)  NULL,
    [dfa_adjudicatorproofofpayment]                     BIT              NULL,
    [dfa_adjudicatorproofofpaymentname]                 NVARCHAR (4000)  NULL,
    [dfa_adjudicatorreviewedinvoice]                    BIT              NULL,
    [dfa_adjudicatorreviewedinvoicename]                NVARCHAR (4000)  NULL,
    [dfa_adjustmentclaimunderreview]                    BIT              NULL,
    [dfa_adjustmentclaimunderreviewname]                NVARCHAR (4000)  NULL,
    [dfa_approvalpendingadditionalinforequested]        BIT              NULL,
    [dfa_approvalpendingadditionalinforequestedname]    NVARCHAR (4000)  NULL,
    [dfa_approvalpendinginprogress]                     BIT              NULL,
    [dfa_approvalpendinginprogressname]                 NVARCHAR (4000)  NULL,
    [dfa_approvalpendingrole]                           INT              NULL,
    [dfa_approvalpendingrolename]                       NVARCHAR (4000)  NULL,
    [dfa_approvedtotal]                                 NUMERIC (38, 4)  NULL,
    [dfa_approvedtotal_base]                            NUMERIC (38, 4)  NULL,
    [dfa_approvedtotal_date]                            DATETIME         NULL,
    [dfa_approvedtotal_state]                           INT              NULL,
    [dfa_approvedtotalcopy]                             NUMERIC (38, 4)  NULL,
    [dfa_approvedtotalcopy_base]                        NUMERIC (38, 4)  NULL,
    [dfa_approvedtotalminuscostsharing]                 NUMERIC (38, 2)  NULL,
    [dfa_approvedtotalminuscostsharing_base]            NUMERIC (38, 2)  NULL,
    [dfa_approvedtotalminuscostsharingcopy]             NUMERIC (38, 4)  NULL,
    [dfa_approvedtotalminuscostsharingcopy_base]        NUMERIC (38, 4)  NULL,
    [dfa_assignedtoadjudicator]                         BIT              NULL,
    [dfa_assignedtoadjudicatorname]                     NVARCHAR (4000)  NULL,
    [dfa_bpfclosedate]                                  DATE             NULL,
    [dfa_claimbpfstages]                                INT              NULL,
    [dfa_claimbpfstagesname]                            NVARCHAR (4000)  NULL,
    [dfa_claimbpfsubstages]                             INT              NULL,
    [dfa_claimbpfsubstagesname]                         NVARCHAR (4000)  NULL,
    [dfa_claimeligiblegstcopy]                          NUMERIC (38, 4)  NULL,
    [dfa_claimeligiblegstcopy_base]                     NUMERIC (38, 4)  NULL,
    [dfa_claimreceivedbyemcrdate]                       DATE             NULL,
    [dfa_claimtotal]                                    NUMERIC (38, 4)  NULL,
    [dfa_claimtotal_base]                               NUMERIC (38, 4)  NULL,
    [dfa_claimtotal_date]                               DATETIME         NULL,
    [dfa_claimtotal_state]                              INT              NULL,
    [dfa_claimtotalcopy]                                NUMERIC (38, 4)  NULL,
    [dfa_claimtotalcopy_base]                           NUMERIC (38, 4)  NULL,
    [dfa_compliancecheckadditionalinfore]               BIT              NULL,
    [dfa_compliancecheckadditionalinforename]           NVARCHAR (4000)  NULL,
    [dfa_compliancecheckbluebookrates]                  BIT              NULL,
    [dfa_compliancecheckbluebookratesname]              NVARCHAR (4000)  NULL,
    [dfa_compliancecheckcontracts]                      BIT              NULL,
    [dfa_compliancecheckcontractsname]                  NVARCHAR (4000)  NULL,
    [dfa_compliancecheckgeneralledger]                  BIT              NULL,
    [dfa_compliancecheckgeneralledgername]              NVARCHAR (4000)  NULL,
    [dfa_compliancecheckovertimewagedocumentation]      BIT              NULL,
    [dfa_compliancecheckovertimewagedocumentationname]  NVARCHAR (4000)  NULL,
    [dfa_compliancecheckproofofpayment]                 BIT              NULL,
    [dfa_compliancecheckproofofpaymentname]             NVARCHAR (4000)  NULL,
    [dfa_compliancecheckreviewedinvoice]                BIT              NULL,
    [dfa_compliancecheckreviewedinvoicename]            NVARCHAR (4000)  NULL,
    [dfa_costsharing]                                   NUMERIC (38, 2)  NULL,
    [dfa_costsharingadjustment]                         NUMERIC (38, 4)  NULL,
    [dfa_costsharingadjustment_base]                    NUMERIC (38, 4)  NULL,
    [dfa_costsharingadjustmentvalue]                    NUMERIC (38, 4)  NULL,
    [dfa_costsharingadjustmentvalue_base]               NUMERIC (38, 4)  NULL,
    [dfa_costsharingtemp]                               NUMERIC (38, 2)  NULL,
    [dfa_createdonportal]                               BIT              NULL,
    [dfa_createdonportalname]                           NVARCHAR (4000)  NULL,
    [dfa_decision]                                      INT              NULL,
    [dfa_decisioncopy]                                  INT              NULL,
    [dfa_decisioncopyname]                              NVARCHAR (4000)  NULL,
    [dfa_decisionname]                                  NVARCHAR (4000)  NULL,
    [dfa_eligiblepayable]                               NUMERIC (38, 4)  NULL,
    [dfa_eligiblepayable_base]                          NUMERIC (38, 4)  NULL,
    [dfa_eligiblerecoverypayableat90]                   NUMERIC (38, 4)  NULL,
    [dfa_eligiblerecoverypayableat90_base]              NUMERIC (38, 4)  NULL,
    [dfa_expenseauthority]                              BIT              NULL,
    [dfa_expenseauthorityadditionalinfore]              BIT              NULL,
    [dfa_expenseauthorityadditionalinforename]          NVARCHAR (4000)  NULL,
    [dfa_expenseauthoritybluebookrates]                 BIT              NULL,
    [dfa_expenseauthoritybluebookratesname]             NVARCHAR (4000)  NULL,
    [dfa_expenseauthoritycontracts]                     BIT              NULL,
    [dfa_expenseauthoritycontractsname]                 NVARCHAR (4000)  NULL,
    [dfa_expenseauthoritygeneralledger]                 BIT              NULL,
    [dfa_expenseauthoritygeneralledgername]             NVARCHAR (4000)  NULL,
    [dfa_expenseauthorityname]                          NVARCHAR (4000)  NULL,
    [dfa_expenseauthorityovertimewagedocumentation]     BIT              NULL,
    [dfa_expenseauthorityovertimewagedocumentationname] NVARCHAR (4000)  NULL,
    [dfa_expenseauthorityproofofpayment]                BIT              NULL,
    [dfa_expenseauthorityproofofpaymentname]            NVARCHAR (4000)  NULL,
    [dfa_expenseauthorityreviewedinvoice]               BIT              NULL,
    [dfa_expenseauthorityreviewedinvoicename]           NVARCHAR (4000)  NULL,
    [dfa_finalclaim]                                    BIT              NULL,
    [dfa_finalclaimname]                                NVARCHAR (4000)  NULL,
    [dfa_invoicechange]                                 BIT              NULL,
    [dfa_invoicechangename]                             NVARCHAR (4000)  NULL,
    [dfa_isadjustmentclaim]                             BIT              NULL,
    [dfa_isadjustmentclaimname]                         NVARCHAR (4000)  NULL,
    [dfa_lessfirst1000]                                 NUMERIC (38, 4)  NULL,
    [dfa_lessfirst1000_base]                            NUMERIC (38, 4)  NULL,
    [dfa_paidclaimamount]                               NUMERIC (38, 4)  NULL,
    [dfa_paidclaimamount_base]                          NUMERIC (38, 4)  NULL,
    [dfa_portalsubmitted]                               BIT              NULL,
    [dfa_portalsubmittedname]                           NVARCHAR (4000)  NULL,
    [dfa_qualifiedreceiveradditionalinfore]             BIT              NULL,
    [dfa_qualifiedreceiveradditionalinforename]         NVARCHAR (4000)  NULL,
    [dfa_qualifiedreceiverbluebookrates]                BIT              NULL,
    [dfa_qualifiedreceiverbluebookratesname]            NVARCHAR (4000)  NULL,
    [dfa_qualifiedreceivercontracts]                    BIT              NULL,
    [dfa_qualifiedreceivercontractsname]                NVARCHAR (4000)  NULL,
    [dfa_qualifiedreceivergeneralledger]                BIT              NULL,
    [dfa_qualifiedreceivergeneralledgername]            NVARCHAR (4000)  NULL,
    [dfa_qualifiedreceiverovertimewagedocumentatio]     BIT              NULL,
    [dfa_qualifiedreceiverovertimewagedocumentationame] NVARCHAR (4000)  NULL,
    [dfa_qualifiedreceiverproofofpayment]               BIT              NULL,
    [dfa_qualifiedreceiverproofofpaymentname]           NVARCHAR (4000)  NULL,
    [dfa_qualifiedreceiverreviewedinvoice]              BIT              NULL,
    [dfa_qualifiedreceiverreviewedinvoicename]          NVARCHAR (4000)  NULL,
    [dfa_recommendataion]                               NVARCHAR (100)   NULL,
    [dfa_stageadjudicator]                              INT              NULL,
    [dfa_stageapprovedpending]                          INT              NULL,
    [dfa_stageclosed]                                   INT              NULL,
    [dfa_stagecompliancecheck]                          INT              NULL,
    [dfa_stagedecisionmade]                             INT              NULL,
    [dfa_stagedraft]                                    INT              NULL,
    [dfa_stageexpenseauthority]                         INT              NULL,
    [dfa_stagequalifiedreceiver]                        INT              NULL,
    [dfa_stagesubmitted]                                INT              NULL,
    [dfa_stageunderreview]                              INT              NULL,
    [dfa_submitted]                                     BIT              NULL,
    [dfa_submittedbpf]                                  INT              NULL,
    [dfa_submittedbpfname]                              NVARCHAR (4000)  NULL,
    [dfa_submittedname]                                 NVARCHAR (4000)  NULL,
    [dfa_tempapproval]                                  BIT              NULL,
    [dfa_tempapprovalname]                              NVARCHAR (4000)  NULL,
    [dfa_totalactualclaim]                              NUMERIC (38, 4)  NULL,
    [dfa_totalactualclaim_base]                         NUMERIC (38, 4)  NULL,
    [dfa_totalactualclaim_date]                         DATETIME         NULL,
    [dfa_totalactualclaim_state]                        INT              NULL,
    [dfa_totalactualclaimcopy]                          NUMERIC (38, 4)  NULL,
    [dfa_totalactualclaimcopy_base]                     NUMERIC (38, 4)  NULL,
    [dfa_totalactualinvoice]                            NUMERIC (38, 4)  NULL,
    [dfa_totalactualinvoice_base]                       NUMERIC (38, 4)  NULL,
    [dfa_totalapproved]                                 NUMERIC (38, 4)  NULL,
    [dfa_totalapproved_base]                            NUMERIC (38, 4)  NULL,
    [dfa_totalapproved_date]                            DATETIME         NULL,
    [dfa_totalapproved_state]                           INT              NULL,
    [dfa_totaleligiblegst]                              NUMERIC (38, 4)  NULL,
    [dfa_totaleligiblegst_base]                         NUMERIC (38, 4)  NULL,
    [dfa_totaleligiblegst_date]                         DATETIME         NULL,
    [dfa_totaleligiblegst_state]                        INT              NULL,
    [dfa_totaleligiblegstcopy]                          NUMERIC (38, 4)  NULL,
    [dfa_totaleligiblegstcopy_base]                     NUMERIC (38, 4)  NULL,
    [dfa_totalgrossgst]                                 NUMERIC (38, 4)  NULL,
    [dfa_totalgrossgst_base]                            NUMERIC (38, 4)  NULL,
    [dfa_totalgrossgst_date]                            DATETIME         NULL,
    [dfa_totalgrossgst_state]                           INT              NULL,
    [dfa_totalgrossgstcopy]                             NUMERIC (38, 4)  NULL,
    [dfa_totalgrossgstcopy_base]                        NUMERIC (38, 4)  NULL,
    [dfa_totalnetinvoicedbeingclaimed]                  NUMERIC (38, 4)  NULL,
    [dfa_totalnetinvoicedbeingclaimed_base]             NUMERIC (38, 4)  NULL,
    [dfa_totalnetinvoicedbeingclaimed_date]             DATETIME         NULL,
    [dfa_totalnetinvoicedbeingclaimed_state]            INT              NULL,
    [dfa_totalnetinvoicedbeingclaimedcopy]              NUMERIC (38, 4)  NULL,
    [dfa_totalnetinvoicedbeingclaimedcopy_base]         NUMERIC (38, 4)  NULL,
    [dfa_totaloftotaleligible]                          NUMERIC (38, 4)  NULL,
    [dfa_totaloftotaleligible_base]                     NUMERIC (38, 4)  NULL,
    [dfa_totalpaid]                                     NUMERIC (38, 4)  NULL,
    [dfa_totalpaid_base]                                NUMERIC (38, 4)  NULL,
    [dfa_totalpst]                                      NUMERIC (38, 4)  NULL,
    [dfa_totalpst_base]                                 NUMERIC (38, 4)  NULL,
    [dfa_totalpst_date]                                 DATETIME         NULL,
    [dfa_totalpst_state]                                INT              NULL,
    [dfa_totalpstcopy]                                  NUMERIC (38, 4)  NULL,
    [dfa_totalpstcopy_base]                             NUMERIC (38, 4)  NULL,
    [dfa_underreviewadditionalinforequested]            BIT              NULL,
    [dfa_underreviewadditionalinforequestedname]        NVARCHAR (4000)  NULL,
    [dfa_underreviewinprogress]                         BIT              NULL,
    [dfa_underreviewinprogressname]                     NVARCHAR (4000)  NULL,
    [processid]                                         UNIQUEIDENTIFIER NULL,
    [stageid]                                           UNIQUEIDENTIFIER NULL,
    [traversedpath]                                     NVARCHAR (1250)  NULL,
    CONSTRAINT [PK_dfa_projectclaim] PRIMARY KEY CLUSTERED ([dfa_projectclaimid] ASC)
);

