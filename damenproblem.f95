PROGRAM damenproblem
    IMPLICIT NONE
    
    INTEGER :: n, lsg
    REAL :: t1,t2
    
outer:DO
    
        WRITE(*,*) "n eingeben:"
        READ(*,*) n
        
        IF(n<1) EXIT
        
        lsg=0
        
        
        
        CALL cpu_time(t1)
        
        CALL dame(n)
        
        CALL cpu_time(t2)
        
        WRITE(*,*) "Es gibt ", lsg, "Lösungen"
        WRITE(*,*) "Dauer:", t2-t1, "Sekunden"
        
        
    END DO outer
    
    
    
    
   CONTAINS
   
    SUBROUTINE dame(n)
        INTEGER, INTENT(in) :: n
        INTEGER, DIMENSION(:,:), ALLOCATABLE :: schachbrett
        INTEGER :: i,j
        
        ALLOCATE(schachbrett(n,n))
        
        DO i=1,n/2
            schachbrett=0
            schachbrett(2:,i)=1
            DO j=1,n+1-i
                schachbrett(j,i+j-1)=1
            END DO
            DO j=1,i
                schachbrett(j,i-j+1)=1
            END DO
            CALL setzen(2,schachbrett)
            
        END DO
        lsg=lsg*2
        
        IF(MOD(n,2)==1) THEN
            schachbrett=0
            schachbrett(2:,(n+1)/2)=1
            DO j=1,(n+1)/2
                schachbrett(j,n/2+j)=1
                schachbrett(j,n/2+2-j)=1
            END DO
            CALL setzen(2,schachbrett)
        END IF
        
        DEALLOCATE(schachbrett)
        
    END SUBROUTINE
    
    RECURSIVE SUBROUTINE setzen(spalte,schachbrett)
        INTEGER, INTENT(in) :: spalte
        INTEGER, INTENT(inout), DIMENSION(n,n) :: schachbrett
        INTEGER, DIMENSION(n,n) :: schachbrett2
        INTEGER :: i,j
        
        IF(spalte/=n) THEN
            DO i=1,n
                IF(schachbrett(spalte,i)==0) THEN
                    !schachbrett(spalte,:)=schachbrett(spalte,:)+1
                    schachbrett(spalte+1:,i)=schachbrett(spalte+1:,i)+1
                    DO j=max(spalte+1,i+spalte-n),min(n,i+spalte-1)
                        schachbrett(j,i+spalte-j)=schachbrett(j,i+spalte-j)+1
                    END DO
                    DO j=max(spalte+1,spalte-i+1),min(n,spalte-i+n)
                        schachbrett(j,i-spalte+j)=schachbrett(j,i-spalte+j)+1
                    END DO
                    schachbrett(spalte,i)=666
                    CALL setzen(spalte+1,schachbrett)
                    
                    !schachbrett(spalte,:)=schachbrett(spalte,:)-1
                    schachbrett(spalte+1:,i)=schachbrett(spalte+1:,i)-1
                    DO j=max(spalte+1,i+spalte-n),min(n,i+spalte-1)
                        schachbrett(j,i+spalte-j)=schachbrett(j,i+spalte-j)-1
                    END DO
                    DO j=max(spalte+1,spalte-i+1),min(n,spalte-i+n)
                        schachbrett(j,i-spalte+j)=schachbrett(j,i-spalte+j)-1
                    END DO
                    schachbrett(spalte,i)=0
                END IF
            END DO
        ELSE
            DO i=1,n
                IF(schachbrett(spalte,i)==0) THEN
                    lsg=lsg+1
!                    DO j=1,n
!                        WRITE(*,*) schachbrett2(:,j)
!                    END DO
!                    WRITE(*,*)
                END IF
            END DO
        END IF
    END SUBROUTINE
    
END PROGRAM
