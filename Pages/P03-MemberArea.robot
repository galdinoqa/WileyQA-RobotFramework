*** Settings ***
Resource        ../Common/TestSettings.robot

*** Variables ***
${header_menu}                  css:.header__menu
${lbl_member_name_header}       css:.header__menu-member-name
${btn_create_team}              css:.section-no-teams__button
${btn_accept_cookies}           id:js-agree-cookie-policy

*** Keywords ***
Then I should see the member area page
    Wait until element is visible       ${header_menu}
    Element should be visible           ${lbl_member_name_header}
    Element text should be              ${btn_create_team}          CREATE A TEAM
    Element should be visible           ${btn_accept_cookies}       ACCEPT
    Capture page screenshot

And my name should be on the page header
    [Arguments]     ${expected_name}
    Element text should be      ${lbl_member_name_header}       ${expected_name}