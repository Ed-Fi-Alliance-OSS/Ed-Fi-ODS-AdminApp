# These tests needs to have a clean environment to run successfully, and should be only executed manually
Feature: Register

  #AA-925
  @Register
  Scenario: Register successfully
    Given it's on the "Log in" page
    And there are no users registered
    When clicking on register as a new user
    And user enters valid email and password
    And password confirmation
    And clicks Register
    Then registration is successful
