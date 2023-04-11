*** Settings ***
Resource           ../Resources/common.robot
Suite Setup        Setup Browser
Suite Teardown     End suite


*** Test Cases ***
Account Hierarchy
    [tags]         Account                     Git Repo Exercise
    Appstate       Home
    LaunchApp      Sales

    ClickText      Accounts
    VerifyText     Recently Viewed             timeout=120s
    ClickText      Account for CRT
    ClickText      Edit                        partial_match=False
    UseModal       On

    ClickText      Clear Selection
    ComboBox       Search Accounts...          Acc1
    ClickText      Save                        partial_match=False
    UseModal       Off
    ClickText      Details
    ClickText      Acc1
    ClickText      View Account Hierarchy
    ClickText      Account Hierarchy
    ClickText      Acc1                        anchor=Collapse
    ClickText      Details
    ClickText      Edit                        partial_match=False
    UseModal       On
    ClickText      Clear Selection
    ComboBox       Search Accounts...          Acc2
    ClickText      Save                        partial_match=False
    UseModal       Off
    ClickText      Acc2
    ClickText      View Account Hierarchy
    ClickText      Expand
    ClickText      Acc2                        anchor=Account Name
    ClickText      Details
    ClickText      Edit Parent Account
    ClickText      Clear Selection
    ComboBox       Search Accounts...          Acc3
    ClickText      Save
    ClickText      Acc3
    ClickText      Edit                        partial_match=False
    UseModal       On
    ClickText      Clear Selection
    ComboBox       Search Accounts...          Acc4
    ClickText      Save                        partial_match=False
    UseModal       Off
    ClickText      Details
    ClickText      Acc4

    # See Account Hierarchy
    ClickText      View Account Hierarchy
    VerifyText     Acc4current
    VerifyText     Acc3
    ClickText      Expand
    VerifyText     Acc2
    ClickText      Expand
    VerifyText     Acc1
    ClickText      Expand
    VerifyText     Account for CRT
    ClickText      Accounts

Convert lead
    [tags]         Lead                        Git Repo Exercise
    Appstate       Home
    LaunchApp      Sales

    ClickText      Leads
    VerifyText     Recently Viewed             timeout=120s
    ClickText      Asia Khan
    ClickText      Convert                     anchor=Edit
    UseModal       On
    ClickText      Don't create an opportunity upon conversion checkbox    on
    ClickText      Convert                     anchor=Account
    UseModal       On
    # Create task:
    ClickText      New Task
    UseModal       Off
    UseModal       On
    PickList       Subject                     Call
    ClickText      Due Date                    anchor=Subject
    ClickText      29
    ClickText      Save
    UseModal       Off

    ClickText      New Task
    UseModal       On
    PickList       Subject                     Email
    ClickText      Due Date                    anchor=Subject
    TypeText       Due Date                    4/5/2023
    PickList       Status                      In Progress
    ClickText      Save
    UseModal       Off
    ClickText      Close this window

    ClickText      Accounts
    ClickText      AA Architect

    ClickText      Contacts
    ClickText      Asia Khan


Delete Converted Account and Contact:
    [tags]         Account                     Git Repo Exercise
    Appstate       Home
    LaunchApp      Sales

    ClickText      Accounts
    VerifyText     Recently Viewed             timeout=120s
    ClickText      AA Architect
    ClickText      Delete                      anchor=Change Owner
    UseModal       On
    ClickText      Delete
    UseModal       Off

Create Lead
    ClickText      Leads
    VerifyText     Recently Viewed             timeout=120s
    ClickText      New                         anchor=Import
    ClickText      Cloudfulcrum
    ClickText      Next
    VerifyText     Lead Information
    UseModal       On                          # Only find fields from open modal dialog

    Picklist       Salutation                  Ms.
    TypeText       First Name                  Asia
    TypeText       Last Name                   Khan
    Picklist       Lead Status                 Open
    TypeText       Phone                       +888888                     First Name
    TypeText       Company                     AA Architect                Last Name
    TypeText       Title                       Designer                    Address Information
    TypeText       Email                       asia.khan@gmail.com         Rating
    PickList       Sales Owner                 Shalini
    TypeText       Website                     https://www.artchitect.com/

    ClickText      Lead Source
    ClickText      Advertisement
    ClickText      Save                        partial_match=False
    UseModal       Off
    Sleep          2

    ClickText      Details                     anchor=Chatter
    VerifyText     Ms. Asia Khan
    VerifyText     Shalini                     anchor=Sales Owner
    VerifyField    Phone                       +888888
    VerifyField    Company                     AA Architect
    VerifyField    Website                     https://www.artchitect.com/

    ClickText      Leads
    VerifyText     Asia Khan
    VerifyText     Designer
    VerifyText     AA Architect

Create an opportunity with first sales stage and then move it to later stage.
    [tags]         Opportunity                 Git Repo Exercise
    Appstate       Home
    LaunchApp      Sales

    ClickText      Opportunities
    VerifyText     Recently Viewed             timeout=120s
    ClickText      New
    UseModal       On
    ClickText      CloudFulcrum
    ClickText      Next
    UseModal       Off
    UseModal       On
    TypeText       Opportunity Name            Opp2
    ComboBox       Search Accounts...          CF
    PickList       Business Unit               Cloudfulcrum
    PickList       Sales Owner                 Anil Reddy
    ClickText      *Close Date
    ClickText      30
    PickList       Stage                       Prospecting
    ClickText      Save
    UseModal       Off

    ClickText      Closed                      anchor=Mark Stage as Complete
    ClickText      Select Closed Stage
    UseModal       On
    DropDown       3942:0                      Closed Lost
    ClickText      Select a closed stage...
    ClickText      Save
    Clicktext      Save
    UseModal       Off

    ClickText      Details                     anchor=Activity
    VerifyText     Closed Lost
