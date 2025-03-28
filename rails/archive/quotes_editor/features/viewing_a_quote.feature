
Feature: Viewing a quote

  @javascript
  Scenario: Viewing a quote
    Given a quote "First quote"
    When I visit the Quotes index page
    And I click on "First quote"
    Then I should see "First quote"

