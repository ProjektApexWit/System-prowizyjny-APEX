create or replace PROCEDURE send_2fa_token(p_authy_id IN VARCHAR2) IS
    l_response CLOB;
BEGIN
    l_response := apex_web_service.make_rest_request(
        p_url => 'https://api.authy.com/protected/json/sms/' || p_authy_id,
        p_http_method => 'GET',
        p_username => 'YOUR_API_KEY'
    );
END send_2fa_token;
/