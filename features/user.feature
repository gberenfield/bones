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
