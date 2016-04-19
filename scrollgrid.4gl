MAIN
DEFINE arr DYNAMIC ARRAY OF RECORD
    lbl_code STRING,
    code   CHAR(3),
    lbl_desc STRING,
    desc   CHAR(100)
END RECORD
DEFINE i INTEGER

    FOR i = 1 TO 100
        LET arr[i].lbl_code = "Code"
        LET arr[i].lbl_desc = "Description"
        LET arr[i].code = i
        LET arr[i].desc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
    END FOR

    OPEN WINDOW w WITH FORM "scrollgrid_yes"
    DISPLAY ARRAY arr TO scr.*
    CLOSE WINDOW w

    OPEN WINDOW w WITH FORM "scrollgrid_no"
    DISPLAY ARRAY arr TO scr.*
    CLOSE WINDOW w
END MAIN