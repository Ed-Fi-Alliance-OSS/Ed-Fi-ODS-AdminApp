Feature: Vendors
    Background:
        Given user is registered
        And user is logged in
        And setup is complete

    #AA-880
    Scenario: Help Section
        Given it's on the "Vendors" page
        And Vendor page has loaded
        When help section is present
        Then help section can be collapsed
        And help section can be expanded
