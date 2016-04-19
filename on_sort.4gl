IMPORT util
MAIN
DEFINE arr DYNAMIC ARRAY OF RECORD
    code INTEGER,
    amt DECIMAL(11,2),
    running_total DECIMAL(11,2)
END RECORD
DEFINE i INTEGER
DEFINE running_total DECIMAL(11,2)

    FOR i = 1 TO 100
        LET arr[i].code = i
        LET arr[i].amt = util.Math.rand(10000)/100
    END FOR

    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "on_sort"

    DISPLAY ARRAY arr TO scr.* ATTRIBUTES(UNBUFFERED)
        BEFORE DISPLAY
            GOTO on_sort

        BEFORE ROW
            -- Use array tovisual index to map array row to visual row
            
            MESSAGE SFMT("Display row %1 is array row %2",  DIALOG.arrayToVisualIndex("scr",arr_curr()),arr_curr())
        ON SORT
            -- Populate running_total column based on current sort when sort triggered
            -- Use visualtoarray index to add rows
            LABEL on_sort:
            LET running_total = 0
            FOR i = 1 TO arr.getLength()
                LET running_total = running_total + arr[DIALOG.visualToArrayIndex("scr",i)].amt
                LET arr[DIALOG.visualToArrayIndex("scr",i)].running_total = running_total
            END FOR
            MESSAGE SFMT("Display row %1 is array row %2",  DIALOG.arrayToVisualIndex("scr",arr_curr()),arr_curr())
    END DISPLAY
END MAIN
    
