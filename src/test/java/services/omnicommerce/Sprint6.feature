# language:en
# encoding: UTF-8

@omnicommerce @sprint6
Feature: Testes regressivos da sprint 06 da squad de Omnicommerce, com testes associados a cobrança

  Background: Url base dessa Sprint 6
    Given url UAT_OMN
    * def number =
    """
    function(args) {
      var randomNumber = Java.type('br.com.fiserv.utils.utils');
      var rn = new randomNumber();
      return rn.randomNum(args);
    }
    """

  @TC01_OCP192
  Scenario: Determina tipo de cobrança
    * def body = read('services/omnicommerce/data/tc01_ocp192.json')

    Given path '/v2/catalogs/services'
    And set body.code = call number '3'
    And set body.chargetypes = [{"code":"STP"}]
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TC02_OCP192
  Scenario: Tipos de cobrança complementares
    * def body = read('services/omnicommerce/data/tc01_ocp192.json')

    Given path '/v2/catalogs/services'
    And set body.code = call number '3'
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TCO3_OCP192
  Scenario: Obrigatoriedade de selecionar ao menos um tipo de cobrança
    * def body = read('services/omnicommerce/data/tc01_ocp192.json')

    Given path '/v2/catalogs/services'
    And set body.code = call number '3'
    And set body.chargetypes = null
    And request body
    When method post
    Then status 422
    And print response
    And match response contains deep {"errors":[{"details":{"chargetypes":"must not be empty"}}]}

  @TCO4_OCP192
  Scenario: Estrutura de cobrança e serviços
    * def body = read('services/omnicommerce/data/tc04_ocp192.json')

    Given path '/v2/catalogs/products'
    And set body.code = call number '3'
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"errors":[{"description": "Success"}], "isSuccess": true}

  @TCO5_OCP192
  Scenario: Criacao de produto
    * def body = read('services/omnicommerce/data/tc04_ocp192.json')

    Given path '/v2/catalogs/products'
    And set body.code = call number '3'
    And set body.chargetypes = [{"code":"STP"}]
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TCO6_OCP192
  Scenario: Tarifas e taxas devem existir previamente no catalogo de produtos

    Given path '/v2/catalogs/products'
    And param code = 'LNK'
    When method get
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TCO7_OCP192
  Scenario: Tarifas e taxas nao podem ser duplicadas/associadas ao mesmo produto
    * def body = read('services/omnicommerce/data/tc04_ocp192.json')

    Given path '/v2/catalogs/products'
    And set body.code = 231
    And set body.chargetypes = [{"code":"STP"}]
    And request body
    When method post
    Then status 400
    And print response
    And match response contains deep {"isSuccess": false}

  @TCO8_OCP192
  Scenario: Permitir edição de tarifas e taxas
    * def body = read('services/omnicommerce/data/tc04_ocp192.json')

    Given path '/v2/catalogs/products/update'
    And set body.code = 231
    And set body.chargetypes = [{"code":"STP"}, {"code":"MDR"}]
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TCO9_OCP195
  Scenario: Determinar dependências entre produtos/serviços - WALLET
    * def body = read('services/omnicommerce/data/tc09_ocp195.json')

    Given path '/v2/catalogs/rule/products'
    And set body.code = 231
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TC10_OCP195
  Scenario: Determinar dependências entre produtos/serviços - WALLET Específica
    * def body = read('services/omnicommerce/data/tc09_ocp195.json')

    Given path '/v2/catalogs/rule/products'
    And set body.code = 231
    And set body.wallets = [3]
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TC11_OCP195
  Scenario: Impossibilidade de produtos CNP
    * def body = read('services/omnicommerce/data/tc09_ocp195.json')

    Given path '/v2/catalogs/rule/products'
    And set body.code = 231
    And remove body.availableCnp
    And remove body.restrictCnpj
    And request body
    When method post
    Then status 422
    And print response
    And match response contains deep {"errors":[{"type": "E"}]}

  @TC12_OCP195
  Scenario: Determinar as dependências entre produtos/serviços -  CNP
    * def body = read('services/omnicommerce/data/tc09_ocp195.json')

    Given path '/v2/catalogs/rule/products'
    And set body.code = "CNP"
    And set body.wallets = [3]
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TC13_OCP195
  Scenario: Restrição de segmento por MCC
    * def body = read('services/omnicommerce/data/tc09_ocp195.json')

    Given path '/v2/catalogs/rule/products'
    And set body.code = 231
    And set body.restrictMcc = "true"
    And request body
    When method post
    Then status 200
    And print response
    And match response contains deep {"isSuccess": true}

  @TC14_OCP194
  Scenario: Definição de serviços que podem ser associados a um produto contratado

    Given path '/v2/catalogs/services'
    And param code = 'TWA'
    When method get
    Then status 200
    And print response
    And match response contains deep {"data":{"business": {"code": "GTW", "name": "Gateway"}}}