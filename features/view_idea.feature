Feature: View ideas

  So everyone can see if an idea is interesting to them
  As a team member
  I want to view an idea
  
  Background:
    Given I am logged in
  
  Scenario: Regular idea page
    Given an idea
    When I go to the idea page
    Then I should see the idea title and description
    And I should be able to go back to the ideas list