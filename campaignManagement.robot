*** Settings ***
Resource                        ../resources/common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite


*** Test Cases ***
Entering A Campaign with active state
    [tags]                      Campaign                    Git Repo Exercise
    Appstate                    Home
    LaunchApp                   Sales

    ClickText                   Campaigns
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    VerifyText                  Campaign Information
    UseModal                    On                          # Only find fields from open modal dialog

    TypeText                    Campaign Name               Camp1
    ClickText                   Active
    PickList                    Type                        Advertisement
    PickList                    Status                      In Progress

    # ClickText                 Date Picker                 anchor=Start Date
    # ClickText                 Date Picker                 anchor=End Date
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Chatter
    VerifyText                  Camp1
    VerifyText                  Advertisement
    VerifyText                  In Progress

    ClickText                   Campaigns
    VerifyText                  Camp1
    VerifyText                  Advertisement
    VerifyText                  In Progress


Entering A Campaign with Inactive state
    [tags]                      Campaign                    Git Repo Exercise
    Appstate                    Home
    LaunchApp                   Sales

    ClickText                   Campaigns
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    VerifyText                  Campaign Information
    UseModal                    On                          # Only find fields from open modal dialog

    TypeText                    Campaign Name               Camp2
    PickList                    Type                        Advertisement
    PickList                    Status                      In Progress
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Details                     anchor=Chatter
    VerifyText                  Camp2
    VerifyText                  Advertisement
    VerifyText                  In Progress

    ClickText                   Campaigns
    VerifyText                  Camp2
    VerifyText                  Advertisement
    VerifyText                  In Progress

Add members to campaign via 'Add Leads'

    Appstate                    Home
    LaunchApp                   Sales

    ClickText                   Campaigns
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    VerifyText                  Campaign Information
    UseModal                    On                          # Only find fields from open modal dialog

    TypeText                    Campaign Name               Camp3
    ClickText                   Active
    PickList                    Type                        Advertisement
    PickList                    Status                      In Progress
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Related                     anchor=Details
    ClickText                   Add Leads                   anchor=Campaign Members
    UseModal                    On

    UseTable                    Select 13 items
    ClickCell                   r1c2
    ClickCell                   r2c2
    ClickCell                   r3c2
    ClickCell                   r4c2
    ClickCell                   r5c2
    ClickCell                   r6c2
    ClickText                   Next
    UseModal                    On
    UseModal                    Off
    PickList                    Member Status               Responded
    ClickText                   Submit

    ClickText                   Related                     anchor=Details
    ClickText                   Campaign Members
    UseTable                    Item Number
    VerifyTable                 r1c4                        Tina Smith
    VerifyTable                 r2c4                        shalini Shende
    VerifyTable                 r3c4                        Meera Shende
    VerifyTable                 r4c4                        Cloudfulcrum Admin
    VerifyText                  r5c4                        K Naidu


Add members to campaign via 'Add Contacts'

    Appstate                    Home
    LaunchApp                   Sales

    ClickText                   Campaigns
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    VerifyText                  Campaign Information
    UseModal                    On                          # Only find fields from open modal dialog

    TypeText                    Campaign Name               Camp4
    ClickText                   Active
    PickList                    Type                        Advertisement
    PickList                    Status                      In Progress
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    ClickText                   Related                     anchor=Details
    ClickText                   Add Contacts                anchor=Campaign Members
    UseModal                    On
    UseTable                    Select 36 items
    ClickCell                   r1c2
    ClickCell                   r2c2
    ClickCell                   r3c2
    ClickCell                   r6c2
    ClickCell                   r8c2
    ClickText                   Next
    UseModal                    On
    PickList                    Member Status               Responded
    UseModal                    Off
    ClickText                   Submit

    ClickText                   Related                     anchor=Details
    ClickText                   Campaign Members            
    VerifyText                  K Naidu
    VerifyText                  Komal Daff
    VerifyText                  shalini Shende
    VerifyText                  Asia Khan
    VerifyText                  Cloudfulcrum Admin

Delete an existing campaign which has campaign members in it.
    [tags]                      Campaign                    Git Repo Exercise
    LaunchApp                   Sales
    ClickText                   Campaigns
    VerifyText                  Recently Viewed             timeout=120s

    Wait Until Keyword Succeeds                             1 min                       5 sec        ClickText    Camp3
    ClickText                   Show more actions
    ClickText                   Delete
    UseModal                    On
    ClickText                   Delete
    UseModal                    Off
    Wait Until Keyword Succeeds                             1 min                       5 sec        ClickText    Camp4
    ClickText                   Show more actions
    ClickText                   Delete
    UseModal                    On
    ClickText                   Delete
    UseModal                    Off

Clone Campaigns which is in active state
    LaunchApp                   Sales
    ClickText                   Campaigns
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   Select a List View
    ClickText                   All Active Campaigns        timeout=120s
    ClickText                   Camp3
    # cloning existing campaign with active state
    ClickText                   Clone                       anchor=Delete
    UseModal                    On
    ClickText                   Save
    UseModal                    Off
    ClickText                   Details                     anchor=Related
    VerifyText                  Camp3

Clone Campaigns which is in Inactive state
    LaunchApp                   Sales
    ClickText                   Campaigns
    VerifyText                  Recently Viewed             timeout=120s

    ClickText                   New                         anchor=Import
    VerifyText                  Campaign Information
    UseModal                    On                          # Only find fields from open modal dialog

    TypeText                    Campaign Name               Camp5
    PickList                    Type                        Advertisement
    PickList                    Status                      In Progress
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

    VerifyText                  Camp5

    # cloning existing campaign with inactive state
    ClickText                   Clone
    UseModal                    On
    TypeText                    Campaign Name*              Camp7
    ClickText                   Save                        partial_match=False
    UseModal                    Off

    VerifyText                  Camp7
    ClickText                   Details                     anchor=Related
    VerifyText                  Camp7


    ClickText    Close this window

    ClickText    Add Leads
    UseModal    On
    ClickText    Search <Entity>Search LeadsK Naidushalini12 ShendeTina SmithManagershalini Shendeshalini ShendeLoading...New LeadShow more »To remove the selected record, press Backspace or Del.
    ComboBox    Search Leads...    K Naidu
    UseTable    Select 14 items
    ClickCell    r2c2
    ClickCell    r3c2
    ClickCell    r4c2
    ClickCell    r3c2
    ClickCell    r5c2
    ClickCell    r6c2
