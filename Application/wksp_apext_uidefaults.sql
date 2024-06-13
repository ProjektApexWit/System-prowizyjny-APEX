set define '^'
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
 
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to sqlplus as the schema associated with the UI defaults or as the product schema.
  wwv_flow_imp.set_security_group_id(p_security_group_id=>7216609981463151);
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_imp.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to install this file.
wwv_flow_imp.set_version(p_version_yyyy_mm_dd=>'2023.10.31');
 
end;
/

-- SET SCHEMA
 
begin
 
   wwv_flow_imp.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'WKSP_APEXT';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA WKSP_APEXT - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_230200
-- Exported 12:23 Monday June 10, 2024 by: OSKAR
--
commit;
begin 
execute immediate 'alter session set nls_numeric_characters='''||wwv_flow_imp.g_nls_numeric_chars||'''';
end;
/
set verify on
set feedback on
prompt  ...done
