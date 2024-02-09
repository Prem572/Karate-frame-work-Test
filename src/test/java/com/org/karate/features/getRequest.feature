Feature: This feature file tests the get requests scenarios

@test1
Scenario Outline: fetaure to test
#    * url ''
    Given url 'http://localhost:9897'
    * path '/normal/webapi/all'
    * header Accept = 'application/json'
    And method get
    And status 200
    * json body = response
    * match body contains deep {"jobTitle" : "Software Engg"}
    * match body contains deep {"experience" : ["Google","Apple","Mobile Iron"]}
    * match response contains deep {"project":[{"technology":["Gradle"]}]}
    * match body.[0].jobId == 1
    * match body.[0].project.[0].technology.[*] contains  'SQL Lite'

    #To validate the size of array
    * match body.[0].project[0].technology == '#[3]'
    * def value = Java.type('com.org.karate.java.HelloWorld').helloWorldMethod()
    * print value
    * json obj = Java.type('com.org.karate.java.HelloWorld').generateJson()
    * print obj
  

    Examples:
      |Name|
      |Prem Kumar|
  
   
