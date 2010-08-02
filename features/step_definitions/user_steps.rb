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

When /^I delete the user$/ do
  visit user_path(@user2.id),"data-method"=>:delete
  # save_and_open_page
end

When /^I click "([^"]*)"$/ do |arg1|
  page.driver.assertConfirmation('Are you sure?')
end