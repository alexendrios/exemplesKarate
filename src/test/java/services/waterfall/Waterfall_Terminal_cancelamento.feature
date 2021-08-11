# language:en
# encoding UTF-8

@Terminal
Feature: Waterfall request new terminal

  @Cancel @BRTA-2538 @TEF
  Scenario: Cancel new TEF Dedicated terminal request
    * def new_terminal = callonce read('classpath:services/waterfall/Waterfall_Terminal_Request.feature@TEF')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalData()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def referenceId = massaDados.TMS_REFERENCE_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/cancelamentoTerminal.json')
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    Given url UAT_WSM
    And path '/devicerequest/canceloperation/processCancelOperationRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  @Cancel @IPG @BRTA-2539
  Scenario: Cancel new E-Comm IPG terminal request
    * def new_terminal = callonce read('classpath:services/waterfall/Waterfall_Terminal_Request.feature@IPG')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalData()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def referenceId = massaDados.TMS_REFERENCE_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/cancelamentoTerminal.json')
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    Given url UAT_WSM
    And path '/devicerequest/canceloperation/processCancelOperationRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  @Cancel @POS @BRTA-2540
  Scenario: Cancel new POS GPRS Wifi terminal request
    * def new_terminal = callonce read('classpath:services/waterfall/Waterfall_Terminal_Request.feature@POS')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalData()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def referenceId = massaDados.TMS_REFERENCE_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/cancelamentoTerminal.json')
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    Given url UAT_WSM
    And path '/devicerequest/canceloperation/processCancelOperationRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"

  @Cancel @PINPAD @BRTA-2541
  Scenario: Cancel new PINPAD USB terminal request
    * def new_terminal = callonce read('classpath:services/waterfall/Waterfall_Terminal_Request.feature@PINPAD')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalData()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def referenceId = massaDados.TMS_REFERENCE_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/cancelamentoTerminal.json')
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    Given url UAT_WSM
    And path '/devicerequest/canceloperation/processCancelOperationRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  @Cancel @BATCH @BRTA-2542
  Scenario: Cancel new BATCH File terminal request
    * def new_terminal = callonce read('classpath:services/waterfall/Waterfall_Terminal_Request.feature@BATCH')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalData()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def referenceId = massaDados.TMS_REFERENCE_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/cancelamentoTerminal.json')
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    Given url UAT_WSM
    And path '/devicerequest/canceloperation/processCancelOperationRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  @Cancel @E-COMM @BRTA-2543
  Scenario: Cancel new E-Comm Own Solution terminal request
    * def new_terminal = callonce read('classpath:services/waterfall/Waterfall_Terminal_Request.feature@E-COMM')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalData()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def referenceId = massaDados.TMS_REFERENCE_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/cancelamentoTerminal.json')
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    Given url UAT_WSM
    And path '/devicerequest/canceloperation/processCancelOperationRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"