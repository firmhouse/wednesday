Feature: Edit idea

  So I can modify and fix typos in the ideas I post
  As a team member
  I want to edit an idea
  
  Scenario: Successfully modify an idea
    Given an idea
    When I log in
    And I go to the edit page for the idea
    And I fill in "Summarize the idea" with "Testverandering"
    And I press "Save Changes"
    Then I should see "Testverandering"