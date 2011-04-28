Feature: Managing Users
	In order to maintain the program
	As an admin
	I want to manage Users manually
	
	Scenario: A non-admin user should not get to the Users interface
		Given I am an authenticated valid non-admin user
		When I go to "the list of users"
		Then I should see "You must be an Administrator to access this page"

	Scenario: An admin should get the list of Users
		Given I am an authenticated admin user
		When I go to "the list of users"
		Then I should see "Users"

	Scenario: An admin should be able to create a new user
	  Given I am an authenticated admin user
		And I go to "the list of users"
	  When I follow "New User"
	  And I fill in "Login" with "testlogin"
		And I fill in "Email" with "test@email.org"
		And I fill in "Password" with "pass"
		And I fill in "Password confirmation" with "pass"
		And I press "Create User"
		Then I should see "testlogin"
		And I should see "Admin: false"

	Scenario: An admin should NOT be able to create a new user with invalid fields
	  Given I am an authenticated admin user
		And I go to "the list of users"
	  When I follow "New User"
	  And I fill in "Login" with "testlogin"
		And I fill in "Email" with "test@email.org"
		And I fill in "Password" with "pass"
		And I fill in "Password confirmation" with "pass1"
		And I press "Create User"
		Then I should not see "testlogin"

	Scenario: I should be able to update a user
	  Given I am an authenticated admin user
		And I have a user with an e-mail "who@ami.org"
		And I edit the user with a new email "newemail@ami.org"
	  When I press "Update User"
	  Then I should see "Successfully updated user."
		#"newemail@ami.org"

	Scenario: I should NOT be able to update a user with invalid fields
	  Given I am an authenticated admin user
		And I have a user with an e-mail "who@ami.org"
		And I edit the user with a new email "not an e-mail address"
	  When I press "Update User"
	  Then I should not see "Successfully updated user."
	
  @javascript
  Scenario: Delete a user
    Given I am an authenticated admin user
    And I have a user with an e-mail "who@ami.org"
    And I view a user with an e-mail of "who@ami.org"
    And I am going to confirm all js popups on this page
    When I follow "Destroy"
    Then I should see "Successfully destroyed user."
    