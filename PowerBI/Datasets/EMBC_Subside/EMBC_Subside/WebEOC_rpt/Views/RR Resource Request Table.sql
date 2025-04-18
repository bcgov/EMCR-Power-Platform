﻿






CREATE   VIEW [WebEOC_rpt].[RR Resource Request Table]
AS 
SELECT [dataid] [fk_table_324]  --link to Deployment table [fk_table_324] column
      ,[amount_approved]
      ,[amount_requested]
      ,[amount_requested_max]
      ,[assigned_to]
      ,[associated_event]
      ,[attachment_1]
      ,[attachment_1_description]
      ,[attachment_2]
      ,[attachment_2_name]
      ,[attachment_2_description]
      ,[attachment_3]
      ,[attachment_3_name]
      ,[attachment_3_description]
      ,[community]
      ,[coordinating_instructions]
      ,[created_by_datetime]
      ,[created_by_position]
      ,[created_by_username]
      ,[current_assignment]
      ,[current_assignment_positionid]
      ,[current_region_assignment]
      ,[current_status]
      ,[current_status_datetime]
      ,[date_time_due]
      ,[ddm_lat_decimal]
      ,[ddm_lat_degrees]
      ,[dms_lat_minutes]
      ,[ddm_long_decimal]
      ,[ddm_long_degrees]
      ,[dms_long_minutes]
      ,[delivery_address]
	  ,[delivery_location]
      ,[delivery_map_label]
      ,[dms_lat_degrees]
      ,[ddm_lat_minutes]
      ,[dms_lat_seconds]
      ,[dms_long_degrees]
      ,[ddm_long_minutes]
      ,[dms_long_seconds]
      ,[estimated_resource_cost]
      ,[expenditure_type]
      ,[incident_associated_event]
      ,[incident_community]
      ,[incident_dataid]
      ,[incident_date_time_complete]
      ,[incident_date_time_start]
      ,[incident_event_name]
      ,[incident_prognosis]
      ,[incident_region]
      ,[incident_severity]
      ,[incident_status]
      ,[incident_task_number]
      ,[incident_type]
      ,[internal_preoc_pecc_deployment_request]
      ,[last_updated_by_datetime]
      ,[last_updated_by_position]
      ,[last_updated_by_username]
      ,[location_decription]
      ,[location_description]
      ,[location_latitude]
      ,[location_longitude]
      ,[message]
      ,[nims_definintion]
      ,[nims_group]
      ,[nims_type]
      ,[open_in_new_tab]
      ,[originating_name]
      ,[originating_position]
      ,[other_resource]
      ,[primary_contact_email]
      ,[primary_contact_phone]
      ,[primary_contact_phone_alt]
      ,[priority]
      ,[quantity]
      ,[recipient]
      ,[region]
      ,[regions]
      ,[remove]
      ,[request_data_holder]
      ,[request_date_time]
      ,[request_description]
      ,[request_flag]
      ,[request_fulfilled]
      ,[request_fulfillment_comment]
      ,[request_mission]
      ,[request_number]
      ,[request_special_instructions]
      ,[request_type]
      ,[requestbox]
      ,[requester_notification_comments]
      ,[requester_notification_subject]
      ,[requester_notified_datetime]
      ,[requester_notified_of_approval_denial]
      ,[requesting_eaf]
      ,[requestor_date_time]
      ,[requestor_details]
      ,[requestor_email]
      ,[resource_category]
      ,[resource_identifier]
      ,[resource_name]
      ,[resource_quantity]
      ,[resource_quantity_weocarchive]
      ,[resource_required_date_time]
      ,[resource_required_until_date_time]
      ,[resource_type]
      ,[resource_unit_of_measure]
      ,[resource_unit_of_measure_other]
      ,[secondary_contact]
      ,[secondary_contact_email]
      ,[secondary_contact_phone]
      ,[secondary_contact_phone_alt]
      ,[status]
      ,[subject]
      ,[task_desc_short]
      ,[task_description]
      ,[task_number]
      ,[time_completed]
      ,[toggle_nims]
      ,[tracking_number]
      ,[unit]
      ,[update_comments]
----- ,[incidentid],[userid],[positionid],[prevdataid],[entrydate],[globalid],[subscribername],[primary_contact],[attachment_1_name]
----- ,[amount_requested_weocarchive],[amount_requested_max_weocarchive],[amount_approved_weocarchive]
  FROM [BCMECCS].[dbo].[table_324]
