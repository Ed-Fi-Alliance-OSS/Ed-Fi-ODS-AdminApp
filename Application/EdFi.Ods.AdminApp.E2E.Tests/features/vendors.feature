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
        When clicking on add a vendor
        And filling Vendor form
        And adding vendor namespace prefix
        And clicking save vendor
        Then vendor is added
        And vendor appears on list


    #AA-880
    Scenario: Help Section
        Given it's on the "Vendors" page
        And vendor page has loaded
        When help section is present
        Then help section can be collapsed
        And help section can be expanded
