SELECT MAX(CLIENT_NUMBER) CLIENT_NUMBER
FROM BW3.CIS_CLIENT_DETAILS
    WHERE TRADE_NAME = 'Automation_Boarding'
    AND  INSTITUTION_NUMBER = '00000003';