
Feature: Deleting a quote

  @javascript
  Scenario: Deleting a quote
    Given a quote "First quote"
    When I visit the Quotes index page
    And I click on "Delete"
    Then I should not see "First quote"

