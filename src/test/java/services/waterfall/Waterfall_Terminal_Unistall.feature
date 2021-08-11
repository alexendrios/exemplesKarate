# language:en
# encoding UTF-8

@Terminal
Feature: Waterfall Unistall terminal request

  @Unistall @IPG @BRTA-2548
  Scenario: Unistall E-Comm IPG terminal
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.OracleDao').selectTerminalIpgActive()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/unistallTerminal.json')
    * print body
    Given url UAT_WSM
    And path '/devicerequest/uninstall/processUninstallRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"

  @Unistall @TEF @BRTA-2549
  Scenario: Unistall TEF Dedicated terminal
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalTefActive()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/unistallTerminal.json')
    * print body
    Given url UAT_WSM
    And path '/devicerequest/uninstall/processUninstallRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  @Unistall @BATCH @BRTA-2550
  Scenario: Unistall BATCH File terminal
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalBatchActive()
    * def merchantId = massaDados.CLIENT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/unistallTerminal.json')
    * print body
    Given url UAT_WSM
    And path '/devicerequest/uninstall/processUninstallRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"