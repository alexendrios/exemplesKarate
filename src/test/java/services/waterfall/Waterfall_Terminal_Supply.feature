# language:en
# encoding UTF-8

@Terminal
Feature: Waterfall request new terminal

  @Supply @BRTA-2544
  Scenario:Request Supply POS terminal
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/supplyTerminal.json')
    Given url UAT_WSM
    And path '/devicerequest/supplymanual/processSupplyManualRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


