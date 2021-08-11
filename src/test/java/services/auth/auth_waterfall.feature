# language:en
# encoding UTF-8

@Token
Feature: Waterfall UAT-WSM

  Scenario: Generate token for UAT-WSM
    Given url UAT_WSM
    And path '/oauth2/token'
    And header authorization = 'Basic ZmRiLXdzOlBAc3N3MHJkRmRC'
    And header grant_type = 'client_credentials'
    And request {}
    When method post
    Then status 200
    * print response
    And match response contains {"access_token": #notnull}