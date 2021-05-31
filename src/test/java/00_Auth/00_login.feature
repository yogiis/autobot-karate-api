@ignore
Feature: Login

  Background:
    * def userCredential = read('classpath:credentials/user.json')
    * url baseUrl

  Scenario: Login Unsuccessful
    Given path '/api/login'
    When request {"email": "peter@klaven"}
    And method POST
    Then status 400
    And print 'response---', response
    And match response.error contains "Missing password"

  Scenario: Login Successful
    Given path '/api/login'
    When request userCredential
    And method POST
    Then status 200
    And print 'response---', response
    * def token = response.token