MAIN
DEFINE yyyymmddhhmm DATETIME YEAR TO MINUTE
DEFINE yyyymmddhhmmss DATETIME YEAR TO SECOND
DEFINE yyyymmddhhmm_old DATETIME YEAR TO MINUTE
DEFINE yyyymmddhhmmss_old DATETIME YEAR TO SECOND

    LET yyyymmddhhmmss = CURRENT
    LET yyyymmddhhmm = yyyymmddhhmmss 
    LET yyyymmddhhmm_old = yyyymmddhhmmss
    LET yyyymmddhhmmss_old = yyyymmddhhmmss

    OPEN WINDOW w WITH FORM "datetimeedit"
    DISPLAY FGL_GETENV("DBDATE")
    OPTIONS INPUT WRAP
    INPUT BY NAME yyyymmddhhmm,yyyymmddhhmmss, yyyymmddhhmm_old,yyyymmddhhmmss_old ATTRIBUTES(UNBUFFERED, WITHOUT DEFAULTS=TRUE)
END MAIN