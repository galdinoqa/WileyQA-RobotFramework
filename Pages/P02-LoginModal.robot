*** Settings ***
Resource        ../Common/TestSettings.robot

*** Variables ***
${modal_login_member}           id:js-modal-login-member
${lbl_header_login_modal}       css:.login-header__title
${lbl_text_login_modal}         css:.login-member__subtitle
${txt_email_login}              id:login-form__login
${btn_cancel_login}             xpath://div[@id='js-modal-login-member']//button[contains(@class,'button-default--secondary')]
${btn_next_login}               xpath://div[@id='js-modal-login-member']//button[@type='submit']
${txt_password_login}           id:login-form__password
${lnk_fogot_password}           css:.login-form__forgot-password
${lnk_request_access_link}      css:.js-login-form-request
${btn_login}                    xpath://div[@id='js-modal-login-member']//button[@type='submit']
${div_alert}                    xpath://div[contains(@class,'login-form__alert-container')][not(contains(@class,'hidden'))]
${lbl_alert_text}               ${div_alert}//p

*** Keywords ***
Then I should see a modal asking for my email
    Wait until element is visible       ${modal_login_member}
    Element text should be              ${lbl_header_login_modal}       Faça o login no TeamSHIFT
    Element text should be              ${lbl_text_login_modal}         Para fazer login no TeamSHIFT, insira o seu e-mail corporativo:
    Element should be visible           ${txt_email_login}
    Element text should be              ${btn_cancel_login}             CANCELAR
    Element text should be              ${btn_next_login}               PRÓXIMO
    Capture page screenshot

When I fill the email
    [Arguments]     ${email_to_use}
    Input text      ${txt_email_login}      ${email_to_use}

And I click on Next button
    Click element   ${btn_next_login}

Then I should see a field to enter my password
    Wait until element is visible       ${txt_password_login}
    Element text should be              ${lnk_fogot_password}           Esqueci minha senha ou nunca defini uma
    Element text should be              ${lnk_request_access_link}      Ou solicite o seu link de acesso: Envie o meu link de acesso por e-mail
    Element text should be              ${btn_login}                    LOGIN
    Element text should be              ${btn_cancel_login}             CANCELAR
    Capture page screenshot

When I type the password
    [Arguments]     ${password_to_use}
    Input password      ${txt_password_login}       ${password_to_use}

And I click on Login button
    Click element       ${btn_login}

Then I should see an error message
    Wait until element is visible       ${div_alert}
    Element text should be              ${lbl_alert_text}       A autenticação falhou com o e-mail e a senha fornecidos.