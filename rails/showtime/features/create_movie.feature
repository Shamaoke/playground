
Feature: Create movie

  So that customers can browse movies by genre
  As a site administrator
  I want to create a movie in a specific genre

  @dev
  Scenario: Create movie in a genre
    Given a genre named "Comedy"
    When I create a movie "Caddyshack" in the "Comedy" genre
    Then "Caddyshack" should be in the "Comedy" genre

