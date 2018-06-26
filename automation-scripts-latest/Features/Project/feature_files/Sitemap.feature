@P1
Feature: Sitemap.xml

  Scenario: Validate the Sitemap.xml file
    Given The Sitemap creator schedule task is run
    When I navigate to the Sitemap xml file
    Then I should see the correct location urls

