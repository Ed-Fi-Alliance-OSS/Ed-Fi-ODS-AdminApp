Feature: Log in

  #AA-994
  @Sanity
  Scenario: Log in successful
    Given it's on the "Log in" page
    And there is one user registered
    When user enters valid email and password
    And clicks Log in
    Then login is successful
