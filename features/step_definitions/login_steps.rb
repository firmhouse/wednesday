Given /^I am logged in$/ do
  @user = Factory(:user)
  @user.confirm!
  
  visit root_path
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => "password"
  click_button "Sign in"
end

When /^I log in$/ do
  Given %{I am logged in}
end