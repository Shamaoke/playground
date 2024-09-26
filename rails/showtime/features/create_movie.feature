
Feature: Create movie

  So that customers can browse movies by genre
  As a site administrator
  I want to create a movie in a specific genre

  @dev @javascript
  Scenario: Create movie in a genre
    Given a genre named "comedy"
    When I create a movie "Caddyshack" in the "comedy" genre
    Then "Caddyshack" should be in the "comedy" genre

