MAIN
DEFINE field1, field2 CHAR(100)

    OPTIONS FIELD ORDER FORM
    OPTIONS INPUT WRAP
    
    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "copy_readonly"
    
    DISPLAY
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum' 
    TO field1

    INPUT BY NAME field2 ATTRIBUTES(UNBUFFERED)
        BEFORE INPUT
            MESSAGE "Select and copy portion of text from top textedit to the bottom textedit"
    END INPUT
END MAIN