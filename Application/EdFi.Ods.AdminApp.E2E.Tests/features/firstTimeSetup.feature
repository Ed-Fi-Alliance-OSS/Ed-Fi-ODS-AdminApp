# These tests needs to have a clean environment to run successfully, and should be only executed manually
Feature: First Time Setup

    Background: User is registered
        Given user is registered
        And user is logged in

    #AA-1429
    @FTS
    Scenario: First Time Setup Successful
        Given it's on the "First Time Setup" page
        When clicking Continue
        Then first time setup is successful
