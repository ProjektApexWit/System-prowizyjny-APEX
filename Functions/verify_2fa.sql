create or replace FUNCTION verify_2fa(p_authy_id IN VARCHAR2, p_token IN VARCHAR2) RETURN BOOLEAN IS
    l_response CLOB;
    l_verified BOOLEAN := FALSE;
BEGIN
    l_response := apex_web_service.make_rest_request(
        p_url => 'https://api.authy.com/protected/json/verify/' || p_token || '/' || p_authy_id,
        p_http_method => 'GET',
        p_username => 'YOUR_API_KEY'
    );

    IF l_response LIKE '%"success":true%' THEN
        l_verified := TRUE;
    END IF;

    RETURN l_verified;
END verify_2fa;
/