@end-to-end
Feature: Review APIs

  Scenario: Generate token. Creating new account. Adding address. Adding phone number. Adding car.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
    And header Authorization = "Bearer " + generatedToken
    
    And path "/api/accounts/add-primary-account"
    * def generator = Java.type('Tigers.api.test.review.data.dataGenerator')
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def job = generator.getJob()
    * def dob = generator.getDob()
    And request
      """
      {
      "email": "#(email)",
      "title": "Mr.",
      "firstName": "#(firstName)",
      "lastName": "#(lastName)",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "#(job)",
      "dateOfBirth": "#(dob)"
      }
      """
    When method post
    Then status 201
    * def generatedId = response.id
    And print generatedId
    And print response
    And header Authorization = "Bearer " + generatedToken
		And path '/api/accounts/add-account-address'
    And param primaryPersonId = generatedId
   	# When header Authorization = "Bearer " + token
   	* def addressLine1 = generator.getStreetAddress()
   	* def cityName = generator.getCityName()
   	* def state = generator.getState()
   	* def zipCode = generator.getZipCode()
    And request
      """
      {
      "id": 0,
      "addressType": "Work",
      "addressLine1": "#(addressLine1)",
      "city": "#(cityName)",
      "state": "#(state)",
      "postalCode": "#(zipCode)",
      "countryCode": "",
      "current": true
      }
      """
			When method post
			Then status 201
			And print response
    And header Authorization = "Bearer " + generatedToken			
		And path '/api/accounts/add-account-phone'
    And param primaryPersonId = generatedId
   	* def phoneNumber = generator.getPhoneNumber()
   	* def phoneExtension = generator.getExtension()
    And request   	
   	"""
   	{
		  "phoneNumber": "#(phoneNumber)",
		  "phoneExtension": "#(phoneExtension)",
		  "phoneTime": "Anytime",
		  "phoneType": "Mobile"
		}
   	"""
			When method post
			Then status 201
			And print response			
    And header Authorization = "Bearer " + generatedToken			
		And path '/api/accounts/add-account-car'
    And param primaryPersonId = generatedId   	
    And request   	
   	"""
		{
		  "id": 0,
		  "make": "Ford",
		  "model": "Mustang",
		  "year": "1975",
		  "licensePlate": "ABC 123"
		}
   	"""   	
			When method post
			Then status 201
			And print response   			