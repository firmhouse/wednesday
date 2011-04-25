Then /^the idea should be created$/ do
  Idea.count.should == 1
end

When /^I do not fill the title or description$/ do
end

Then /^the idea should not be added$/ do
  Idea.count.should == 0
end

Given /^an idea$/ do
  @idea = Factory(:idea)
end

Then /^I should see the idea$/ do
  page.should have_content(@idea.title)
  page.should have_link(@idea.title, :href => idea_path(@idea))
  page.should have_link("View this idea", :href => idea_path(@idea))
end

Given /^no ideas$/ do
end

Then /^I should see a message that there are no ideas yet with a button to add one$/ do
  page.should have_content("No ideas yet")
  page.should have_link("Add an idea", :href => new_idea_path)
end

Then /^I should see the idea title and description$/ do
  page.should have_content(@idea.title)
  page.should have_content(@idea.description)
end

Then /^I should be able to go back to the ideas list$/ do
  page.should have_link("Back to all ideas", :href => ideas_path)
end

Then /^the idea should be deleted$/ do
  Idea.find_by_id(@idea.id).should == nil
end