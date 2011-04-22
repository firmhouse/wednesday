Feature: Create an idea

  In order to pitch a new idea to the other team members
  As a team member
  I want to create an idea
  
  Scenario: Successfully create an idea
    Given I am logged in
    When I follow "Add an idea"
    And I fill in "Summarize the idea" with "MyThemeShop: a shop for designers to sell their themes"
    And I fill in "Describe the idea" with "MyThemeShop is an online service for designers to sell their Wordpress themes."
    And I press "Add this idea"
    Then the idea should be created
  
  Scenario: Submit an invalid idea
    Given I am logged in
    When I follow "Add an idea"
    And I do not fill the title or description
    And I press "Add this idea"
    Then the idea should not be added
    And I should see "Cannot save this idea"