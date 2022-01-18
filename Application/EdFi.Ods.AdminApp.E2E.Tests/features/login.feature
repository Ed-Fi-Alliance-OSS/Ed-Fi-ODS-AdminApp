Feature: Log in

  Background: User is registered
    Given user is registered

  #AA-994
  @Sanity
  Scenario: Log in successful
    Given it's on the "Log in" page
    When user enters valid email and password
    And clicks Log in
    Then login is successful
