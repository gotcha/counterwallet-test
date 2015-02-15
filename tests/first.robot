*** Settings ***
#Resource  plone/app/robotframework/keywords.robot

Library  Selenium2Library

Suite Setup  Open browser  https://testnet.counterwallet.io/
Suite Teardown  Close all browsers

*** Test cases ***

Initialization
    Wallet loaded

*** Keywords ***

Wallet loaded
    Wait until page contains  Welcome to Counterwallet
    Page should contain  Testnet
