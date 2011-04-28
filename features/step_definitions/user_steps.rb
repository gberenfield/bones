Given /^I am an authenticated valid non\-admin user$/ do
    @user=User.make(:admin=>false)
    visit '/users/sign_in'
    fill_in("Login", :with => @user.login)
    fill_in("Password", :with => @user.password)
    click_button("Sign in")      
end

Given /^I have a user with an e\-mail "([^"]*)"$/ do |arg1|
  @user2=User.make(:email=>arg1)
end

Given /^I edit the user with a new email "([^"]*)"$/ do |arg1|
  visit "/users/#{@user2.id}/edit"
  fill_in("Email", :with => arg1)
end

Given /^I am an authenticated admin user$/ do
  @user=User.make(:admin=>true)
  visit '/users/sign_in'
  fill_in("Login", :with => @user.login)
  fill_in("Password", :with => @user.password)
  click_button("Sign in")      
end

When /^I view a user with an e\-mail of "([^"]*)"$/ do |email|
  user = User.where("email = ?",email).first
  visit user_path(user)
end

When /^I am going to confirm all js popups on this page$/ do
  # hackish, but not unreasonable.
  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")
end
