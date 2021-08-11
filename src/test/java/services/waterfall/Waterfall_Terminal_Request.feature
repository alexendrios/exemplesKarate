# language:en
# encoding UTF-8

@Terminal
Feature: Waterfall request new terminal via UAT-WSM API

  @Request
  Scenario Outline:Request new terminal <Terminal>
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def effectiveDate = Java.type('br.com.fiserv.utils.utils').notationToDate('D+1','yyyyMMdd')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectMerchant()
    * print massaDados
    * def merchantId = massaDados.CLIENT_NUMBER
    * print merchantId
    * def terminalType = <Terminal_type>
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/newTerminal.json')
    Given url UAT_WSM
    And path '/devicerequest/addterminal/processAddTerminalRequest/'
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    * print body
    When method post
    Then status 200
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"

    @BRTA-2531 @TEF
    Examples:
      | Terminal      | Terminal_type |
      | TEF Dedicated | 330           |

    @BRTA-2533 @IPG
    Examples:
      | Terminal   | Terminal_type |
      | E-Comm IPG | 356           |

    @BRTA-2534 @PINPAD
    Examples:
      | Terminal   | Terminal_type |
      | PinPad USB | 306           |

    @BRTA-2535 @BATCH
    Examples:
      | Terminal   | Terminal_type |
      | Batch File | 309           |

    @BRTA-2536 @POS
    Examples:
      | Terminal      | Terminal_type |
      | POS GPRS WIFI | 364           |

    @BRTA-2537 @E-COMM
    Examples:
      | Terminal            | Terminal_type |
      | E-COMM OWN SOLUTION | 338           |