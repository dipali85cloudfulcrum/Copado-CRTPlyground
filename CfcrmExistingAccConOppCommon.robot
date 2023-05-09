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
    TypeText                    First Name                  Tina
    TypeText                    Last Name                   Smith
    TypeText                    Email                       tina.smith@gmail.com         Rating
    Picklist                    Lead Status                 Open
    TypeText                    Phone                       +888888                     First Name
    TypeText                    Company                     Growmore                    Last Name
    PickList                    Lead Source                 Web
    PickList                    Industry                    Agriculture
    PickList                    Country                     India
    PickList                    Company Size                1 - 20 employees
    PickList                    Lead Type                   Customer 
    TypeText                    Title                       Designer                    Address Information
    
    
    TypeText                    Website                     https://www.growmore.com/

    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Chatter
    VerifyText                  Ms. Tina Smith
    VerifyText                  Shalini                     anchor=Sales Owner
    VerifyField                 Phone                       +888888
    VerifyField                 Company                     Growmore
    VerifyField                 Website                     https://www.growmore.com/

    #Convert a Lead into new Acc, Con, Opp
    ClickText                   Converted
    Clicktext                   Select Converted Status
    ClickText                   Choose Existing
    ComboBox                    Account Search              Growmore
    ClickText                   Choose Existing             anchor=Contact
    ComboBox                    Contact Search              Tina Smith
    ClickText                   Choose Existing             anchor=Opportunity
    ComboBox                    Opportunity Search          Growmore-Opp
    ClickText                   Convert                     anchor=Cancel
    UseModal                    On
    ClickText                   Go to Leads
    UseModal                    Off
   

    #Verify converted Account, Contact and Opportunity
    ClickText                   Accounts
    VerifyText                  Growmore
    ClickText                   Contacts
    VerifyText                  Tina Smith
    ClickText                   Opportunities
    VerifyText                  Growmore-Opp

