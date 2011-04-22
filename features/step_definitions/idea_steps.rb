Then /^the idea should be created$/ do
  Idea.count.should == 1
end

When /^I do not fill the title or description$/ do
end

Then /^the idea should not be added$/ do
  Idea.count.should == 0
end