
DEFINE ip_address STRING
DEFINE port INTEGER
DEFINE app STRING

DEFINE url STRING

MAIN
    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "run_on_server"

    LET ip_address = "192.168.0.12"
    LET port = 6395
    LET app = "PhoneDemo_reubenbarclay"
    
    INPUT BY NAME ip_address, port, app, url ATTRIBUTES(UNBUFFERED, WITHOUT DEFAULTS=TRUE)
        BEFORE INPUT
            CALL calc_url()

        ON CHANGE ip_address, port, app
            CALL calc_url()
            
        ON ACTION launch 
            CALL calc_url()
            DISPLAY SFMT("Launching %1", url)
            TRY
                CALL ui.Interface.frontCall("mobile","runOnServer",[url],[])
            CATCH
                DISPLAY err_get(STATUS)
            END TRY
       
    END INPUT
END MAIN

FUNCTION calc_url()
    LET url = SFMT("http://%1:%2/ua/r/%3", ip_address,port, app)
END FUNCTION