Feature: List of ideas
  
  In order to view all ideas that everyone added
  As a team member
  I want to view a list of the ideas that have been added
  
  Scenario: View list of added ideas
    Given an idea
    When I log in
    Then I should see the idea

  Scenario: View blank message if no ideas are added yet
    Given no ideas
    When I log in
    Then I should see a message that there are no ideas yet with a button to add one