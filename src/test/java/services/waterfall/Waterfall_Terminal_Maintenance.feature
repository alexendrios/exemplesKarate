# language:en
# encoding UTF-8

@Terminal
Feature: Waterfall terminal Maintenance request via UAT-WSM API

  @Maintenance @IPG @BRTA-2546
  Scenario:Request IPG Maintenance Terminal
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalIpgActive()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/maintenanceTerminal.json')
    Given url UAT_WSM
    And path '/devicerequest/maintenance/processMaintenanceRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  @Maintenance @TEF @BRTA-2545
  Scenario:Request TEF Maintenance Terminal
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalTefActive()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/maintenanceTerminal.json')
    Given url UAT_WSM
    And path '/devicerequest/maintenance/processMaintenanceRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"