Feature:   Post methods validations

  Background:
    Given url 'http://localhost:9897'

    @BasicPostCheck
  Scenario: Create a New Job in the Portal with Basic Post

    And path '/normal/webapi/add'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request 
    """
    {
    "jobId": 3,
    "jobTitle": "Software Engg - QA",
    "jobDescription": "To Test andriod application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
            ]
        }
    ]
    }
    """
    And method post 
    And status 201
    And print response


    @ReadPostCheck
  Scenario: Create a New Job in the Portal by reading the file

    And path '/normal/webapi/add'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    * def body =  read("../jsons/postCall.json")
    * def id = Java.type("com.org.karate.java.HelloWorld").randomNumberGenerator()
    * set body.jobId = id
    * set body.project[0].projectName = 'Tesco'
    * print id
    And request body
    And method post 
    And status 201
    And print response
    And match response contains deep {"project" : [{"projectName":"Tesco"}]}

    @ReadPostCheckEmbeded
  Scenario: Create a New Job in the Portal by reading the file Using Embeded Exp

    And path '/normal/webapi/add'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    * def body =  read("../jsons/postCallEmbeded.json")
    * def id = Java.type("com.org.karate.java.HelloWorld").randomNumberGenerator()
    * string jobName = 'Developer'
    And request 
    """
    {
    "jobId": #(id),
    "jobTitle": "#(jobName)",
    "jobDescription": "To Test andriod application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
            ]
        }
    ]
    }l
    """

    And method post 
    And status 201
    And print response
    And match response.jobId == id
    # And match response contains deep {"project" : [{"projectName":"Tesco"}]}
    * def profjectJson = 
    """
        {
            "projectName": '#string',
            "technology": '#[] #string'
        }
    """
    * match response == 
    """
    {
    "jobId": '#number',
    "jobTitle": '#string',
    "jobDescription": '#string',
    "experience": '#[] #string',
    "project": '#[] ##(profjectJson)'
    }

    """