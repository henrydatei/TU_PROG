program zahlenzerlegung
  implicit none
  real(kind=8) :: zahl, quadratzahl

  write(*,*) "Bitte Zahl eingeben, die in Quadratzahlen zerlegt werden soll."
  read(*,*) zahl

  do while(zahl>0)
    quadratzahl = aint(sqrt(zahl))
    write(*,*) "Quadratzahl: ", quadratzahl
    zahl = zahl - (quadratzahl)**2
  end do

end program zahlenzerlegung
