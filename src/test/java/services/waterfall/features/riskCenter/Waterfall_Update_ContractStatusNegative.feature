# language:en
# encoding UTF-8

@RiskCenter
Feature: Waterfall request Update contract status

  @UpdateContract
  Scenario Outline: Request Update contract status to <STATUS> via UAT-WSM API
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def institution = <Institution>
    * def auditTrail = <AuditTrail>
    * def merchantId = <Mercahnt>
    * def reason = <Reason>
    * def status = <Status>
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/updateContractStatusNegative.json')
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

    @BRTA-2693 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | 01     | ""     | "8"        | Active | "18239-143000-RiskCenter" | "00000003"  | "11130014" |

    @BRTA-2694 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt |
      | 01     | 1      | "8"        | Active | "18239-143000-RiskCenter" | "00000003"  | ""       |

    @BRTA-2695 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | ""     | 1      | "8"        | Active | "18239-143000-RiskCenter" | "00000003"  | "11130014" |

    @BRTA-2697 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail | Institution | Mercahnt   |
      | 01     | 1      | "8"        | Active | ""         | "00000003"  | "11130014" |

    @BRTA-2698 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail | Institution | Mercahnt   |
      | 01     | 1      | "8"        | Active | null       | "00000003"  | "11130014" |

    @BRTA-2700 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | 01     | " "    | "9"        | Active | "18239-143000-RiskCenter" | "00000003"  | "11130014" |

    @BRTA-2701 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | null   | 1      | "8"        | Active | "18239-143000-RiskCenter" | "00000003"  | "11130014" |

    @BRTA-2702 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | 01     | null   | "8"        | Active | "18239-143000-RiskCenter" | "00000003"  | "11130014" |

    @BRTA-2703 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt |
      | 01     | 1      | "8"        | Active | "18239-143000-RiskCenter" | "00000003"  | null     |

    @BRTA-2704 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | 01     | "a"    | "9"        | Active | "18239-143000-RiskCenter" | "00000003"  | "11130014" |

    @BRTA-2705 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | "aa"   | 1      | "9"        | Active | "18239-143000-RiskCenter" | "00000003"  | "11130014" |

    @BRTA-2706 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | 01     | 1      | "9"        | Active | "18239-143000-RiskCenter" | "00000003"  | "aaaaaaaa" |

    @BRTA-2707 @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt |
      | 01     | 1      | "9"        | Active | "18239-143000-RiskCenter" | "00000003"  | " "      |

    @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | " "    | 1      | "9"        | Active | "18239-143000-RiskCenter" | "00000003"  | "11130014" |

    @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | 01     | 1      | "9"        | Active | "18239-143000-RiskCenter" | "00000003"  | "99999999" |

    @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail | Institution | Mercahnt   |
      | 01     | 1      | "9"        | Active | " "        | "00000003"  | "11130014" |

    @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | "04"   | "4"    | "2"        | Active | "18239-143000-RiskCenter" | "00000007"  | "50500017" |

    @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | "01"   | "4"    | "4"        | Active | "18239-143000-RiskCenter" | "00000007"  | "50500017" |

    @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | "06"   | "4"    | "2"        | Active | "18239-143000-RiskCenter" | "00000007"  | "50500017" |

    @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | "06"   | "8"    | "3"        | Active | "18239-143000-RiskCenter" | "00000007"  | "50500017" |

    @Negative
    Examples:
      | Reason | Status | StatusCode | STATUS | AuditTrail                | Institution | Mercahnt   |
      | "01"   | "1"    | "1"        | Active | "18239-143000-RiskCenter" | "00000007"  | "77700020" |