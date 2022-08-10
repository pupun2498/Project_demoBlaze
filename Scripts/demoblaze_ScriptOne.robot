*** Settings ***
Library    SeleniumLibrary
variables    ../Page_Objects/demoblaze_Page_Objects.py



*** Test Cases ***
TestCase_01
    Create Webdriver    Chrome    executable_path=${Chrome_driver_path}    
    Maximize Browser Window
    go to    ${demoblaze_url}
    sleep    2s
    Set Browser implicit Wait    10s
    
    ${product_icon_visible}    Run keyword and Return Status    Element should be Visible    ${product_Icon}
    Run Keyword IF    ${product_icon_visible}
    ...    log to console    Product Icon is Present
    ...    ELSE    Capture Page Screenshot     D:/CODING STUFF/ROBOT/PROJECTS/PROJECT_ONE/SCREENSHOTS/Error_Product_Icon.png
    ...    
    
    Execute JavaScript    scroll(0,800)   
    
    ${product_One_visible}    Run keyword and Return Status    Element should be Visible    ${product_One}
    Run Keyword IF    ${product_One_visible}
    ...    Click Element    ${product_one}
    ...    ELSE    Capture Page Screenshot     D:/CODING STUFF/ROBOT/PROJECTS/PROJECT_ONE/SCREENSHOTS/Error_ProductOne.png
    sleep    2s
    
    ${cart_Button_Visible}    Run Keyword and Return Status    Element should be visible    ${cart_Button}
    Run Keyword IF    ${cart_Button_Visible}
    ...    Click Element    ${cart_Button}
    ...    ELSE    Capture Page Screenshot    D:/CODING STUFF/ROBOT/PROJECTS/PROJECT_ONE/SCREENSHOTS/Error_CartButton.png
    sleep    2s
    
    ${alert_Message}=    Handle ALert    action=ACCEPT
    Should Be Equal    ${alert_Message}    Product added
    sleep    2s    
    Close Browser
    
TestCase_02
    Create Webdriver    Chrome    executable_path=${Chrome_driver_path}    
    Maximize Browser Window
    go to    ${demoblaze_url}
    sleep    2s
    Set Browser implicit Wait    10s
    Execute JavaScript    scroll(0,800)
    Click Element    ${product_one}
    Click Element    ${cart_Button}
    sleep    2s
    Handle ALert    action=ACCEPT
    
    #Open Cart
    ${cart_Icon_visible}    Run keyword and Return Status    Element should be Visible    ${cart_Icon}
    Run Keyword IF    ${cart_Icon_visible}
    ...    Click Element    ${cart_Icon}
    ...    ELSE    Capture Page Screenshot     D:/CODING STUFF/ROBOT/PROJECTS/PROJECT_ONE/SCREENSHOTS/Error_cart_Icon.png
    sleep    2s
    
    ${product_One_Icon_visible}    Run keyword and Return Status    Element should be Visible    ${product_One_Icon}
    Run Keyword IF    ${product_One_Icon_visible}
    ...    log to console    Element is visible
    ...    ELSE    Capture Page Screenshot     D:/CODING STUFF/ROBOT/PROJECTS/PROJECT_ONE/SCREENSHOTS/Error_product_One_Icon.png
    sleep    2s
    
    ${place_Order_visible}    Run keyword and Return Status    Element should be Visible    ${place_Order_Button}
    Run Keyword IF    ${place_Order_visible}
    ...    Click Element    ${place_Order_Button}
    ...    ELSE    Capture Page Screenshot     D:/CODING STUFF/ROBOT/PROJECTS/PROJECT_ONE/SCREENSHOTS/Error_place_Order_Button.png
    sleep    2s
    
    Input Text    ${place_Order_Name}    Ashutosh Mohapatra
    sleep    1s
    Input Text    ${place_Order_Country}    India
    sleep    1s
    Input Text    ${place_Order_City}    Odisha
    sleep    1s
    Input Text    ${place_Order_Credit}    9999 8888 7777 6666
    sleep    1s
    Input Text    ${place_Order_Month}    02
    sleep    1s
    Input Text    ${place_Order_Year}    26
    sleep    1s
    
    ${purchase_Button_visible}    Run keyword and Return Status    Element should be Visible    ${purchase_Button}
    Run Keyword IF    ${purchase_Button_visible}
    ...    Click Element    ${purchase_Button}
    ...    ELSE    Capture Page Screenshot     D:/CODING STUFF/ROBOT/PROJECTS/PROJECT_ONE/SCREENSHOTS/Error_purchase_Button.png
    sleep    2s
    
    ${confirm_Message_visible}    Get Text    ${confirm_Message}
    Should be Equal    ${confirm_Message_Visible}    Thank you for your purchase!    
    sleep    2s
    Close Browser