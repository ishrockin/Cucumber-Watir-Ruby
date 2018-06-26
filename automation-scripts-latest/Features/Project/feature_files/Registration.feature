Feature: As a user I should be able to fill in and submit all CTA forms

  Scenario:
    Given I am on selected Development
    And I click on Enquire link
    When I fill out textField with text
    When I click on Submit
    Then I should see Thank You message

