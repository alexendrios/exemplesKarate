SELECT
      CTP.CLIENT_NUMBER
     ,CTP.TERMINAL_ID
     ,CTP.TMS_REFERENCE_ID
 FROM BW3.CIS_TMS_PARAMETERS CTP
 LEFT JOIN BW3.CHT_DEVICE_REQUEST CDR
     ON CTP.TMS_REQUEST = CDR.INDEX_FIELD
     AND CDR.LANGUAGE = 'POR'
 LEFT JOIN BW3.CHT_PROCESSING_STATUS CPS
     ON CTP.STATUS = CPS.INDEX_FIELD
     AND CPS.LANGUAGE = 'USA'
 LEFT JOIN BW3.CHT_TERMINAL_TYPE CTT
     ON CTP.MODEL_CODE = CTT.MODEL_CODE
     AND CTT.LANGUAGE = 'USA'
 LEFT JOIN BW3.CIS_TMS_PARAMETERS UNISTALL
     ON CTP.TERMINAL_ID = UNISTALL.TERMINAL_ID
     AND UNISTALL.TMS_REQUEST = '002'
 LEFT JOIN BW3.CIS_TMS_PARAMETERS MAINTENANCE
     ON CTP.TERMINAL_ID = MAINTENANCE.TERMINAL_ID
     AND MAINTENANCE.TMS_REQUEST = '003'
 LEFT JOIN BW3.CIS_TMS_PARAMETERS CLOSED
     ON CTP.TERMINAL_ID = CLOSED.TERMINAL_ID
     AND CLOSED.TMS_REQUEST = '010'
  LEFT JOIN BW3.CIS_TMS_PARAMETERS CHANGER
     ON CTP.TERMINAL_ID = CHANGER.OLD_TERMINAL_ID
     AND CHANGER.TMS_REQUEST = '011'
 LEFT JOIN BW3.CIS_CLIENT_DETAILS BCCD
     ON CTP.CLIENT_NUMBER = BCCD.CLIENT_NUMBER
     AND CTP.INSTITUTION_NUMBER = BCCD.INSTITUTION_NUMBER
 WHERE CTP.INSTITUTION_NUMBER = '00000003'
     AND CDR.DEVICE_REQUEST = 'Novo Terminal'
     AND CPS.PROCESSING_STATUS = 'Completed'
     AND CTP.TERMINAL_ID IS NOT NULL
     AND UNISTALL.TERMINAL_ID IS NULL
     AND MAINTENANCE.TERMINAL_ID IS NULL
     AND CLOSED.TERMINAL_ID IS NULL
     AND CHANGER.OLD_TERMINAL_ID IS NULL
     AND CTT.MODEL = 'E-Comm IPG'
     AND BCCD.TRADE_NAME = 'Automation_Boarding'
     AND ROWNUM = '1'