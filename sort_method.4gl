DEFINE arr DYNAMIC ARRAY OF RECORD
    country STRING,
    gold INTEGER, 
    silver INTEGER,
    bronze INTEGER,
    total INTEGER
END RECORD

MAIN
    CALL load_arr()
    CLOSE WINDOW SCREEN
    OPEN WINDOW arr WITH FORM "sort_method"

    DISPLAY ARRAY arr TO scr.* ATTRIBUTES(UNBUFFERED)
        BEFORE DISPLAY
            GOTO lbl_country_sort
        ON ACTION medal_sort ATTRIBUTES(TEXT="Sort on Medals")
            CALL arr.sort("country", FALSE)
            CALL arr.sort("bronze", TRUE)
            CALL arr.sort("silver", TRUE)
            CALL arr.sort("gold", TRUE)
        ON ACTION total_sort ATTRIBUTES(TEXT="Sort on Total Medals")
            CALL arr.sort("country", FALSE)
            CALL arr.sort("bronze", TRUE)
            CALL arr.sort("silver", TRUE)
            CALL arr.sort("gold", TRUE)
            CALL arr.sort("total", TRUE)
        ON ACTION country_sort ATTRIBUTES(TEXT="Sort on Country")
            LABEL lbl_country_sort:
            CALL arr.sort("country", FALSE)
        
    END DISPLAY
END MAIN

FUNCTION load_arr()
DEFINE row INTEGER
DEFINE ch base.Channel
DEFINE pos INTEGER
DEFINE line STRING
DEFINE tok base.StringTokenizer

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
        LET arr[row].country = line.subString(1,pos)
        LET tok = base.StringTokenizer.create(line.subString(pos+1, line.getLength()),"\t")
        
        LET arr[row].gold = tok.nextToken()
        LET arr[row].silver = tok.nextToken()
        LET arr[row].bronze = tok.nextToken()
        LET arr[row].total = tok.nextToken()
    END WHILE
END FUNCTION
        
    


