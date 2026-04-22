@regresion
Feature: Actualizar la información de un usuario existente.

  Background:
    * url baseUrl
    * def data = call read('classpath:examples/Data/Usuario1.js')

  Scenario: Actualizar usuario exitosamente
    Given path '/usuarios'
    And request data
    When method POST
    Then status 201
    * def userId = response._id

    * def newData = call read('classpath:examples/Data/Usuario1.js')

    Given path '/usuarios', userId
    And request newData
    When method PUT
    Then status 200
    And match response.message == "Registro alterado com sucesso"

  Scenario: Actualizar usuario inexistente o duplicado
    Given path '/usuarios/999999'
    And request data
    When method PUT
    Then status 201