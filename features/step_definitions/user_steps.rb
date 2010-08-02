Given /^I am an authenticated valid non\-admin user$/ do
    @user=User.make(:admin=>false)
    visit '/users/sign_in'
    fill_in("Login", :with => @user.login)
    fill_in("Password", :with => @user.password)
    click_button("Sign in")      
end

Given /^I am an authenticated admin user$/ do
  @user=User.make(:admin=>true)
  visit '/users/sign_in'
  fill_in("Login", :with => @user.login)
  fill_in("Password", :with => @user.password)
  click_button("Sign in")      
end