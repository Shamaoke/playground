# language: en

Feature: Users can create new projects

  @javascript
  Scenario: with valid attributes
    Given I visit the root page
    When I create a new project with the name "Sublime Text 3" and the description "A text editor for everyone"
    Then I should see "Project has been created"

