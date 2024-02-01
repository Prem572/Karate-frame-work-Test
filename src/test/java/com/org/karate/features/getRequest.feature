Feature: This feature file tests the get requests scenarios

  @Test1
  Scenario: feature to test
#    * path ""
    Given url 'http://localhost:9897/swagger-ui.html/normal/webapi/all'
    And method get
    And status 200
#    And driver ""