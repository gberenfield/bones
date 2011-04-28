Feature: Managing Documents
	In order to maintain documents
	As a normal user
	I want to manage documents 'crudily'
	
	Scenario: A non-user should not get to the Documents interface
		Given I am not an authenticated user
		When I go to "the list of documents"
		Then I should see "Sign in"
  
  @javascript
  Scenario: A regular user can see the list documents
    Given I'm a regular authenticated user
    And There are documents in existence as follows:
  	| document_file_name | description | comments |
  	| abc.pdf            | alpabet file| nice file! | 
  	| 123.pdf            | numbers     | for counting|
  	| colors.pdf | colors | artistry! |
  	| animals.pdf | zoo stuff | grrr! |
  	| fishies.pdf | deep sea stuff | with scales! |      
		When I go to "the list of documents"
		Then I should see the documents:
		| document_file_name | description | comments |
  	| abc.pdf            | alpabet file| nice file! | 
  	| 123.pdf            | numbers     | for counting|
  	| colors.pdf | colors | artistry! |
  	| animals.pdf | zoo stuff | grrr! |
  	| fishies.pdf | deep sea stuff | with scales! |      
  	
  @now
  Scenario: A user can create a document
    Given I'm a regular authenticated user
    And I go to "the list of documents"
    When I follow "New Documents"
    And I attach the file "features/support/paperclip/wow.txt" to "document_document"
    And I fill in "document[description]" with "testing by upping app.css file"
    And I press "Create Document"
    Then I should see "Original Document"
    And I should see "testing by upping app.css file"
  
  
  
  