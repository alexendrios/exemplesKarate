# language:en
# encoding UTF-8

@Bulk @Reversal
Feature: Waterfall request batch input reversal via UAT-WSM API


  Scenario: Request batch input reversal Amex Credit
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Amex','Credit')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Amex Merchant Install
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Amex','install')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Amex Issuer Install
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Amex','Issuer')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"



  Scenario: Request batch input reversal Amex Credit
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Hiper','Credit')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Amex Merchant Install
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Hiper','install')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Amex Issuer Install
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Hiper','Issuer')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"



  Scenario: Request batch input reversal Merchant Master Debit
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Master','Debit')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Master','Credit')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit Installments
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Master','Install')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit Issuer Install
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Master','Issuer')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Debit
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Visa','Debit')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Visa','Credit')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit Installments
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Visa','Install')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit Issuer Install
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Visa','Issuer')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Debit
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Elo','Debit')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Elo','Credit')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit Installments
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Elo','Install')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit Issuer Install
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Elo','Issuer')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Debit
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Cabal','Debit')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Cabal','Credit')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit Installments
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Cabal','Install')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"


  Scenario: Request batch input reversal Merchant Master Credit Issuer Install
    * def auth_token = callonce read('classpath:services/auth/auth_waterfall.feature@Token')
    * def massaDados = Java.type('br.com.fiserv.dataBase.DataBase').selectTransactionToCancel('Cabal','Issuer')
    * print massaDados
    * def merchantId = massaDados.MERCHANT_NUMBER
    * def terminalId = massaDados.TERMINAL_ID
    * def amount = massaDados.TRAN_AMOUNT_GR
    * def retrievalReference = massaDados.RETRIEVAL_REFERENCE
    * def tranDate = massaDados.TRANSACTION_DATE
    * def authCode = massaDados.AUTH_CODE
    * def body = read('classpath:services/waterfall/data/payload/'+ env +'/batchInputReversal.json')
    * print body
    Given url UAT_WSM
    And path /tranprocessing/refunds/refundreversal/
    And header authorization = 'Bearer ' + auth_token.response.access_token
    And header Content-Type = 'application/json'
    And request body
    When method post
    Then status 200
    * print response
    * def result = response
    And match result.processMessage[*].response.responseInformationList[*].responseCode contains "00"