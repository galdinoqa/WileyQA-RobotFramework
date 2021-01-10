*** Settings ***
Library         Selenium2Library
Library         keyword_library.py

*** Variables ***
${mainURL}                  https://teamshift-qa.crossknowledge.com
${browser}                  Firefox

*** Keywords ***
Open web browser
    Create webdriver                ${browser}
    Maximize Browser Window
    Set selenium speed              0.1 seconds
    Set selenium implicit wait      15 seconds