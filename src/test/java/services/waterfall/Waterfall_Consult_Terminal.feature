# language:en
# encoding UTF-8

@Terminal
Feature: Waterfall request new terminal

  @Consult @TEF
  Scenario: Cancel new TEF Dedicated terminal request
    * def new_terminal = callonce read('classpath:services/waterfall/Waterfall_Terminal_Request.feature@TEF')
    * def result = new_terminal.response
    * def referenceId = get result.processMessage[*].tmsDetails.tmsInformationList[*].tmsReferenceID
    * print referenceId
    Given url 'https://racvwb1001.1dc.com/tms-cos/rest/consultaos/v2/json/byos/00000003/'
    And path referenceId
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    * print response
    And match response.retornoCodigo contains "00"

