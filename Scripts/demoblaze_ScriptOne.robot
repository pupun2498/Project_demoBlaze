*** Settings ***
Library    SeleniumLibrary
variables    ../Page_Objects/demoblaze_Page_Objects.py
Resource    ..//Keywords//demoblaze_Keywords.robot



*** Test Cases ***
TestCase_01
    Launch Browser    ${demoblaze_url}    
    
    Check if Element is visible    ${product_Icon}
    Scroll    ${700}   
    
    Click Element if Visible    ${product_One}
    sleep    2s
    
    Click Element if Visible    ${cart_Button}
    sleep    2s
    
    Handle Alert if present    ACCEPT    Product added
    sleep    2s    
    Close Browser
    
TestCase_02
    Launch Browser    ${demoblaze_url}
    sleep    2s
    Scroll    ${700}
    Click Element if Visible    ${product_One}
    Click Element if Visible    ${cart_Button}
    sleep    2s
    Handle Alert if present    ACCEPT    Product added
    Sleep    2s
    
    #Open Cart
    Click Element if Visible    ${cart_Icon}
    Sleep    2s
    
    Check if Element is Visible    ${product_One_Icon}
    sleep    2s
    
    Click Element if Visible    ${place_Order_Button}
    sleep    2s
    
    Enter Username    Test User Name
    sleep    1s
    Enter Country    India
    sleep    1s
    Enter City    Odisha
    sleep    1s
    Enter Credit    9999 8888 7777 6666
    sleep    1s
    Enter Month    02
    sleep    1s
    Enter Year    26
    sleep    1s
    
    Click Element if Visible    ${purchase_Button}
    sleep    2s
    
    Verify Text    ${confirm_Message}    Thank you for your purchase!    
    sleep    2s
    Close Browser