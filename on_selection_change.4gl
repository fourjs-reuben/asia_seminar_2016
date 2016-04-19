IMPORT util
MAIN
DEFINE arr DYNAMIC ARRAY OF RECORD
    code INTEGER,
    value DECIMAL(11,2)
END RECORD
DEFINE i INTEGER
DEFINE count INTEGER

    FOR i = 1 TO 100
        LET arr[i].code = i
        LET arr[i].value = (util.Math.rand(20000)/100) - 50
    END FOR
    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "on_selection_change"
    DISPLAY ARRAY arr TO scr.*
        BEFORE DISPLAY
            CALL DIALOG.setSelectionMode("scr",TRUE)

        ON SELECTION CHANGE
            FOR i = 1 TO arr.getLength()
                IF DIALOG.isRowSelected("scr",i) THEN  
                    IF arr[i].value < 0 THEN
                        ERROR "Can't select a negative value"
                        CONTINUE DISPLAY
                    END IF
                END IF
            END FOR
            
        
    END DISPLAY
END MAIN