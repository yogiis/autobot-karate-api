@test
Feature: CRUD

  Background:
    * def SchemaUtils = Java.type('utils.SchemaUtils')
    * string schemaSingleUser = read('classpath:01_CRUD/schema/singleUser.json')
    * def payload = read('classpath:01_CRUD/payload/putUser.json')
    * def util = call read('classpath:helper/common.feature')
    * string jobUtil = util.random_alphabet(7)
    * url baseUrl

  Scenario Outline: Create
    Given path '/api/users'
    When request
    """
      {
      "name": '<names>',
      "job": '<jobs>'
      }
    """
    And method POST
    Then status 201
    And print 'response---', response
    And match response.name contains '#(names)'
    And match response.job contains '#(jobs)'
    Examples:
      | names    | jobs        |
      | morpheus | leader      |
      | yogi     | owner       |
      | tasya    | supervisor  |

  Scenario: List User
    Given path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print 'response---', response
    And match each response.data contains {"id": '#number', "email": '#string', "first_name": '#string', "last_name": '#string', "avatar": '#string'}

  Scenario: Single User
    Given path '/api/users/2'
    And method GET
    Then status 200
    And print 'response---', response
    And assert SchemaUtils.isValid(response, schemaSingleUser)
    And assert responseTime < 1000

  Scenario: Update
    * set payload.job = jobUtil
    Given path '/api/users/2'
    When request payload
    And method PUT
    Then status 200
    And print 'response---', response
    And match response.name contains "morpheus"
    And match response.job contains '#(jobUtil)'

  Scenario: Delete
    Given path '/api/users/2'
    When method DELETE
    Then status 204
    And print 'response---', response






