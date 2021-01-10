*** Settings ***
Library         Selenium2Library
Library         keyword_library.py
Resource        ../Pages/P01-HomePage.robot
Resource        ../Pages/P02-LoginModal.robot
Resource        ../Pages/P03-MemberArea.robot

*** Variables ***
${mainURL}                  https://teamshift-qa.crossknowledge.com
${browser}                  Firefox

*** Keywords ***
Open web browser
    Create webdriver                ${browser}
    Maximize Browser Window
    Set selenium speed              0.1 seconds
    Set selenium implicit wait      15 seconds