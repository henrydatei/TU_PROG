PROGRAM puzzlehp
    USE puzzlemodule
    IMPLICIT NONE
    CHARACTER(LEN=30) :: dateiname
    
    WRITE(*,*) "gib den Dateinamen ein"
    READ(*,*) dateiname
    
    m=0
    n=0
    
    CALL lies_puzzle(dateiname)
    IF(.NOT. m+n==0) THEN
        CALL loese_puzzle()
        CALL schreibe_loesche_puzzle()
    ELSE
        WRITE(*,*) "Es existiert kein Puzzle mit diesem Dateinamen"
    END IF
    
END PROGRAM
