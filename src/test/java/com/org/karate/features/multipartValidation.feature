Feature:Feature to validate File upload in karate

Background:
    Given url 'http://localhost:9897/'

    @multipart
Scenario: File upload in Karate
    And path '/normal/webapi/upload'
    And multipart file file = {read: '../documents/Deepshikha Pandey.pdf', filename:'Deepshikha Pandey.pdf', contentType:'multipart/form-data'}
    And method post
    Then status 200
    * match response.message contains 'Deepshikha Pandey.pdf uploaded'

