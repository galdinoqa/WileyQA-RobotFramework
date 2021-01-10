*** Settings ***
Resource        ../Common/TestSettings.robot

*** Variables ***
${img_wiley_logo_header}        css:.brand-logo--desktop
${btn_enter}                    css:.js-login-member-button

*** Keywords ***
Given that I am on TeamSHIFT home page
    Go to       ${mainURL}
    Then I should see the TeamShift home page

When I click on Enter button
    Click element       ${btn_enter}

Then I should see the TeamSHIFT home page
    Wait until element is visible       ${img_wiley_logo_header}
    Element text should be              ${btn_enter}            ENTRAR
    Capture page screenshot