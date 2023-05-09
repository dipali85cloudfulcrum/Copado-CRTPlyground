*** Settings ***
Library                         QWeb
Library                         QForce
Library                         String


*** Variables ***
${username}                     YOUR USERNAME HERE
${login_url}                    https://YOURDOMAIN.my.salesforce.com                    # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}                     ${login_url}/lightning/page/home


*** Keywords ***
Setup Browser
    Set Library Search Order    QWeb                        QForce
    Open Browser                about:blank                 ${BROWSER}
    SetConfig                   LineBreak                   ${EMPTY}                    #\ue000
    SetConfig                   DefaultTimeout              20s                         #sometimes salesforce is slow


End suite
    Set Library Search Order    QWeb                        QForce
    Close All Browsers


Login
    [Documentation]             Login to Salesforce instance
    Set Library Search Order    QWeb                        QForce
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}                 delay=1
    TypeText                    Password                    ${password}
    ClickText                   Log In


Home
    [Documentation]             Navigate to homepage, login if needed
    Set Library Search Order    QWeb                        QForce
    GoTo                        ${home_url}
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.    2
    Run Keyword If              ${login_status}             Login
    ClickText                   Home
    VerifyTitle                 Home | Salesforce

    #Create Lead
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    ClickText                   Cloudfulcrum
    ClickText                   Next
    VerifyText                  Lead Information
    UseModal                    On                          # Only find fields from open modal dialog

    PickList                    Sales Owner                 Shalini
    Picklist                    Salutation                  Ms.
    TypeText                    First Name                  Asia
    TypeText                    Last Name                   Khan
    TypeText                    Email                       asia.khan@gmail.com         Rating
    Picklist                    Lead Status                 Open
    TypeText                    Phone                       +888888                     First Name
    TypeText                    Company                     AA Architect                Last Name
    PickList                    Lead Source                 Web
    PickList                    Industry                    Agriculture
    PickList                    Country                     India
    PickList                    Company Size                1 - 20 employees
    PickList                    Lead Type                   Customer 
    TypeText                    Title                       Designer                    Address Information
    
    
    TypeText                    Website                     https://www.artchitect.com/

    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Chatter
    VerifyText                  Ms. Asia Khan
    VerifyText                  Shalini                     anchor=Sales Owner
    VerifyField                 Phone                       +888888
    VerifyField                 Company                     AA Architect
    VerifyField                 Website                     https://www.artchitect.com/

    #Convert a Lead into new Acc, Con, Opp
    ClickText                   Converted
    Clicktext                   Select Converted Status
    ClickText                   Create new
    ClickText                   AA Architect-
    TypeText                    Opportunity Name*    AA Architect-Opp
    ClickText                   Convert    anchor=Account
    UseModal                    On
    ClickText                   Go to Leads
    UseModal                    Off
   

    #Verify converted Account, Contact and Opportunity
    ClickText                   Accounts
    VerifyText                  AA Architect
    ClickText                   Contacts
    VerifyText                  Asia Khan
    ClickText                   Opportunities
    VerifyText                  AA Architect-Opp

