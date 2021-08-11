# language:en
# encoding: UTF-8

@omnicommerce @sprint7
Feature: Testes regressivos da sprint 07 da squad de Omnicommerce, com testes associados a cobrança

  Background: Url da API dessa Sprint 7
    Given url UAT_OMN
    * def number =
    """
    function(args) {
      var randomNumber = Java.type('br.com.fiserv.utils.utils');
      var rn = new randomNumber();
      return rn.randomNum(args);
    }
    """

  @TC01_OCP257
  Scenario: Integrar contratação de produtos
    * def body = read('services/omnicommerce/data/sp7_save_merchant_dictionary.json')

    Given path '/v2/merchants/dictionary'
    And set body.dictionaryIds[0].idValue = call number '3'
    And set body.dictionaryIds[1].idValue = call number '3'
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TC02_OCP257
  Scenario: Contratar produto/tecnologia
    * def body = read('services/omnicommerce/data/sp7_search_merchant_service.json')

    Given path '/v2/merchants/service-contract/search'
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TC03_OCP257
  Scenario: Informar tecnologia/produto não disponível
    * def body = read('services/omnicommerce/data/sp7_save_merchant_dictionary.json')

    Given path '/v2/merchants/dictionary'
    And set body.dictionaryIds[0].idValue = "999"
    And set body.dictionaryIds[1].idValue = "000"
    And request body
    When method post
    Then status 400
    And print response
    And match response contains deep {"isSuccess": false}

  @TCO4_OCP257
  Scenario: Armazenar protocolo de solicitação de cada tecnologia adquirida
    * def body = read('services/omnicommerce/data/sp7_search_merchant_service.json')

    Given path '/v2/merchants/service-contract/search'
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"data":{"ids":[{"value": "225"},{"value": "224"}]}}

  @TCO5_OCP257
  Scenario: Produto/tecnologia que não existe
    * def body = read('services/omnicommerce/data/sp7_save_merchant_dictionary.json')

    Given path '/v2/merchants/dictionary'
    And set body.dictionaryIds[0].idType = "INEXISTENTE"
    And set body.dictionaryIds[1].idType = "INVALIDO"
    And request body
    When method post
    Then status 400
    And print response
    And match response contains deep {"isSuccess": false}

  @TCO6_OCP257
  Scenario: Apenas um produto negado na validação
    * def body = read('services/omnicommerce/data/sp7_save_merchant_dictionary.json')

    Given path '/v2/merchants/dictionary'
    And set body.dictionaryIds[0].idType = "INEXISTENTE"
    And request body
    When method post
    Then status 400
    And print response
    And match response contains deep {"isSuccess": false}

  @TCO6_OCP257
  Scenario: Tarifas e taxas devem existir previamente no catalogo de produtos

    Given path '/v2/catalogs/products'
    And param code = 'LNK'
    When method get
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TCO7_OCP239
  Scenario: Regras para contratação de produtos
    * def body = read('services/omnicommerce/data/sp7_save_merchant_dictionary.json')

    Given path '/v2/merchants/dictionary'
    And set body.dictionaryIds[0].idValue = call number '3'
    And set body.dictionaryIds[1].idValue = call number '3'
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"data":{"merchant":{"name":"Outra empresa Filial 3"}}}

  @TCO8_OCP239
  Scenario: Obrigatoriedade das regras na contratação de produtos
    * def body = read('services/omnicommerce/data/sp7_save_merchant_dictionary.json')

    Given path '/v2/merchants/dictionary'
    And set body.dictionaryIds[0].idValue = call number '3'
    And set body.dictionaryIds[1].idValue = call number '3'
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"data":{"merchant":{"name":"Outra empresa Filial 3"}}}
