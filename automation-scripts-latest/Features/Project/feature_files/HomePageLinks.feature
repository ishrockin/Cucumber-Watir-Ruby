Feature: Home Page Links
  Scenario: Validate that all the links on the home page works as expected
    Given I navigate to the home page
    When I click the links on the page
    Then I should be navigated to the page
