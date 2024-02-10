Feature: Try to Delete all the data using iteration

@DeleteAll
Scenario: Sceanrio to delete all data
    * def firstCall = karate.call('deleteRequest.feature@DeleteData');
    * def loopValue = function() {return karate.call('deleteRequest.feature@DeleteData');}
    * def loopCount = firstCall.variable.receivedValues.length
    * print loopCount
    * karate.repeat(loopCount-2,loopValue)

