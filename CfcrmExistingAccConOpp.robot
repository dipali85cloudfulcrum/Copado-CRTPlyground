UseCase3: As a user I Should be able to use existing accounts, contacts and Opportunities to create the Project Resources.
    Appstate               Home
    ClickText              Contracts
    VerifyText             Recently Viewed             timeout=120s
    ClickText              New
    UseModal               On
    ClickText              Account Name
    ComboBox               Search Accounts...          Growmore
    ClickText              Contract Start Date
    ClickText              Today

    PickList               Status                      Draft
    TypeText               //*[@id\='15862:0']/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]    Test Scope

    TypeText               Billing Contact Email*      test@gmail.com
    TypeText               Contract Term (months)*     12
    TypeText               Payment Terms*              Dollers
    TypeText               Billing Email Listprovide all the emails who needs to be cc'd on invoices*    test1@gmail.com
    ClickText              Customer Signed Date
    ClickText              Today                       anchor=Cancel

    ClickText              Save                        partial_match=False
    UseModal               Off

    #Note the record id of the contract
    ClickText              Details                     anchor=Related
    ${contract_number}=    Get Text                    xpath=(//span[@class/="uiOutputText"])[3]
    Log                    ${contract_number}
    ${test_id}=            Get Text                    xpath=(//span[@class/="uiOutputText"])[1]
    Log                    ${test_id}

    #Add Contract to the Opportunity by filling Contract field on Opportunity.


    ClickText              Growmore-Opp
    ClickText              Details
    ClickText              Edit                        partial_match=False
    UseModal               On
    ComboBox               Search Contracts...         ${contract_number}
    TypeText               *Amount                     10000
    ClickText              Save                        partial_match=False
    UseModal               Off

    #Move Opportunity Stage to 'Closed Won' and save the record.
    ClickText              Closed
    ClickText              Select Closed Stage
    UseModal               On
     PickList               Stage               Closed Won
    ClickText              Save
    UseModal               Off

    #Validate the contract details have been copied to the Project on the Opportunity.
    

    ClickText              Project Growmore-Opp
    VerifyText             Project Growmore-Opp
    VerifyText             Growmore
    ClickText              Open Growmore Preview
    VerifyText             00000232
    VerifyText             4/4/2023
    VerifyText             6/3/2023
    VerifyText             Shalini
    VerifyText             Growmore-Opp
    ClickText              Information that you submit to the guidance panel can sometimes be transmitted to Trailhead, which is hosted outside your Salesforce org and subject to separate terms and conditions between you and Salesforce. If you have an existing Trailhead account associated with your work email, your in-progress and completed badges can sometimes be included.
    VerifyText             hkhdkh@gmail.com
    VerifyText             3/2/2023

    #Create a Employee --> Search for custom object eployee and create a new record.
    
    ClickText              Employees
    ClickText              New
    UseModal               On
    TypeText               Employee Name               Emp1
    TypeText               Email Id                    emp1@gmail.com
    PickList               Department                  IT
    PickList               Project Status              On Bench
    ClickText              Save                        partial_match=False
    UseModal               Off

    #Create a Project resource record and fill the Required fields.
    

    ClickText              Project Resources
    ClickText              New
    UseModal               On
    ComboBox               Search Projects...          Project Growmore-Opp
    ClickText              Start Date                  anchor=Undo Project
    ClickText              23
    ComboBox               Search Employees...         Emp1
    ClickText              End Date                    anchor=Undo Start Date
    ClickText              30
    ClickText              Save                        partial_match=False
    UseModal               Off

    #Verify that the Project resource is active or not.
    #This active Checkbox Will be Active/Inactive Based on the Project Start date and end date.
    VerifyText             Active
    VerifyText             4/4/2023
    VerifyText             6/3/2023
