Feature:This feature deletes the requests

Background:
    Given url 'http://localhost:9897'

    @DeleteData
Scenario: Scenario to delete the created requests
* def variable = call read('getRequestAdvance.feature@UsedForDelete')
* def value = variable.receivedValues[0].jobId
* print value
And path '/normal/webapi/remove/'+value
And header Accept = 'application/json'
And method delete
Then status 200
* def variable1 = call read('getRequestAdvance.feature@UsedForDelete')
Then match variable1.receivedValues[0].jobId != value

