# language:en
# encoding UTF-8

@Terminal
Feature: Waterfall request new terminal

  @Cancel @TEF
  Scenario: Cancel new TEF Dedicated terminal request
    * def response = callonce read('classpath:services/waterfall/Waterfall_Consult_Terminal.feature@TEF')
    * def terminal = get response[*].ordemServico[*].numeroLogico
    * def reference = get response[*].ordemServico[*].osNumero
    * def merchant = get response[*].numeroMerchant
    * def merchantId = Java.type('br.com.fiserv.utils.utils').formatMerchantNumber(merchant)
    * def terminalId = Java.type('br.com.fiserv.utils.utils').formatMerchantNumber(terminal)
    * def referenceId = Java.type('br.com.fiserv.utils.utils').formatMerchantNumber(reference)
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