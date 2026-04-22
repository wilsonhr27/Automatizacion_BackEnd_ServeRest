@regresion
Feature: Eliminar un usuario del sistema.

  Background:
    * url baseUrl
    * def data = call read('classpath:examples/Data/Usuario1.js')

  Scenario: Eliminar usuario correctamente
    Given path '/usuarios'
    And request data
    When method POST
    Then status 201
    * def userId = response._id

    Given path '/usuarios', userId
    When method DELETE
    Then status 200

  Scenario: Eliminar usuario inexistente
    Given path '/usuarios/999999'
    When method DELETE
    Then status 200