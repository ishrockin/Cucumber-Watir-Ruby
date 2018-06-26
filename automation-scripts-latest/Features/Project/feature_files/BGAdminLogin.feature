@P1
Feature: BGAdmin Login

    Scenario: Validate that the user is able to login with valid credentials
      Given I navigate to the login page
      When I enter a valid username
      When I enter a valid password
      And I click Login
      Then I should be navigated to the Dashboard
