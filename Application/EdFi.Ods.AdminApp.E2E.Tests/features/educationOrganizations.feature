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
        Then Local Education Agency is added
        And Local Education Agency appears on list

    #AA-860
    Scenario: Education Organizations section - Edit Local Education Agency
        Given there's a Local Education Agency added
        And it's on the "Education Organizations" page
        And Education Organization list has loaded
        When clicking edit Local Education Agency
        And modifying added Local Education Agency
        And clicking save edited Local Education Agency
        Then Local Education Agency is edited
        And edited Local Education Agency appears on list

    #AA-861
    Scenario: Education Organizations section - Delete Local Education Agency
        Given there's a Local Education Agency added
        And it's on the "Education Organizations" page
        And Education Organization list has loaded
        When clicking delete Local Education Agency
        And confirming delete Local Education Agency
        Then Local Education Agency is deleted

    #AA-862
    Scenario: Education Organizations section - Collapse Local Education Agency Section
        Given there's a Local Education Agency added
        And it's on the "Education Organizations" page
        And Education Organization list has loaded
        When clicking collapse Local Education Agency section
        Then Local Education Agency section is collapsed

    #AA-934
    Scenario Outline: Education Organizations section - Add Local Education Agency validations
        Given it's on the "Education Organizations" page
        And Education Organization list has loaded
        When adding new Local Education Agency
        And entering Local Education Agency form "<Scenario>"
        And clicking save Local Education Agency with errors
        Then Local Education Agency validation for "<Scenario>" appears
        And field with errors for "<Scenario>" are highlighted

        Examples:
            | Scenario |
            | no data  |
            | wrong id |

# #Duplicated ID
