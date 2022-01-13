Feature: Log in

#AA-925
    @Sanity
    Scenario: Register successfully
      Given it's on the "Log in" page
      And register button is present
      When clicking on register as a new user
      And user enters valid email and password
      And password confirmation
      And clicks Register
      Then registration is successful

  #AA-994
  @Sanity
  Scenario: Log in successful
    Given it's on the "Log in" page
    And there's a user registered
    When user enters valid email and password
    And clicks Log in
    Then login is successful
