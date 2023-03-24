*** Settings ***
Resource                        ../Resources/common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite


*** Test Cases ***
Entering A Lead
    [tags]                      Lead                        Git Repo Exercise
    Appstate                    Home
    LaunchApp                   Sales

    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    ClickText                   Cloudfulcrum
    ClickText                   Next
    VerifyText                  Lead Information
    UseModal                    On                          # Only find fields from open modal dialog

    Picklist                    Salutation                  Ms.
    TypeText                    First Name                  Tina
    TypeText                    Last Name                   Smith
    Picklist                    Lead Status                 Open
    TypeText                    Phone                       +12234567858449             First Name
    TypeText                    Company                     Growmore                    Last Name
    TypeText                    Title                       Manager                     Address Information
    TypeText                    Email                       tina.smith@gmail.com        Rating
    PickList                    Sales Owner                 Shalini
    TypeText                    Website                     https://www.growmore.com/

    ClickText                   Lead Source
    ClickText                   Advertisement
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Chatter
    VerifyText                  Ms. Tina Smith
    VerifyText                  Shalini                     anchor=Sales Owner
    VerifyField                 Phone                       +12234567858449
    VerifyField                 Company                     Growmore
    VerifyField                 Website                     https://www.growmore.com/

    ClickText                   Leads
    VerifyText                  Tina Smith
    VerifyText                  Manager
    VerifyText                  Growmore

Update the existing lead Information

    Appstate                    Home
    LaunchApp                   Sales
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   Tina Smith
    ClickText                   Details                     anchor=Activity
    ClickText                   Edit Phone
    TypeText                    Phone                       +1111111
    PickList                    Rating                      Hot
    PickList                    Country                     Algeria
    ClickText                   Save
    VerifyText                  Hot
    VerifyText                  +1111111
    VerifyText                  Algeria

Change status to Qualified
    Appstate                    Home
    LaunchApp                   Sales
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   Tina Smith
    ClickText                   Details                     anchor=Activity
    ClickText                   Edit Phone
    TypeText                    Phone                       +1111111
    PickList                    Lead Status                 Qualified
    PickList                    Rating                      Hot
    PickList                    Country                     Algeria
    ClickText                   Save
    VerifyText                  Hot
    VerifyText                  +1111111
    VerifyText                  Algeria

Change status to UnQualified
    Appstate                    Home
    LaunchApp                   Sales
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   Tina Smith
    ClickText                   Details                     anchor=Activity
    ClickText                   Edit Phone
    TypeText                    Phone                       +1111111
    PickList                    Lead Status                 Unqualified
    PickList                    Rating                      Hot
    PickList                    Country                     Algeria
    ClickText                   Save
    VerifyText                  Hot
    VerifyText                  Unqualified
    VerifyText                  +1111111
    VerifyText                  Algeria

Validate Error Message on Leads
    [tags]                      Lead                        Git Repo Exercise
    Appstate                    Home
    LaunchApp                   Sales

    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   Change Status


Delete Tina Smith's Lead
    [tags]                      Lead                        Git Repo Exercise
    Appstate                    Home
    LaunchApp                   Sales
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s

    Wait Until Keyword Succeeds                             1 min                       5 sec                  ClickText     Tina Smith
    ClickText                   Show more actions
    ClickText                   Delete
    ClickText                   Delete
    ClickText                   Close
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    ClickText                   ReleaseOwl
    ClickText                   Next
    VerifyText                  Lead Information
    UseModal                    On                          # Only find fields from open modal dialog

    Picklist                    Salutation                  Mr.
    TypeText                    First Name                  John
    TypeText                    Last Name                   Smith
    Picklist                    Lead Status                 Open
    TypeText                    Phone                       +888888                     First Name
    TypeText                    Company                     xyz                         Last Name
    TypeText                    Title                       Manager                     Address Information
    TypeText                    Email                       john.smith@gmail.com        Rating
    PickList                    Sales Owner                 Shalini
    TypeText                    Website                     https://www.xyz.com/

    ClickText                   Lead Source
    ClickText                   Advertisement
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Chatter
    VerifyText                  Ms. Tina Smith
    VerifyText                  Shalini                     anchor=Sales Owner
    VerifyField                 Phone                       +8888889
    VerifyField                 Company                     xyz
    VerifyField                 Website                     https://www.xyz.com/

    ClickText                   Leads
    VerifyText                  John Smith
    VerifyText                  Manager
    VerifyText                  xyz

