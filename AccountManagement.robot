# Tip: Everything that starts with # is a guidance for you and will not get executed.

*** Settings ***

Documentation          Test suite for CRT starter.
Library                QWeb
Library                QForce
Suite Setup            Open Browser                about:blank                 chrome
Suite Teardown         Close All Browsers


*** Test Cases ***

    
createAcc With Billing Address
    [Documentation]    Test Case created using the QEditor
    GoTo               http://test.salesforce.com
    TypeText           Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret         Password                    Qazwsx123
    ClickText          Log In to Sandbox
    ClickText          Home
    ClickText          Sales

    ClickText          Account
    ClickText          New                         anchor=Import
    VerifyText         Account Information
    UseModal           On                          # Only find fields from open modal dialog

    TypeText           Account Name                Acc by CRT1
    Picklist           Sales Owner                 Shalini
    TypeText           Phone                       +12234567858449             Fax
    TypeText           Website                     https://www.cloudfulcrum.com/
    TypeText           Billing Street              Street 12
    TypeText           Billing City                Hyderabad
    TypeText           Billing State/Province      Telangana
    TypeText           Billing Zip/Postal Code     500034
    TypeText           Billing Country             India

    ClickText          Save                        partial_match=False
    UseModal           Off
    Sleep              2

    ClickText          Details                     anchor=Related
    VerifyText         Street 12
    VerifyText         Hyderabad
    VerifyText         Telangana
    VerifyText         500034
    VerifyText         India
    ClickText          Account
    VerifyText         Acc by CRT1
    VerifyText         +12234567858449



Create Acc With shippingAdreess
    GoTo               http://test.salesforce.com
    TypeText           Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret         Password                    Qazwsx123
    ClickText          Log In to Sandbox
    ClickText          Home
    ClickText          Sales

    ClickText          Account
    ClickText          New                         anchor=Import
    VerifyText         Account Information
    UseModal           On                          # Only find fields from open modal dialog

    TypeText           Account Name                Acc by CRT2
    Picklist           Sales Owner                 Shalini
    TypeText           Phone                       +12234467858449
    TypeText           Website                     https://www.cloudfulcrum.com/
    TypeText           Shipping Street             Street 12
    TypeText           Shipping City               Hyderabad
    TypeText           Shipping State/Province     Telangana
    TypeText           Shipping Zip/Postal Code    500034
    TypeText           Shipping Country            India

    ClickText          Save                        partial_match=False
    UseModal           Off
    Sleep              2

    ClickText          Details                     anchor=Related
    VerifyText         Shalini
    VerifyText         +12234467858449
    VerifyText         https://www.cloudfulcrum.com/
    VerifyText         Street 12
    VerifyText         Hyderabad
    VerifyText         Telangana
    VerifyText         500034
    VerifyText         India

    ClickText          Account
    VerifyText         Acc by CRT2
    VerifyText         +12234467858449


Create Account with Billiing and shipping Address

    GoTo               http://test.salesforce.com
    TypeText           Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret         Password                    Qazwsx123
    ClickText          Log In to Sandbox
    ClickText          Home
    ClickText          Sales

    ClickText          Account
    ClickText          New                         anchor=Import
    VerifyText         Account Information
    UseModal           On                          # Only find fields from open modal dialog

    TypeText           Account Name                CloudFulcrum Acc
    Picklist           Sales Owner                 Shalini
    TypeText           Phone                       +122367858449               Fax
    TypeText           Website                     https://www.cloudfulcrum.com/
    TypeText           Billing Street              Street 21
    TypeText           Billing City                Hyderabad
    TypeText           Billing State/Province      Telangana
    TypeText           Billing Zip/Postal Code     500021
    TypeText           Billing Country             India
    TypeText           Shipping Street             Street 21
    TypeText           Shipping City               Hyderabad
    TypeText           Shipping State/Province     Telangana
    TypeText           Shipping Zip/Postal Code    500034
    TypeText           Shipping Country            India
    ClickText          Save                        partial_match=False
    UseModal           Off
    Sleep              2

    ClickText          Details                     anchor=Related
    VerifyText         Street 21
    VerifyText         Hyderabad
    VerifyText         Telangana
    VerifyText         500021
    VerifyText         India
    ClickText          Account
    VerifyText         CloudFulcrum Acc
    VerifyText         +122367858449

Update Existing Account
    GoTo               http://test.salesforce.com
    TypeText           Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret         Password                    Qazwsx123
    ClickText          Log In to Sandbox
    ClickText          Home
    ClickText          Sales
    ClickText          Account
    ClickText          Acc by CRT1
    ClickText          Details
    ClickText          Edit Account Name
    TypeText           Account Name                Acc by CRT1 Updated
    VerifyText         +12234567858449
    TypeText           Phone                       77777
    PickList           Sales Owner                 James Roberts
    PickList           Type                        Prospect
    PickList           Industry                    Agriculture
    ClickText          Save
    VerifyText         Agriculture
    VerifyText         Prospect
    VerifyText         Acc by CRT1 Updated
    VerifyText         77777



Delete Existing Record

    GoTo               http://test.salesforce.com
    TypeText           Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret         Password                    Qazwsx123
    ClickText          Log In to Sandbox
    ClickText          Home
    ClickText          Sales
    ClickText          Account
    VerifyText         Recently Viewed             timeout=120s
    ClickText          CloudFulcrum Acc
    ClickText          Delete
    ClickText          Delete
    ClickText          Close

Change owner of the Account and create contact
    GoTo               http://test.salesforce.com
    TypeText           Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret         Password                    Qazwsx123
    ClickText          Log In to Sandbox
    ClickText          Home
    ClickText          Sales

    ClickText          Account                     anchor=Files
    ClickText          New                         anchor=Import
    VerifyText         Account Information
    UseModal           On                          # Only find fields from open modal dialog

    TypeText           Account Name                ChangeOwner Account
    Picklist           Sales Owner                 Aneesha N
    TypeText           Phone                       +33333
    PickList           Industry                    Banking
    ClickText          Save                        partial_match=False
    UseModal           Off
    Sleep              2
    ClickText          Details                     anchor=Related
    VerifyText         ChangeOwner Account
    VerifyText         +33333


    ClickText          Contacts
    ClickText          New                         anchor=Import
    VerifyText         Contact Information
    UseModal           On                          # Only find fields from open modal dialog
    PickList           Salutation                  Mr.
    TypeText           First Name                  Crt1
    TypeText           Last Name                   Contact1
    ComboBox           Search Accounts...          ChangeOwner Account
    TypeText           Phone                       +11111
    TypeText           Email                       crt1.cf1@gmail.com
    ClickText          Save                        partial_match=False
    UseModal           Off
    Sleep              2
    ClickText          Details                     anchor=Related
    VerifyText         Mr. Crt1 Contact1
    VerifyText         +11111
    VerifyText         ChangeOwner Account
    ClickText          Contact
    ClickText          New                         anchor=Import
    VerifyText         Contact Information
    UseModal           On                          # Only find fields from open modal dialog
    PickList           Salutation                  Mrs.
    TypeText           First Name                  Crt2
    TypeText           Last Name                   Contact2
    ComboBox           Search Accounts...          ChangeOwner Account
    TypeText           Phone                       +22222
    TypeText           Email                       crt2.cf2@gmail.com
    ClickText          Save                        partial_match=False
    UseModal           Off
    Sleep              2
    ClickText          Details                     anchor=Related
    VerifyText         Mrs. Crt2 Contact2
    ClickText          Contact

    ClickText          Account                     anchor=Files
    ClickText          ChangeOwner Account
    ClickText          Details                     anchor=Related
    VerifyText         ChangeOwner Account
    ClickText          Change Owner
    UseModal           On
    ClickText          Navneeth Rokalla
    ClickText          Submit
    UseModal           Off
    Sleep              2
    VerifyText         Navneeth Rokalla

    ClickText          Contacts                    anchor=Campaigns
    ClickText          Crt1 Contact1
    ClickText          Details                     anchor=Related
    VerifyText         Mr. Crt1 Contact1
    VerifyText         +11111
    VerifyText         ChangeOwner Account
    ClickText          Show more actions
    ClickText          Change Owner                anchor=Show more actions
    UseModal           On
    ComboBox           Search Users...             Navneeth Rokalla
    ClickText          Submit
    UseModal           Off
    Sleep              2
    VerifyText         Navneeth Rokalla

    ClickText         Contacts                    anchor=Campaigns
    ClickText          Crt12 Contact2
    ClickText          Details                     anchor=Related
    VerifyText         Mrs. Crt1 Contact1
    VerifyText         +22222
    VerifyText         ChangeOwner Account
    ClickText          Show more actions
    ClickText          Change Owner                anchor=Show more actions
    UseModal           On
    ComboBox           Search Users...             Navneeth Rokalla
    ClickText          Submit
    UseModal           Off
    Sleep              2
    VerifyText         Navneeth Rokalla





Account Sharing 
    GoTo               http://test.salesforce.com
    TypeText           Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret         Password                    Qazwsx123
    ClickText          Log In to Sandbox
    ClickText          Home
    ClickText          Accounts
    ClickText          ChangeOwner Account
    ClickText          Details
    ClickText          Show more actions
    ClickText          Sharing
    UseModal           On
    ClickText          Pick an object
    ComboBox           Search User...              Vishnu Teja
    ClickText          Save
    UseModal           Off


Import Account(N/A)

    GoTo               http://test.salesforce.com
    TypeText           Username                    vishnu.r@cloudfulcrum.com.testingpoc
    TypeSecret         Password                    Qazwsx123
    ClickText          Log In to Sandbox
    ClickText          Home
    ClickText          Account
    ClickText          Import                      anchor=New
    ClickText          Accounts and Contacts
    ClickText          Add new records
    ClickText          CSV                         anchor=File
    ClickText          Choose File
    ClickText          Dipali Maroti - CloudFulcrum India Private Limited
    ClickText          Book1
    ClickText          Open
    ClickText          Next
    ClickText          Next
    ClickText          Start Import                anchor=Previous
    ClickText          Ok
