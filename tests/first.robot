*** Settings ***
#Resource  plone/app/robotframework/keywords.robot

Library  Selenium2Library
Library  DebugLibrary

Suite Setup  Open browser  https://testnet.counterwallet.io/
Suite Teardown  Close all browsers

*** Test cases ***

Initialization
    Wallet loaded

New wallet
    Make new wallet

*** Keywords ***

Wallet loaded
    Wait until page contains  Welcome to Counterwallet
    Page should contain  Testnet

Make new wallet
    Click button  newWalletButton
    Wait until element is visible  generated
    Page should contain element  generated
    ${passphrase}=  Get text  generated
    Log  ${passphrase}
    Click element  passphraseSaved
    Click button  continueWalletCreation
    Wait until element is visible  finishWalletCreation
    Click button  Skip This Step
    Wait until element is visible  css=.bootbox-body
    Click button  OK
    Input password  password  ${passphrase} 
    Click button  walletLoginButton
    Wait until element is visible  css=.modal-footer button.btn-success
    Click button  Accept Terms
    Wait until page contains  My Account Balances


