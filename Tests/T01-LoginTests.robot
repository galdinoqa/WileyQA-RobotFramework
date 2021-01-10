*** Settings ***
Resource        ../Common/TestSettings.robot
Resource        ../Pages/P01-HomePage.robot
Resource        ../Pages/P02-LoginModal.robot
Resource        ../Pages/P03-MemberArea.robot

Suite setup         Open web browser
Test setup          Clear local storage
Suite teardown      Close browser

*** Test Cases ***
01 - Successful login
    [Tags]      Positive
    Given that I am on TeamShift home page
    When I click on Enter button
    Then I should see a modal asking for my email
    When I fill the email   galdino.qa@gmail.com
    And I click on Next button
    Then I should see a field to enter my password
    When I type the password    WLS2020qa
    And I click on Login button
    Then I should see the member area page
    And my name should be on the page header    Thiago Secomandi Galdino

02 - Unsuccessful login
    [Tags]      Negative
    Given that I am on TeamShift home page
    When I click on Enter button
    Then I should see a modal asking for my email
    When I fill the email   galdino.qa@gmail.com
    And I click on Next button
    Then I should see a field to enter my password
    When I type the password    SENHA123
    And I click on Login button
    Then I should see an error message
