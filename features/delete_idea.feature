Feature: Delete an idea
  
  In order to clean up old ideas or to clear mistakes
  As a team member
  I want to delete an idea
  
  Scenario: Delete a regular idea
    Given an idea
    When I log in
    And I go to the idea page
    And I follow "Remove"
    Then the idea should be deleted