Given /^I am not an authenticated user$/ do
  @user=User.make(:admin=>false)
  visit '/users/sign_in'
end

Given /^I'm a regular authenticated user$/ do
  Given "I am an authenticated valid non-admin user"
end

Given /^There are documents in existence as follows:$/ do |documents|
  # table is a Cucumber::Ast::Table
  documents.hashes.each do |doc|
    Document.make(doc)
  end
end

Then /^I should see the documents:$/ do |documents|
  documents.hashes.each do |doc|
    page.should have_content(doc[:document_file_name])
    page.should have_content(doc[:description])
    page.should have_content(doc[:comments])
  end
end
