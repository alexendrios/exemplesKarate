# language:en
# encoding UTF-8

@Terminal
Feature: Waterfall request Change replace terminal

  @Change @BRTA-2547
  Scenario Outline:Request Change <Terminal> to <TerminalType>
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTerminalChange()
    * print massaDados
    * def effectiveDate = Java.type('br.com.fiserv.utils.utils').notationToDate()
    * def terminalId = massaDados.TERMINAL_ID
    * def merchantId = massaDados.CLIENT_NUMBER
    * def type = TerminalType
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/changeTerminal.json')
    Given url UAT_WSM
    And path '/devicerequest/replacechange/processReplaceChangeRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    * print body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"

    Examples:
      | Terminal       | TerminalType |
      | E Comm Sub-Acq | 356          |