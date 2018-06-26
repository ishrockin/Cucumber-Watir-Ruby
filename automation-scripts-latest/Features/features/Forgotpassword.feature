Feature: As a user I should be able to create new password and login to myhome

  Scenario: Forgotten Password

    Given I am on Forgotten Your Password
    Then I should be able to see Email
    When I enter valid input
    And I click Request password change
    Then I should be able to see Resetting your password