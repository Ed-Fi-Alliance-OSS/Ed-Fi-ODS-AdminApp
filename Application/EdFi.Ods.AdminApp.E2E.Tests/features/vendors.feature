Feature: Vendors
    Background:
        Given user is registered
        And user is logged in
        And setup is complete

    #AA-871
    Scenario: Add vendor
        Given it's on the "Vendors" page
        And vendor page has loaded
        And there are no vendors
        When clicking add vendor
        And filling vendor form
        And adding vendor namespace prefix
        And clicking save vendor
        Then vendor is added
        And added vendor appears on list

    #AA-872
    @WIP
    Scenario: Edit vendor
        Given there's a vendor added
        And it's on the "Vendors" page
        And vendor page has loaded
        When clicking edit vendor
        And modifying added vendor
        And clicking save edited vendor
        Then vendor is edited
        And edited vendor appears on list

    #AA-873
    Scenario: Delete vendor
        Given there's a vendor added
        And it's on the "Vendors" page
        And vendor page has loaded
        When clicking delete vendor
        And delete vendor modal is open
        And confirming delete vendor
        Then vendor is deleted

    #AA-880
    Scenario: Help Section
        Given it's on the "Vendors" page
        And vendor page has loaded
        When help section is present
        Then help section can be collapsed
        And help section can be expanded

    #AA-999
    Scenario: Define Applications (Single Instance)
        Given there's a vendor added
        And it's on the "Vendors" page
        And vendor page has loaded
        When clicking define applications
        Then it navigates to the applications page
