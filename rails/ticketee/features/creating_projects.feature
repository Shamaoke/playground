# language: en

Feature: Users can create new projects

  @javascript
  Scenario: Creating a new project
    Given I visit the root page
    When I create a new project with the name "Sublime Text 3" and the description "A text editor for everyone"
    Then I should be redirected to the "Sublime Text 3" project page
    Then I should see the message "Project has been created"
    And the title of the page should be "Sublime Text 3 - Projects - Ticketee"

  @javascript
  Scenario: Creating a new project with a blank name
    Given I visit the root page
    When I create a new project with the name "" and the description "A text editor for everyone"
    Then I should see the message "Project has not been created"
    And I should see the message "Name can't be blank"

  @javascript
  Scenario: Creating a new project with a blank description
    Given I visit the root page
    When I create a new project with the name "Sublime text 3" and the description ""
    Then I should see the message "Project has not been created"
    And I should see the message "Description can't be blank"

