@regresion
Feature: Registrar un nuevo usuario con datos válidos.

  Background:
    * url baseUrl
    * def data = call read('classpath:examples/Data/Usuario1.js')
    * def data1 = read('classpath:examples/Data/Usuario.json')

  Scenario: Crear usuario exitosamente
    Given path '/usuarios'
    And request data
    When method POST
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"
    And match response._id != null

  Scenario: Crear usuario duplicado o negativo
    Given path '/usuarios'
    And request data1
    When method POST
    Then status 400