# language:en
# encoding UTF-8

@Bulk
Feature: Waterfall request miscellaneous batch input via UAT-WSM API


  @Miscellaneous
  Scenario Outline:Request positive adjust <Brand> fee account
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def brand = <Brand>
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectAccount(brand)
    * def accountNumber = massaDados.ACCT_NUMBER
    * def tranAmount = Amount
    * def tranType = Type
    * def valueDate = Java.type('br.com.fiserv.utils.utils').notationToDate()
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/miscellaneousBatchInput.json')
    * print body
    Given url UAT_WSM
    And path '/tranprocessing/miscbatch'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


    @Positive @VisaCredit
    Examples:
      | Brand         | Type | Amount   |
      | "VISA Credit" | 950  | 00025000 |

    @Negative @VisaCredit
    Examples:
      | Brand         | Type | Amount   |
      | "VISA Credit" | 951  | 00015000 |

    @Positive @VisaDebit
    Examples:
      | Brand        | Type | Amount   |
      | "VISA Debit" | 950  | 00025000 |

    @Negative @VisaDebit
    Examples:
      | Brand        | Type | Amount   |
      | "VISA Debit" | 951  | 00015000 |

    @Positive @Fees
    Examples:
      | Brand       | Type | Amount   |
      | "Fees/Adj." | 950  | 00025000 |

    @Negative @Fees
    Examples:
      | Brand       | Type | Amount   |
      | "Fees/Adj." | 951  | 00015000 |