IMPORT util

MAIN
DEFINE arr DYNAMIC ARRAY OF RECORD
    code INTEGER,
    desc CHAR(40),
    qty INTEGER,
    state STRING
END RECORD
DEFINE i INTEGER

    FOR i = 1 TO 100
        LET arr[i].code = i
        LET arr[i].desc = "Description"
        LET arr[i].qty = util.Math.rand(101)
        CASE
            WHEN arr[i].qty > 75
                LET arr[i].state = "circle-red"
            WHEN arr[i].qty > 50
                LET arr[i].state = "circle-orange"
            OTHERWISE
                LET arr[i].state = "circle-green"
        END CASE
    END FOR
    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "warning_image"
    DISPLAY ARRAY arr TO scr.* ATTRIBUTES(UNBUFFERED)
       
    END DISPLAY
END MAIN