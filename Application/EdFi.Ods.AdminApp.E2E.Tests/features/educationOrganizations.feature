Feature: Education Organizations
  Background:
    Given user is registered
    And user is logged in
    And setup is complete

  #AA-859
  @Sanity
  Scenario: Education Organizations section - Add Local Education Agency
    Given it's on the "Education Organizations" page
    And Education Organization list has loaded
    When adding new Local Education Agency
    And filling Local Education Agency form
    And clicking save Local Education Agency
    Then Local Education Agency is saved
    And Local Education Agency appears on list
