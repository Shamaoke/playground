
Feature: Updating a quote

  @javascript
  Scenario: Updating a quote
    Given a quote "First quote"
    When I visit the Quotes index page
    And I click on "Edit"
    And I fill in "Name" with "First quote updated"
    And I click on "Update quote"
    Then I should see "First quote updated"

