*** Settings ***
Resource          ../resources/common.robot
Suite Setup       Setup Browser
Suite Teardown    End suite


*** Test Cases ***
Entering A Campaign with active state
    [tags]        Opportunity                 Git Repo Exercise
    Appstate      Home
    LaunchApp     Sales

    ClickText     Opportunities
    VerifyText    Recently Viewed             timeout=120s
    ClickText     New                         anchor=Import
    UseModal      On                          # Only find fields from open modal dialog

    ClickText     CloudFulcrum
    ClickText     Next

    TypeText      Opportunity Name            Opp2


    ClickText     Search Accounts...
    ClickText     New Account                 anchor=Recent Accounts
    UseModal      On

    ClickText     Search Accounts...
    ClickText     New Account                 anchor=Recent Accounts
    TypeText      Account Name                oppAcctest
    ClickText     Srikanth N
    TypeText      Phone                       +1234567890
    PickList      Type                        Analyst
    PickList      Industry                    Agriculture
    ClickText     Save                        anchor=Account Information
    UseModal      Off

    ClickText     Date Picker                 anchor=Close Date
    ClickText     29
    PickList      Stage                       Prospecting
    ClickText     Save
    UseModal      Off

    ClickText     Details                     anchor=Activity
    VerifyText    OppAcc1

Create opportunity with existing account and contact.
     [tags]        Opportunity                 Git Repo Exercise
    Appstate      Home
    LaunchApp     Sales

    ClickText     Opportunities
    VerifyText    Recently Viewed             timeout=120s
    ClickText     New                         anchor=Import
    VerifyText    Opportunity Information
    UseModal      On                          # Only find fields from open modal dialog
    TypeText      Opportunity Name            Opp1
    ComboBox      Search Accounts...          CF
    PickList      Type                        New Business
    PickList      *Business Unit              RealseOwl
    PickList      *Sales Owner                Anil Reddy
    ClickText     *Close Date
    ClickText     30
    PickList      *Stage                      Prospecting
    ClickText     Save                        partial_match=False

    ClickText     Details
    VerifyText    Opp1
    VerifyText    CF
    VerifyText    New Business
    VerifyText    RealseOwl
    VerifyText    Anil Reddy
    VerifyText    3/30/2023
    VerifyText    Prospecting

