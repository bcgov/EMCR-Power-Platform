USE [EMBC]
GO

GRANT ALTER ON OBJECT::[dfa_stage].[dfa_bceiduser] TO [embc_etl];
GRANT ALTER ON OBJECT::[dfa_stage].[dfa_costsharing] TO [embc_etl];
GRANT ALTER ON OBJECT::[dfa_stage].[dfa_projectamendment] TO [embc_etl];
GRANT ALTER ON OBJECT::[dfa_stage].[dfa_projecttimer] TO [embc_etl];
GRANT ALTER ON OBJECT::[dfa_stage].[dfa_recoveryinvoice] TO [embc_etl];