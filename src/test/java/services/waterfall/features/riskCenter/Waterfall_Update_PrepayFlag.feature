# language:en
# encoding UTF-8

@RiskCenter
Feature: Waterfall request Update contract status

  @UpdateContract
  Scenario Outline: Request Update Prepayment flag to <Flag> via UAT-WSM API
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def effectiveDate = Java.type('br.com.fiserv.utils.utils').notationToDate('D+1','ddMMyyyy')
    * def flag = FLag
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/updatePrepayFlag.json')
    Given url UAT_WSM
    And path '/fundingtools/prepayFlag/updatePrepayFlag'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    * print body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].statusCode contains <StatusCode>

    @Active
    Examples:
      | FLag | StatusCode |
      | 1    | "0"        |

    @Inactive
    Examples:
      | FLag | StatusCode |
      | 0    | "0"        |