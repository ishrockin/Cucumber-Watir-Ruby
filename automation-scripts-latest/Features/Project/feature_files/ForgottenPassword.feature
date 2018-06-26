Feature: As a user I should be able to create new password and login to myhome

  Scenario: Forgotten Password
    Given I am on my home sign in page
    And I click on Forgotten password link
    Then I should be on Forgotten password page
    When I enter valid input
    And I click Request password change
    Then I should be able to see Resetting your password