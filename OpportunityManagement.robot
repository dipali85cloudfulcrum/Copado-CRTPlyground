*** Settings ***
Resource                ../Resources/common.robot
Suite Setup             Setup Browser
Suite Teardown          End suite


*** Test Cases ***
Entering A Opportunity
    [tags]              Opportunity                 Git Repo Exercise
    Appstate            Home
    LaunchApp           Sales

    ClickText           Opportunities
    VerifyText          Recently Viewed             timeout=120s
    ClickText           New                         anchor=Import
    ClickText           CloudFulcrum
    ClickText           Next
    VerifyText          Opportunity Information
    UseModal            On                          # Only find fields from open modal dialog
    TypeText            Opportunity Name            Opp1
    ComboBox            Search Accounts...          Account for CRT
    PickList            *Business Unit              Cloudfulcrum
    PickList            *Sales Owner                Anil Reddy
    ClickText           *Close Date
    ClickText           30
    PickList            *Stage                      Prospecting
    ClickText           Save                        partial_match=False

    ClickText           Details
    VerifyText          Opp1
    VerifyText          Account for CRT
    VerifyText          Cloudfulcrum
    VerifyText          Anil Reddy
    VerifyText          3/30/2023
    VerifyText          Prospecting

Create new opportunity without Account Name
    [tags]              Opportunity                 Git Repo Exercise
    Appstate            Home
    LaunchApp           Sales

    ClickText           Opportunities
    VerifyText          Recently Viewed             timeout=120s
    ClickText           New                         anchor=Import
    ClickText           CloudFulcrum
    ClickText           Next
    VerifyText          Opportunity Information
    UseModal            On                          # Only find fields from open modal dialog
    TypeText            Opportunity Name            Opp2
    PickList            *Business Unit              Cloudfulcrum
    PickList            *Sales Owner                Anil Reddy
    ClickText           *Close Date
    ClickText           30
    PickList            *Stage                      Prospecting
    ClickText           Save                        partial_match=False
    ClickText           Cancel

Update Existing Opportunity
    LaunchApp           Sales

    ClickText           Opportunities
    VerifyText          Recently Viewed             timeout=120s
    ClickText           Opp1
    ClickText           Edit                        anchor=Delete
    PickList            *Business Unit              ReleaseOwl
    PickList            *Sales Owner                Srikanth N
    ClickText           Save                        partial_match=False

    ClickText           Details
    VerifyText          Opp1
    VerifyText          Account for CRT
    VerifyText          ReleaseOwl
    VerifyText          Srikanth N

Delete existing opportunity
    [tags]              Opportunity                 Git Repo Exercise
    Appstate            Home
    LaunchApp           Sales
    ClickText           Opportunities
    VerifyText          Recently Viewed             timeout=120s
    ClickText           Opp1
    ClickText           Delete
    ClickText           Delete

Add contact role on the opportunity
    [tags]              Opportunity                 Git Repo Exercise
    Appstate            Home
    LaunchApp           Sales
    # create new opportunity record.
    ClickText           Opportunities
    VerifyText          Recently Viewed             timeout=120s
    ClickText           New                         anchor=Import
    ClickText           CloudFulcrum
    ClickText           Next
    VerifyText          Opportunity Information
    UseModal            On                          # Only find fields from open modal dialog
    TypeText            Opportunity Name            Opp4
    ComboBox            Search Accounts...          xyz
    PickList            *Business Unit              Cloudfulcrum
    PickList            *Sales Owner                Anil Reddy
    ClickText           *Close Date
    ClickText           30
    PickList            *Stage                      Prospecting
    ClickText           Save                        partial_match=False
    UseModal            Off
    # Verify the text.
    ClickText           Details
    VerifyText          Opp4
    VerifyText          xyz
    # Add Contact Roles
    ClickText           Related
    ClickText           Contact Roles
    UseModal            On
    ClickText           Add Contact Roles
    ComboBox            Search Contacts...          K Naidu
    ClickText           Next
    ClickText           Save
    UseModal            Off
    ClickText           Opportunities
    ClickText           Opp4
    ClickText           Related
    VerifyText          Contact Roles
    VerifyText          K Naidu

Edit existing contact roles
    [tags]              Opportunity                 Git Repo Exercise
    Appstate            Home
    LaunchApp           Sales
    #Edit Opportunity contact roles
    ClickText           Opportunities
    VerifyText          Recently Viewed             timeout=120s
    ClickText           Opp4
    ClickText           Related
    ClickText           Show more actions           anchor=Contact Roles(1)
    ClickText           Add Contact Roles           anchor=Sandbox: TestingPOC
    ComboBox            Search Contacts...          shalini Shende
    ClickText           Next
    ClickText           Save
    UseModal            Off
    VerifyText          Contact Roles\n(2)
    VerifyPageHeader    K Naidu
    VerifyPageHeader    shalini Shende

Add Partners to the opportunity
    Appstate            Home
    LaunchApp           Sales
    #Add partners to the opportunity
    ClickText           Opportunities
    VerifyText          Recently Viewed             timeout=120s
    ClickText           Opp4
    ClickText           Related
    ClickText           Partners(0)
    ClickText           New
    ComboBox            Search Accounts...          Cloudfulcrum
    UseTable            Primary
    ClickCell           r2c3
    ClickText           Advertiser                  anchor=Account
    ComboBox            Search Accounts...          Account for CRT
    ClickCell           r3c3
    ClickText           Agency                      anchor=Account
    ClickText           Save
    ClickText           Opportunities
    ClickText           Opp4
    VerifyText          Partners(2)
