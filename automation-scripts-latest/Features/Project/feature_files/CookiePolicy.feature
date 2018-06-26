Feature: Cookie Policy

  Scenario: Validate that the Cookie Policy notification pop up window is displayed, user is able to navigate to Cookie Policy page and close the pop up window
    Given The browser cache is cleared
    When I navigate to the home page for the first time
    Then The Cookie Policy notification pop up window should be displayed
    And The user clicks 'change your cookie setting' from the pop up window
    Then I should be navigated to Cookie Policy page with About Cookies tab highlighted
    And I click the browser back button
    And I click the close (X) button in the Cookie Policy notification pop up window
    Then The Cookie Policy notification pop up window should be closed

