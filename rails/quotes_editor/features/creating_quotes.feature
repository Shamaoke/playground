
Feature: Creating quotes

  @javascript
  Scenario: Creating quotes
    Given I visit the Quotes index page
    When I click on "New quote"
    And I fill in "Name" with "First quote"
    And I click on "Create quote"
    Then I should see "Quotes"
    And I should see "First quote"

