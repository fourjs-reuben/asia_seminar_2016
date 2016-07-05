IMPORT os

DEFINE arr DYNAMIC ARRAY OF RECORD
    imagename STRING,
    code STRING,
    img STRING
END RECORD
DEFINE arr3 DYNAMIC ARRAY OF RECORD
    img3 STRING
END RECORD
MAIN

    CALL ui.Interface.loadStyles("fontawesome.4st")
    DISPLAY FGL_GETENV("FGLIMAGEPATH")
    CALL add_images_to_array(SFMT("%1%2lib%2image2font.txt",FGL_GETENV("FGLDIR"), os.Path.separator()))
    CALL add_images_to_array("my_image2font.txt")
    
    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "fontawesome"
    DIALOG
        DISPLAY ARRAY arr TO scr.*
            BEFORE DISPLAY
                MESSAGE "Custom Images from my_image2font.txt are at end of list"
            BEFORE ROW
                DISPLAY arr[arr_curr()].img TO img2
        END DISPLAY
        DISPLAY ARRAY arr3 TO scr3.*
        END DISPLAY
        ON ACTION close
            EXIT DIALOG
    END DIALOG
END MAIN



FUNCTION add_images_to_array(filename)
DEFINE filename STRING

DEFINE ch base.Channel
DEFINE line STRING
DEFINE equal_pos, colon_pos STRING

    LET ch = base.Channel.create()
    CALL ch.openFile(filename,"r")
    WHILE TRUE
        LET line = ch.readLine()
        IF ch.isEof() THEN
            EXIT WHILE
        END IF
        IF line MATCHES "#*" THEN
            -- ignore comments
            CONTINUE WHILE
        END IF
        LET equal_pos = line.getIndexOf("=",1)
        LET colon_pos = line.getIndexOf(":",1)
        LET arr[arr.getLength()+1].imagename = line.subString(1,equal_pos-1)
        LET arr[arr.getLength()].img = arr[arr.getLength()].imagename

        LET arr[arr.getLength()].code = line.subString(colon_pos+1, line.getLength())

        LET arr3[arr.getLength()].img3 = arr[arr.getLength()].imagename
    END WHILE
    CALL ch.close()
END FUNCTION

