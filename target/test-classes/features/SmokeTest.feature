@SmokeTest
Feature: Authentication Smoke Test

  Scenario: Generate toke with valid username and password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
    And header Authorization = "Bearer " + generatedToken
    
    Scenario: Generate token with invalid username and valid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervis","password": "tek_supervisor"}
    When method post
    Then status 404
    * def generatedToken = response.token
    And header Authorization = "Bearer " + generatedToken
