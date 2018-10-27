MODULE puzzlemodule
    IMPLICIT NONE
    PRIVATE
    PUBLIC lies_puzzle, loese_puzzle, schreibe_loesche_puzzle,m,n
    
    TYPE teil
        INTEGER, DIMENSION(4) :: seiten
        CHARACTER             :: z
    END TYPE teil
    
    TYPE(teil), PARAMETER     :: kein_Teil=teil((/0,0,0,0/),"")
    INTEGER                   :: m, n
    TYPE(teil), DIMENSION(:), ALLOCATABLE :: teileliste
    TYPE(teil), DIMENSION(:,:), ALLOCATABLE :: puzzle
    
   CONTAINS
    
    SUBROUTINE lies_puzzle(dateiname)
        CHARACTER(LEN=*), INTENT(IN) :: dateiname
        INTEGER :: ios,i
        
        OPEN(UNIT=35, FILE=dateiname, IOSTAT=ios, ACTION="READ", STATUS="old")
        
        IF(ios==0) THEN
            READ(UNIT=35,FMT=*) m,n
            ALLOCATE(teileliste(m*n))
            ALLOCATE(puzzle(m,n))
            DO i=1,m*n
                READ(UNIT=35,FMT=*) teileliste(i) 
            END DO
            CLOSE(UNIT=35)
        END IF
        
        
    END SUBROUTINE lies_puzzle
    
    FUNCTION dreh(puzzleteil)
        TYPE(teil), INTENT(IN) :: puzzleteil
        TYPE(teil) :: dreh

        dreh%seiten(4)=puzzleteil%seiten(3)
        dreh%seiten(3)=puzzleteil%seiten(2)
        dreh%seiten(2)=puzzleteil%seiten(1)
        dreh%seiten(1)=puzzleteil%seiten(4)
        dreh%z=puzzleteil%z
        
    END FUNCTION dreh
    
    FUNCTION passendes_teil(form1,seite)
        INTEGER, INTENT(IN) :: form1, seite
        INTEGER :: i, j, k
        TYPE(teil) :: passendes_teil
        
 outer: DO i=1,m*n
            DO j=1,4
                IF(teileliste(i)%seiten(j)==form1) THEN
                    passendes_teil=teileliste(i)
                    teileliste(i)=kein_Teil
                    DO k=1,4+seite-j
                        passendes_teil=dreh(passendes_teil)
                    END DO
                    EXIT outer
                END IF
            END DO
        END DO outer
    END FUNCTION
    
    SUBROUTINE loese_puzzle()
        INTEGER :: i,j
 outer: DO i=1,m*n
            IF(teileliste(i)%seiten(3)==teileliste(i)%seiten(4)) THEN
                puzzle(1,1)=teileliste(i)
                teileliste(i)=kein_Teil
                EXIT outer
            END IF
        END DO outer
        
        DO i=2,n
            puzzle(1,i)=passendes_teil(-puzzle(1,i-1)%seiten(1),3)
        END DO
        
        DO i=2,m
            DO j=1,n
                puzzle(i,j)=passendes_teil(-puzzle(i-1,j)%seiten(2),4)
            END DO
        END DO
        
    END SUBROUTINE loese_puzzle
    
    SUBROUTINE schreibe_loesche_puzzle()
        INTEGER :: i,j
        DO i=1,m
            DO j=1,n
                WRITE(UNIT=6,FMT='(A)',ADVANCE='no') puzzle(i,j)%z
            END DO
            WRITE(*,*)
        END DO
        DEALLOCATE(teileliste,puzzle)
    END SUBROUTINE schreibe_loesche_puzzle
END MODULE puzzlemodule
