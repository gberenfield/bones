Given /^I am a valid user$/ do
  @user=User.make
end

Then /^I should see 'Login' and 'Password'$/ do 
  page.should have_content('Login')
  page.should have_content('Password')
end

When /^I enter my username and password$/ do
  visit '/users/sign_in'
  fill_in("Login", :with => @user.login)
  fill_in("Password", :with => @user.password)
  click_button("Sign in")  
end

When /^I incorrectly enter my username and password$/ do
  visit '/users/sign_in'
  fill_in("Login", :with => @user.login)
  fill_in("Password", :with => @user.password+"oops")
  click_button("Sign in")  
end
