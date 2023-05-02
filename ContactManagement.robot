*** Settings ***
Resource           ../Resources/common.robot
#Library            DataDriver                  reader_class=TestDataApi    name=Leads.csv    #iterates through the Leads csv
Suite Setup        Setup Browser
Suite Teardown     End suite
Test Template      Entering A Contact With Data


*** Test Cases ***
Creating A Contact
    [tags]         Contact                     Git Repo Exercise
    Appstate       Home
    LaunchApp      Sales

    ClickText      Contact
    VerifyText     Recently Viewed             timeout=120s
    ClickText      New                         anchor=Import
    VerifyText     Contact Information
    UseModal       On                          # Only find fields from open modal dialog

    Picklist       Salutation                  Ms.
    TypeText       First Name                  Tina
    TypeText       Last Name                   Smith
    ComboBox       Search Accounts...          ROCL Acc1 Updated
    TypeText       Phone                       +12234567858449             First Name
    ClickText      Save                        partial_match=False
    UseModal       Off
    Sleep          2

    ClickText      Details                     anchor=Chatter
    VerifyText     Ms. Tina Smith
    VerifyField    Phone                       +12234567858449

    ClickText      Contacts
    VerifyText     Tina Smith
    VerifyText     ROCL Acc1 Updated
    VerifyText     +12234567858449

Udate Existing Contact
    [tags]         Contact                     Git Repo Exercise
    Appstate       Home
    LaunchApp      Sales

    ClickText      Contact
    VerifyText     Recently Viewed             timeout=120s
    ClickText      Chandra N

    ClickText      Details                     anchor=Chatter
    ClickText      Edit Name
    PickList       Salutation                  Ms.
    TypeText       First Name                  Pooja
    TypeText       Last Name                   K
    ComboBox       Search Accounts...          Deepti choudhary
    TypeText       Phone                       +12234567858449
    ClickText      Save
    ClickText      Details

    ClickText      Contacts
    VerifyText     Pooja K
    VerifyText     +12234567858449

Delete the Contact Record
    Appstate       Home
    LaunchApp      Sales

    ClickText      Contact
    VerifyText     Recently Viewed             timeout=120s
    ClickText      Crt1 Contact1
    ClickText      Delete
    ClickText      Delete
    ClickText      Close

Change Owner for the Contact
    Appstate       Home
    LaunchApp      Sales
    ClickText      Contact
    VerifyText     Recently Viewed             timeout=120s
    ClickText      Rahul
    ClickText      Details                     anchor=Related
    ClickText      Show more actions
    ClickText      Change Owner
    UseModal       On
    ComboBox       Search Users...             Navneeth Rokalla
    ClickText      Submit
    ClickText      Navneeth Rokalla

Import Contact
    [tags]         Contact                     SingleDataPoint
    Appstate       Home
    LaunchApp      Sales

    ClickText      Contacts
    VerifyText     Recently Viewed             timeout=120s
    ClickText      New
    VerifyText     Contact Information
    UseModal       On                          # Only find fields from open modal dialog

    TypeText       First Name                  ${First Name}
    TypeText       Last Name                   ${Last Name}
    ComboBox       Search Accounts...          ${Account Name}
    TypeText       Phone                       ${Phone}                    First Name

    ClickText      Save                        partial_match=False
    UseModal       Off
    Sleep          1
