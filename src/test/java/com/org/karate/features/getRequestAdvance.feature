Feature: To Master the Karate in Advanced level

Scenario: Path Keyword Implementation with Fuzzy matchers
    Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And method get
    Then status 200
    And print response
    
    # Fuzzy Matcher Part 1
    Then match response[0].jobId == 1
    And match response[0].project[0].technology == '#[3]'
    And match response[0].project[0].technology != '#[1]'
    And match response contains deep {"project":[{"technology":["Kotlin"]}]}
    # And match response !contains deep {"project":[{"technology":["JAVA SCRIPT"]}]}
    And match response[0].project[0].technology contains 'Kotlin'
    And match response[0].project[0].technology !contains 'DBMS'
    And match response[0].jobTitle == '#string'
    And match response[0].experience == '#present'
    # Fuzzy Matcher Part 2
    # And match karate.jsonPath(response,$[?(@.jobId==1)].jobTitle) == '#string'

@UsedForDelete1
Scenario: Path Keyword Implementation with Fuzzy matchers
    Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And method get
    Then status 200
    And print response
    And def receivedValues = response
    
    # Fuzzy Matcher Part 1
    Then match response[0].jobId == 1
    And match response[0].project[0].technology == '#[3]'
    And match response[0].project[0].technology != '#[1]'
    And match response contains deep {"project":[{"technology":["Kotlin"]}]}
    # And match response !contains deep {"project":[{"technology":["JAVA SCRIPT"]}]}
    And match response[0].project[0].technology contains 'Kotlin'
    And match response[0].project[0].technology !contains 'DBMS'
    And match response[0].jobTitle == '#string'
    And match response[0].experience == '#present'
    # Fuzzy Matcher Part 2
    # And match karate.jsonPath(response,$[?(@.jobId==1)].jobTitle) == '#string'


    @CallFeature
Scenario: Path Keyword Implementation with Fuzzy matchers

    * def capturedValues = karate.call('postRequestAdvance.feature@ReadPostCheckEmbeded')
    Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And method get
    Then status 200
    And print response
    * print capturedValues.id
    And match response[*] contains deep {"jobId":#(capturedValues.id)}
    
    

    @UsedForDelete
Scenario: Path Keyword Implementation with Fuzzy matchers
    Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    And method get
    Then status 200
    And print response
    And def receivedValues = response
    
    # Fuzzy Matcher Part 1
    And match response[0].project[0].technology == '#[3]'
    And match response[0].project[0].technology != '#[1]'
    And match response contains deep {"project":[{"technology":["Kotlin"]}]}
    # And match response !contains deep {"project":[{"technology":["JAVA SCRIPT"]}]}
    And match response[0].project[0].technology contains 'Kotlin'
    And match response[0].project[0].technology !contains 'DBMS'
    And match response[0].jobTitle == '#string'
    And match response[0].experience == '#present'