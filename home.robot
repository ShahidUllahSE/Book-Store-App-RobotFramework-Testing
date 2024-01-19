*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}  http://localhost:3000

*** Test Cases ***

# Test Case 1: Should Load Registration Form
Should Load Registration Form
    [Documentation]    Open the registration page and check if the form is displayed.
    Open Browser    ${BASE_URL}/registration    browser=chrome
    Page Should Contain    Registration Form
    Close Browser

# Test Case 2: Should Display Error for Incomplete Form Submission
Should Display Error for Incomplete Form Submission
    [Documentation]    Submit the registration form without filling out all the fields and check for an error.
    Open Browser    ${BASE_URL}/registration    browser=chrome
    Submit Registration Form   
    Page Should Contain    Please fill out all the fields.
    Close Browser

# Test Case 3: Should Display Error for Invalid Email Format
Should Display Error for Invalid Email Format
    [Documentation]    Enter an invalid email format and check for an error.
    Open Browser    ${BASE_URL}/registration    browser=chrome
    Input Text    id=email    invalid_email
    Submit Registration Form    
    Page Should Contain    Invalid email format
    Close Browser

# Test Case 4: Should Successfully Register a New User
Should Successfully Register a New User
    [Documentation]    Fill out the registration form with valid details and check for success.
    Open Browser    ${BASE_URL}/registration    browser=chrome
    Fill Registration Form with Valid Details   
    Submit Registration Form   
    Page Should Contain    User has been successfully registered
    Page Should Contain    /login 
    Close Browser

# Test Case 5: Should Navigate to Login Page When Clicking on Submit Button
Should Navigate to Login Page When Clicking on Submit Button
    [Documentation]    Fill out the form and check if it redirects to the login page.
    Open Browser    ${BASE_URL}/registration    browser=chrome
    Fill Registration Form with Valid Details   
    Click Element    css=button[type="submit"]
    Location Should Be    ${BASE_URL}/login
    Close Browser

# Test Case 6: Should Display Error for Server-Side Registration Failure
Should Display Error for Server-Side Registration Failure
    [Documentation]    Simulate a server-side registration failure and check for an error.
    Open Browser    ${BASE_URL}/registration    browser=chrome
    Submit Registration Form with Server Failure   
    Page Should Contain    Internal server error
    Close Browser

# Test Case 7: Should Clear the Form After Successful Registration
Should Clear the Form After Successful Registration
    [Documentation]    Fill out the form, submit it, and check if the form is cleared.
    Open Browser    ${BASE_URL}/registration    browser=chrome
    Fill Registration Form with Valid Details    
    Submit Registration Form 
    Page Should Contain    User has been successfully registered
    Form Fields Should Be Cleared   
    Close Browser

# Test Case 8: Should Display Notification for Registration Error
Should Display Notification for Registration Error
    [Documentation]    Simulate a registration error and check for an error notification.
    Open Browser    ${BASE_URL}/registration    browser=chrome
    Submit Registration Form with Error   
    Page Should Contain    Registration error message
    Close Browser

# Test Case 9: Should Display Notification for Network Error
Should Display Notification for Network Error
    [Documentation]    Simulate a network error during registration and check for a notification.
    Open Browser    ${BASE_URL}/registration    browser=chrome
    Submit Registration Form with Network Error   
    Page Should Contain    Network error message
    Close Browser

# Test Case 10: Should Redirect to Login Page After Successful Registration
Should Redirect to Login Page After Successful Registration
    [Documentation]    Fill out the form, submit it, and check if it redirects to the login page.
    Open Browser    ${BASE_URL}/registration    browser=chrome
    Fill Registration Form with Valid Details   
    Submit Registration Form    
    Location Should Be    ${BASE_URL}/login
    Close Browser






*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem

*** Variables ***
${BASE_URL}     http://localhost:3000
${DRIVER_PATH}  www.google.com   

*** Test Cases ***

# Test Case 1: Should Load Login Form
Should Load Login Form
    [Documentation]    Open the login page and check if the form is displayed.
    Open Browser    ${BASE_URL}/login    browser=chrome    executable_path=${DRIVER_PATH}
    Page Should Contain    Login Form
    Close Browser

# Test Case 2: Should Display Error for Empty Email and Password Fields
Should Display Error for Empty Email and Password Fields
    [Documentation]    Submit the login form without filling out email and password fields and check for an error.
    Open Browser    ${BASE_URL}/login    browser=chrome    executable_path=${DRIVER_PATH}
    Submit Login Form   
    Page Should Contain    Please fill out all the fields.
    Close Browser

# Test Case 3: Should Display Error for Invalid Email Format
Should Display Error for Invalid Email Format
    [Documentation]    Enter an invalid email format and check for an error.
    Open Browser    ${BASE_URL}/login    browser=chrome    executable_path=${DRIVER_PATH}
    Input Text    id=email    invalid_email
    Submit Login Form    
    Page Should Contain    Invalid email format
    Close Browser

# Test Case 4: Should Successfully Login with Valid Credentials
Should Successfully Login with Valid Credentials
    [Documentation]    Fill out the login form with valid details and check for successful login.
    Open Browser    ${BASE_URL}/login    browser=chrome    executable_path=${DRIVER_PATH}
    Fill Login Form with Valid Details   
    Submit Login Form   
    Page Should Contain    User has been successfully logged in
    Page Should Contain    /home 
    Close Browser

# Test Case 5: Should Navigate to Home Page When Clicking on Submit Button
Should Navigate to Home Page When Clicking on Submit Button
    [Documentation]    Fill out the form and check if it redirects to the home page.
    Open Browser    ${BASE_URL}/login    browser=chrome    executable_path=${DRIVER_PATH}
    Fill Login Form with Valid Details  
    Click Element    css=button[type="submit"]
    Location Should Be    ${BASE_URL}/home
    Close Browser

# Test Case 6: Should Display Error for Incorrect Login Credentials
Should Display Error for Incorrect Login Credentials
    [Documentation]    Simulate incorrect login credentials and check for an error.
    Open Browser    ${BASE_URL}/login    browser=chrome    executable_path=${DRIVER_PATH}
    Submit Login Form with Incorrect Credentials   
    Page Should Contain    Invalid email or password
    Close Browser

# Test Case 7: Should Display Notification for Login Error
Should Display Notification for Login Error
    [Documentation]    Simulate a login error and check for an error notification.
    Open Browser    ${BASE_URL}/login    browser=chrome    executable_path=${DRIVER_PATH}
    Submit Login Form with Error  
    Page Should Contain    Login error message
    Close Browser

# Test Case 8: Should Display Notification for Network Error
Should Display Notification for Network Error
    [Documentation]    Simulate a network error during login and check for a notification.
    Open Browser    ${BASE_URL}/login    browser=chrome    executable_path=${DRIVER_PATH}
    Submit Login Form with Network Error   
    Page Should Contain    Network error message
    Close Browser

# Test Case 9: Should Redirect to Home Page After Successful Login
Should Redirect to Home Page After Successful Login
    [Documentation]    Fill out the form, submit it, and check if it redirects to the home page.
    Open Browser    ${BASE_URL}/login    browser=chrome    executable_path=${DRIVER_PATH}
    Fill Login Form with Valid Details    
    Submit Login Form   
    Location Should Be    ${BASE_URL}/home
    Close Browser

# Test Case 10: Should Clear the Form After Successful Login
Should Clear the Form After Successful Login
    [Documentation]    Fill out the form, submit it, and check if the form is cleared.
    Open Browser    ${BASE_URL}/login    browser=chrome    executable_path=${DRIVER_PATH}
    Fill Login Form with Valid Details    
    Submit Login Form    
    Form Fields Should Be Cleared   
    Close Browser

*** Keywords ***

Submit Login Form
    [Arguments]    ${email}=${EMPTY}    ${password}=${EMPTY}
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}
    Click Element    css=button[type="submit"]

Fill Login Form with Valid Details
    [Arguments]    ${email}=${EMPTY}    ${password}=${EMPTY}
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}

Submit Login Form with Incorrect Credentials
    [Arguments]    ${email}=${EMPTY}    ${password}=${EMPTY}
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}
    Click Element    css=button[type="submit"]

Submit Login Form with Error
    [Arguments]    ${email}=${EMPTY}    ${password}=${EMPTY}
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}

Submit Login Form with Network Error
    [Arguments]    ${email}=${EMPTY}    ${password}=${EMPTY}
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}

Form Fields Should Be Cleared


*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem

*** Variables ***
${BASE_URL}     http://localhost:3000
${DRIVER_PATH} www.google.com   

*** Test Cases ***

# Test Case 1: Should Display Message for Logout without Active Session
Should Display Message for Logout without Active Session
    [Documentation]    Open the logout page and check if a message is displayed when attempting to logout without an active session.
    Open Browser    ${BASE_URL}/logout    browser=chrome    executable_path=${DRIVER_PATH}
    Page Should Contain    Already logged out
    Location Should Be    ${BASE_URL}/home
    Close Browser

# Test Case 2: Should Successfully Logout and Display Success Message
Should Successfully Logout and Display Success Message
    [Documentation]    Open the logout page, simulate a successful logout, and check if a success message is displayed.
    Open Browser    ${BASE_URL}/logout    browser=chrome    executable_path=${DRIVER_PATH}
    Page Should Contain    Successfully logged out
    Location Should Be    ${BASE_URL}/home
    Close Browser

# Test Case 3: Should Remove Token from Local Storage Upon Successful Logout
Should Remove Token from Local Storage Upon Successful Logout
    [Documentation]    Open the logout page, simulate a successful logout, and check if the token is removed from local storage.
    Open Browser    ${BASE_URL}/logout    browser=chrome    executable_path=${DRIVER_PATH}
    Execute JavaScript    localStorage.setItem('token', 'test_token')
    Submit Logout Form with Success    
    Execute JavaScript    return localStorage.getItem('token') == null
    Should Be True    ${result}
    Close Browser

# Test Case 4: Should Handle Logout Error and Display Error Message
Should Handle Logout Error and Display Error Message
    [Documentation]    Open the logout page, simulate a logout error, and check if an error message is displayed.
    Open Browser    ${BASE_URL}/logout    browser=chrome    executable_path=${DRIVER_PATH}
    Submit Logout Form with Error   
    Page Should Contain    Logout error message
    Close Browser

# Test Case 5: Should Redirect to Home Page After Logout
Should Redirect to Home Page After Logout
    [Documentation]    Open the logout page, simulate a successful logout, and check if it redirects to the home page.
    Open Browser    ${BASE_URL}/logout    browser=chrome    executable_path=${DRIVER_PATH}
    Submit Logout Form with Success    
    Location Should Be    ${BASE_URL}/home
    Close Browser

*** Keywords ***

Submit Logout Form with Success
    # Implement this keyword to simulate successful logout

Submit Logout Form with Error
    # Implement this keyword to simulate logout error



*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${BASE_URL}       http://localhost:3000
${DRIVER_PATH}   www.google.com 

*** Test Cases ***

# Test Case 1: Should Display Search Input Field
Should Display Search Input Field
    Open Browser    ${BASE_URL}    browser=chrome    executable_path=${DRIVER_PATH}
    Input Text      id=search      Sample Book    
    Submit Form     id=search
    Wait Until Element Is Visible    css=p.font-medium.text-lg
    Page Should Contain    Search Result

# Test Case 2: Should Display "No matching result found" Initially
Should Display "No matching result found" Initially
    Open Browser    ${BASE_URL}    browser=chrome    executable_path=${DRIVER_PATH}
    Wait Until Element Is Visible    css=p.font-medium.text-lg
    Page Should Contain    No matching result found

# Test Case 3: Should Perform a Search and Display Search Results
Should Perform a Search and Display Search Results
    Open Browser    ${BASE_URL}    browser=chrome    executable_path=${DRIVER_PATH}
    Input Text      id=search      Sample Book    
    Submit Form     id=search
    Wait Until Element Is Visible    css=th.px-4.py-2
    Page Should Contain    Sample Book

# Test Case 4: Should Handle Empty Search Query and Display "No matching result found"
Should Handle Empty Search Query and Display "No matching result found"
    Open Browser    ${BASE_URL}    browser=chrome    executable_path=${DRIVER_PATH}
    Submit Form     id=search
    Wait Until Element Is Visible    css=p.font-medium.text-lg
    Page Should Contain    No matching result found

# Test Case 5: Should Handle Server Error During Search and Display an Error Notification
Should Handle Server Error During Search and Display an Error Notification
    Open Browser    ${BASE_URL}    browser=chrome    executable_path=${DRIVER_PATH}
    Set Browser Implicit Wait    10s
    Input Text      id=search      Error Book   
    Submit Form     id=search
    Wait Until Element Is Visible    css=.notification-error
    Page Should Contain    Internal Server Error


