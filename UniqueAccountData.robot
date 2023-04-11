*** Settings ***
Resource                   ../Resources/common.robot
Suite Setup                Setup Browser
Suite Teardown             End suite


*** Test Cases ***
Create Account Growmore
    [Tags]                 Account                     New Account
    Appstate               Home
    ${AccountName}=        Set Variable                Growmore
    ${CurrentTimeStamp}    Get Current Date
    ${UniqueName}=         UniqueAccountName           ${AccountName}         ${CurrentTimeStamp}
    TypeText               Account Name                ${UniqueName}
    TypeText               Account Name                ${UniqueName}
    LaunchApp              Sales
    ClickText              Accounts
    ClickText              New
    UseModal               On
    Sleep                  1 Sec
    TypeText               Account Name                Growmore
    PickList               Type                        Competitor
    ClickText              Website
    TypeText               Website                     www.growmore.org
    ClickText              Phone
    TypeText               Phone                       1234567890
    PickList               Industry                    Banking
    ClickText              Employees
    TypeText               Employees                   100
    ClickText              Save                        partial_match=false
    UseModal               Off

    ClickText              Details                     anchor=Related
    VerifyText             ${UniqueName}
    VerifyText             ${UniqueName}               anchor=Account Name
    VerifyText             1234567890
    VerifyText             100
    VerifyText             www.growmore.org
    VerifyText             Banking
