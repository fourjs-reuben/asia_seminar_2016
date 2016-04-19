MAIN
DEFINE url, browser STRING
    OPEN WINDOW w WITH FORM "blank"
    MENU ""
        ON ACTION googlemaps ATTRIBUTES(TEXT="Google Maps")
            DISPLAY SFMT("http://maps.google.com/maps?q=%1,%2",48.613296,7.7077862) TO browser
        ON ACTION static_googlemaps ATTRIBUTES(TEXT="Google Maps (Static)")
            DISPLAY "https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284" TO browser
        ON ACTION video ATTRIBUTES(TEXT="Youtube Video")
            DISPLAY "https://www.youtube.com/watch?v=dM9rKLB7_2o" TO browser
        ON ACTION html ATTRIBUTES(TEXT="Web Page")
            DISPLAY "https://demo.4js.com/gas/demos.html" TO browser
        ON ACTION documentation ATTRIBUTES(TEXT="Documentation")
           DISPLAY "http://www.4js.com/online_documentation/fjs-fgl-manual-html/" TO browser
        ON ACTION html5test ATTRIBUTES(TEXT="HTML5 Test")
            DISPLAY "http://html5test.com" TO browser
        ON ACTION file ATTRIBUTES(TEXT="Local File")
            DISPLAY "file:///Users/reubenbarclay/helloworld.html" TO browser
        ON ACTION backtofutureday ATTRIBUTES(TEXT="Back to the Future Day")
            DISPLAY "http://www.october212015.com/" TO browser
        ON ACTION pdf ATTRIBUTES(TEXT="PDF")
        ON ACTION close
            EXIT MENU
    END MENU
END MAIN