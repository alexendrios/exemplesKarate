# language:en
# encoding UTF-8

@RiskCenter
Feature: Waterfall request Update Fraud Flag

  @UpdateContract
  Scenario Outline: Request Update Fraud Flag via UAT-WSM API
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def flag = FLag
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/updateFraudFlag.json')
    Given url UAT_WSM
    And path '/fundingtools/fraudflag/updateFraudFlag'
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

    @Closed
    Examples:
      | FLag | StatusCode |
      | 0    | "0"        |