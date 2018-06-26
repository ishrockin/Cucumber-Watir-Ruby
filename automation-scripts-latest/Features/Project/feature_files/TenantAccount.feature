Feature: As a my home plus user I should be able to Create Tenant account successfully

  Scenario: Creating tenant account

    Given I am logged into Myhomeplus
    And I am on property page
    And I click on Create a tenant account
    And I should complete & submit the create account form
    Then I should be able to see Thank you message