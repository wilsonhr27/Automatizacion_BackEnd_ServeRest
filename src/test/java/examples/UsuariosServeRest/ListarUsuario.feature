@regresion
Feature: Obtener lista de todos los usuarios.

  Background:
    * url baseUrl

  Scenario: Listar usuarios correctamente
    Given path '/usuarios'
    When method GET
    Then status 200
    And match response.usuarios != null