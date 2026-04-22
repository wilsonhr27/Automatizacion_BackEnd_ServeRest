@regresion
Feature: Buscar un usuario por su ID.

  Background:
    * url baseUrl
    * def data = call read('classpath:examples/Data/Usuario1.js')

  Scenario: Obtener usuario existente
    Given path '/usuarios'
    And request data
    When method POST
    Then status 201
    * def userId = response._id

    Given path '/usuarios', userId
    When method GET
    Then status 200
    And match response._id == userId

  Scenario: Usuario no existe
    Given path '/usuarios/123456'
    When method GET
    Then status 400

