Feature: Signing into the system
	In order to use the web application
	As a user
	I want to log into the web application
	
	Scenario: An unknown user going to the login page
		Given I am a valid user
		When I go to the log in screen
		Then I should see 'Login' and 'Password'
		
	Scenario: A valid user successfully logging in
		Given I am a valid user
		When I go to the log in screen
		And I enter my username and password
		Then I should see "Login successful!"
		
	Scenario: A valid user unsuccessfully logging in
		Given I am a valid user
		When I go to the log in screen
		And I incorrectly enter my username and password
		Then I should see 'Login' and 'Password'