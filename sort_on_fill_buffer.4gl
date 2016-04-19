DEFINE data_arr DYNAMIC ARRAY OF RECORD
    country STRING,
    medals INTEGER
END RECORD


MAIN
DEFINE ofs, len, i INTEGER
DEFINE display_arr DYNAMIC ARRAY OF RECORD
    country STRING,
    medals INTEGER
END RECORD

    CALL load_arr()
    CLOSE WINDOW SCREEN
    OPEN WINDOW arr WITH FORM "sort_on_fill_buffer"

    DISPLAY ARRAY display_arr TO scr.* ATTRIBUTES(UNBUFFERED, COUNT=data_arr.getLength())
        ON FILL BUFFER
            LET ofs = fgl_dialog_getBufferStart()
            LET len = fgl_dialog_getBufferLength()
            MESSAGE SFMT("ON FILL BUFFER called, start=%1, length=%2",ofs,len)
            FOR i=1 TO len 
                LET display_arr[i].* = data_arr[ofs+i-1].*
            END FOR

        ON SORT
            CALL data_arr.sort(DIALOG.getSortKey("scr"), DIALOG.isSortReverse("scr"))

    END DISPLAY
END MAIN

FUNCTION load_arr()
DEFINE row INTEGER
DEFINE ch base.Channel
DEFINE pos INTEGER
DEFINE line STRING
DEFINE tok base.StringTokenizer
DEFINE dummy STRING

    LET row = 0
    LET ch = base.Channel.create()
    CALL ch.openFile("sort_method.unl","r")
    -- File gets data from wikipedia page https://en.wikipedia.org/wiki/2012_Summer_Olympics_medal_table
    WHILE TRUE
        LET line = ch.readLine()
        IF ch.isEof() THEN
            EXIT WHILE
        END IF
        LET row = row + 1
        LET pos = line.getIndexOf(")",1)
        LET data_arr[row].country = line.subString(1,pos)
        LET tok = base.StringTokenizer.create(line.subString(pos+1, line.getLength()),"\t")

        -- Skip over medals, just interested in total for this example
        LET dummy = tok.nextToken()
        LET dummy = tok.nextToken()
        LET dummy = tok.nextToken()
        LET data_arr[row].medals = tok.nextToken()
    END WHILE
END FUNCTION