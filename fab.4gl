MAIN
DEFINE arr DYNAMIC ARRAY OF RECORD
    field1 STRING
END RECORD
DEFINE i INTEGER

    FOR i = 1 TO 3
        LET arr[i].field1 = i
    END FOR
    CALL ui.Interface.loadStyles("fab.4st")

    OPEN WINDOW w WITH FORM "fab"
    MENU ""
        ON ACTION fab ATTRIBUTES(TEXT="Append Only")
            DISPLAY ARRAY arr TO scr.* ATTRIBUTES(UNBUFFERED)
                ON APPEND
                    CALL FGL_WINMESSAGE("Info","Append Triggered","")
                    LET arr[arr_curr()].field1 = arr_curr()
            END DISPLAY
            CLEAR FORM

        ON ACTION update_fab ATTRIBUTES(TEXT="Update Only")
            DISPLAY ARRAY arr TO scr.* ATTRIBUTES(UNBUFFERED)
                ON UPDATE
                     CALL FGL_WINMESSAGE("Info","Update Triggered","")
            END DISPLAY
            CLEAR FORM

        ON ACTION both_fab ATTRIBUTES(TEXT="Both Only")
            DISPLAY ARRAY arr TO scr.* ATTRIBUTES(UNBUFFERED)
                 ON APPEND
                    CALL FGL_WINMESSAGE("Info","Append Triggered","")
                    LET arr[arr_curr()].field1 = arr_curr()
                ON UPDATE
                     CALL FGL_WINMESSAGE("Info","Update Triggered","")
            END DISPLAY
            CLEAR FORM

        ON ACTION close
            EXIT MENU

    END MENU
END MAIN