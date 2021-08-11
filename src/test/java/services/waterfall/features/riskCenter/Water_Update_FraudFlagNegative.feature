# language:en
# encoding UTF-8

@RiskCenter
Feature: Waterfall request Update Fraud Flag

  @UpdateContract
  Scenario Outline: Request Update Fraud Flag via UAT-WSM API
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def merchantId = <Merchant>
    * def institution = <Institution>
    * def auditTrail = <AuditTrail>
    * def flag = FLag
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/updateFraudFlagNegative.json')
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

    @Negative
    Examples:
      | FLag | StatusCode | Merchant | Institution | AuditTrail |
      | 1    | "8"        | ""       | "00000003"  | "100366"   |

    @Negative
    Examples:
      | FLag | StatusCode | Merchant | Institution | AuditTrail |
      | 0    | "8"        | ""       | "00000003"  | "100366"   |

    @Negative
    Examples:
      | FLag | StatusCode | Merchant   | Institution | AuditTrail |
      | 1    | "8"        | "19999901" | "00000003"  | ""         |

    @Negative
    Examples:
      | FLag | StatusCode | Merchant   | Institution | AuditTrail |
      | 0    | "8"        | "19999901" | "00000003"  | ""         |

    @Negative
    Examples:
      | FLag | StatusCode | Merchant   | Institution | AuditTrail |
      |      | "8"        | "19999901" | "00000003"  | "100366"   |

    @Negative
    Examples:
      | FLag | StatusCode | Merchant   | Institution | AuditTrail |
      | " "  | "9"        | "19999901" | "00000003"  | "100366"   |

    @Negative
    Examples:
      | FLag | StatusCode | Merchant   | Institution | AuditTrail |
      | "a"  | "9"        | "19999901" | "00000003"  | "100366"   |

    @Negative
    Examples:
      | FLag | StatusCode | Merchant   | Institution | AuditTrail |
      | 1    | "2"        | "99999999" | "00000003"  | "100366"   |

    @Negative
    Examples:
      | FLag | StatusCode | Merchant   | Institution | AuditTrail |
      | 0    | "2"        | "99999999" | "00000003"  | "100366"   |