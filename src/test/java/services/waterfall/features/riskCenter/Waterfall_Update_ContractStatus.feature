# language:en
# encoding UTF-8

@RiskCenter
Feature: Waterfall request Update contract status

  @UpdateContract
  Scenario Outline: Request Update contract status to <STATUS> via UAT-WSM API
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def reason = Reason
    * def status = Status
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/updateContractStatus.json')
    Given url UAT_WSM
    And path '/fundingtools/contractStatus/updateContractStatus'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    * print body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].statusCode contains <StatusCode>

    @BRTA-0005 @Active
    Examples:
      | Reason | Status | StatusCode | STATUS |
      | 01     | 1      | "0"        | Active |

#    @BRTA-0002 @Closed
#    Examples:
#      | Reason | Status | StatusCode | STATUS |
#      | 09     | 2      | "0"        | Closed |

    @BRTA-0003 @Dormant
    Examples:
      | Reason | Status | StatusCode | STATUS  |
      | 02     | 3      | "0"        | Dormant |

    @BRTA-0004 @Suspend
    Examples:
      | Reason | Status | StatusCode | STATUS  |
      | 04     | 4      | "0"        | Suspend |