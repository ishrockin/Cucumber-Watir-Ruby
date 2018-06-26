Feature: As a user I should be able to navigate and view to Commercial Opportunities page

  Scenario: Navigating to Commercial Opportunities page

    Given I am on Commercial Overview Page
    When I click on View Commercial Opportunities Link
    Then I should navigate to Commercial Developments page
    And I click View Commercial button
    Then It should navigate to the selected Commercial Development page