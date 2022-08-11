*** Settings ***
Library    SeleniumLibrary
Variables    ..//Page_Objects//demoblaze_Page_Objects.py

*** Keyword ***
Launch Browser    
    [Documentation]    Launch Browser and open specified url
    [Arguments]    ${url}
    Create Webdriver    Chrome    executable_path=${Chrome_driver_path}    
    Maximize Browser Window
    go to    ${url}
    sleep    2s
    Set Browser implicit Wait    10s
    
Scroll
    [Documentation]    Scroll down by given value in Argumemt
    [Arguments]    ${y}
    Execute JavaScript    scroll(0,${y})
    
Click Element if Visible
    [Documentation]    Check if Element is visible and Click Element
    [Arguments]    ${product_variable}
    ${Storing_Variable}    Run Keyword and Return Status    Element should be Visible    ${product_variable}
    Run Keyword IF    ${Storing_Variable}
    ...    Click Element    ${product_variable}
    ...    ELSE    Capture Page Screenshot     D:/CODING STUFF/ROBOT/PROJECTS/PROJECT_ONE/SCREENSHOTS/Error.png
    ...    
   
Check if Element is Visible
    [Documentation]    Check if Element is visible
    [Arguments]    ${product_variable}
    ${Storing_Variable}    Run Keyword and Return Status    Element should be Visible    ${product_variable}
    Run Keyword IF    ${Storing_Variable}
    ...    log to console    ${product_variable}
    ...    ELSE    Capture Page Screenshot     D:/CODING STUFF/ROBOT/PROJECTS/PROJECT_ONE/SCREENSHOTS/Error.png
    ...    
   
Handle Alert if present
    [Documentation]    Handle any alert
    [Arguments]    ${Accept_Decline}    ${Alert_Expected_Text}
    ${alert_Message}=    Handle ALert    action=${Accept_Decline}
    Should Be Equal    ${alert_Message}    ${Alert_Expected_Text}
    
Enter Username
    [Documentation]    Enter your username. Takes one argument
    [Arguments]    ${username}
    Input Text    ${place_Order_Name}    ${username}
    
Enter Country
    [Documentation]    Enter your username. Takes one argument
    [Arguments]    ${country}
    Input Text    ${place_Order_Country}    ${country}
    
Enter City
    [Documentation]    Enter your username. Takes one argument
    [Arguments]    ${City}
    Input Text    ${place_Order_City}    ${City}
    
Enter Credit
    [Documentation]    Enter your username. Takes one argument
    [Arguments]    ${Credit}
    Input Text    ${place_Order_Credit}    ${Credit}
    
Enter Month
    [Documentation]    Enter your username. Takes one argument
    [Arguments]    ${Month}
    Input Text    ${place_Order_Month}    ${Month}
    
Enter Year
    [Documentation]    Enter your username. Takes one argument
    [Arguments]    ${Year}
    Input Text    ${place_Order_Year}    ${Year}
    
Verify Text
    [Documentation]    Verify the expected text. Takes two Arguments
    [Arguments]    ${actual_Text}    ${expected_Text}
    ${confirm_Message_visible}    Get Text    ${actual_Text}
    Should be Equal    ${confirm_Message_Visible}    ${expected_Text} 