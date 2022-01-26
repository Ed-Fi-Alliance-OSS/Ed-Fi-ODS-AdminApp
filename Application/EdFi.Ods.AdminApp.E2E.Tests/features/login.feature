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

    #AA-995
    Scenario Outline: Log in errors
        Given it's on the "Log in" page
        When user enters "<Scenario>" for Log in
        And clicks Log in
        Then validation errors for Log in scenario: "<Scenario>" appears

        Examples:
            | Scenario             |
            | no data              |
            | email only           |
            | wrong email          |
            | email not registered |
            | password only        |
            | wrong password       |

    #AA-1019
    Scenario: Log out successfully
        Given user is logged in
        When clicks sign out
        Then logout is successful
