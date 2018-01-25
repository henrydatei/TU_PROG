PROGRAM RoundingError
  IMPLICIT NONE
  INTEGER, PARAMETER :: real_kind = SELECTED_REAL_KIND(P=6, R=37)
  real(KIND=real_kind) :: x,y,z
  write(*,*) "Zahlen x und y eingeben"
  read(*,*) x,y

  z = x**4 - 4*y**4 - 4*y**2
  write(*,*) "ganz banal die Rechnung x^4-y^4-2y^2 durchführen: ", z

  z= x*x*x*x - 4*y*y*y*y - 4*y*y
  WRITE(*,*) "jetzt x*x*x*x - 4*y*y*y*y - 4*y*y: ", z

  z= (x**2)**2 - (2*y**2)**2 - (2*y)**2
  WRITE(*,*) "(x^2)^2 - (2y^2)^2 - (2y)^2 = ", z

  z= (x**2)**2 - (2*y)**2*(y**2 + 1)
  WRITE(*,*) "(x^2)^2 - (2y)^2*2(y^2+1) = ", z

  z= (x*x - 2*y*(y+1)) * (x*x + 2*y*(y+1)) + 8*y**3
  WRITE (*,*) "(x*x - 2y(y+1)) * (x*x + 2y(y+1)) + 8y^3", z

  z= (x**2 - 2*y**2) * (x**2 + 2*y**2) - 4*y**2
  WRITE (*,*) "(x^2 - 2y^2) * (x^2 + 2y^2) - 4y^2", z
END PROGRAM RoundingError
