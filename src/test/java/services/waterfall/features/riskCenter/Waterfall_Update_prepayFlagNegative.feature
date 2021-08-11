# language:en
# encoding UTF-8

@RiskCenter
Feature: Waterfall request Update contract status with invalid values

  @UpdateContract
  Scenario Outline: Negative Request Update Prepayment flag to <Flag> via UAT-WSM API
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def auditTrail =  <AuditTrail>
    * def effectiveDate = <EffectiveDate>
    * def flag = FLag
    * def institutuion = <Institution>
    * def merchantId = <MerchantID>
    * def reservePercent = <ReservePercent>
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/updatePrepayFlagNegative.json')
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

    @BRTA-2638 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | "100366-prepayment-no" | 0    | "1"        | "00000003"  | "001.00"       | 11130010   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |

    @BRTA-2639 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | "100366-prepayment-no" | 1    | "1"        | "00000003"  | "001.00"       | 11130001   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |

    @BRTA-2640 @Negative
    Examples:
      | AuditTrail | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | ""         | 0    | "8"        | "00000003"  | "001.00"       | 11130010   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |

    @BRTA-2641 @Negative
    Examples:
      | AuditTrail | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | ""         | 1    | "8"        | "00000003"  | "001.00"       | 11130001   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |

    @BRTA-2642 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | "100366-prepayment-no" | 0    | "2"        | "00000003"  | "001.00"       | 99999999   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |

    @BRTA-2643 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | "100366-prepayment-no" | 1    | "2"        | "00000003"  | "001.00"       | 99999999   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |

    @BRTA-2644 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate |
      | "100366-prepayment-no" | 0    | "3"        | "00000003"  | "001.00"       | 19999901   | ""            |

    @BRTA-2645 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate |
      | "100366-prepayment-no" | 1    | "3"        | "00000003"  | "001.00"       | 19999901   | ""            |

    @BRTA-2646 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                            |
      | "100366-prepayment-no" | 1    | "4"        | "00000003"  | "001.00"       | 19999901   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-1' ,'ddMMyyyy') |

    @BRTA-2647 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | "100366-prepayment-no" | 0    | "4"        | "00000003"  | "001.00"       | 19999901   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-1','ddMMyyyy') |

    @BRTA-2648 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | "100366-prepayment-no" | 1    | "5"        | "00000003"  | ""             | 19999901   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |

    @BRTA-2650 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                            |
      | "100366-prepayment-no" | 1    | "8"        | "00000003"  | "001.00"       | ""         | Java.type('br.com.fiserv.utils.utils').notationToDate('D+1' ,'ddMMyyyy') |

    @BRTA-2651 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                            |
      | "100366-prepayment-no" | 0    | "8"        | "00000003"  | "001.00"       | ""         | Java.type('br.com.fiserv.utils.utils').notationToDate('D+1' ,'ddMMyyyy') |

    @BRTA-2652 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | "100366-prepayment-no" |      | "8"        | "00000003"  | "001.00"       | 19999901   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |

   @BRTA-2687 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | "100366-prepayment-no" | 0    | "8"        | "00000003"  | "001.00"       | null       | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |

    @BRTA-2688 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | "100366-prepayment-no" | 1    | "8"        | "00000003"  | "001.00"       | null       | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |


    @BRTA-2653 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                            |
      | "100366-prepayment-no" | " "  | "9"        | "00000003"  | "001.00"       | 19999901   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0' ,'ddMMyyyy') |

    @BRTA-2654 @Negative
    Examples:
      | AuditTrail             | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                           |
      | "100366-prepayment-no" | "a"  | "9"        | "00000003"  | "001.00"       | 19999901   | Java.type('br.com.fiserv.utils.utils').notationToDate('D-0','ddMMyyyy') |

    @BRTA-2684 @Negative
    Examples:
      | AuditTrail | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                            |
      | null       | 0    | "8"        | "00000003"  | "001.00"       | 19999901   | Java.type('br.com.fiserv.utils.utils').notationToDate('D+1' ,'ddMMyyyy') |

    @BRTA-2685 @Negative
    Examples:
      | AuditTrail | FLag | StatusCode | Institution | ReservePercent | MerchantID | EffectiveDate                                                            |
      | null       | 1    | "8"        | "00000003"  | "001.00"       | 19999901   | Java.type('br.com.fiserv.utils.utils').notationToDate('D+1' ,'ddMMyyyy') |
