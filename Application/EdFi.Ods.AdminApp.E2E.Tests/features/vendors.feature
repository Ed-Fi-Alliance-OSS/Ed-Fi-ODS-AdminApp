Feature: Vendors
    Background:
        Given user is registered
        And user is logged in
        And setup is complete

    #AA-871
    Scenario: Add a vendor
        Given it's on the "Vendors" page
        And vendor page has loaded
        And there are no vendors
        When clicking add vendor
        And filling vendor form
        And adding vendor namespace prefix
        And clicking save vendor
        Then vendor is added
        And vendor appears on list

    #AA-873
    Scenario: Delete a vendor
        Given there's a vendor added
        Given it's on the "Vendors" page
        And vendor page has loaded
        When clicking delete vendor
        And validation message has vendor name
        And confirming delete vendor
        Then vendor is deleted

    #AA-880
    Scenario: Help Section
        Given it's on the "Vendors" page
        And vendor page has loaded
        When help section is present
        Then help section can be collapsed
        And help section can be expanded
