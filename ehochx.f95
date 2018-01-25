program ehochx
  implicit none
  real(kind=8) :: x
  real(kind=8) :: neuerSummand, letzterSummand, summe, letzteSumme, differenz, relativeDiffernz !Real-Zahlen haben nun die doppelte Genauigkeit

  integer :: i

  write(*,*) "Exponent für e^x eingeben. x = "
  read(*,*) x

  letzterSummand = 1
  summe = 1
  letzteSumme = 0
  i = 1
  do while(summe /= letzteSumme)
    neuerSummand = (letzterSummand*x)/i
    letzterSummand = neuerSummand
    letzteSumme = summe
    summe = summe + neuerSummand
    write(*,*) "Zwischenergebnis: ", summe, letzterSummand
    i = i + 1
  end do

  differenz = abs(summe) - abs(dexp(x))
  relativeDiffernz = differenz/dexp(x)
  write(*,*) "e^x = ",summe
  write(*,*) "hoffentlich richtiges Ergbnis: ", dexp(x);
  write(*,*) "Die absolute Differenz betraegt: ", differenz
  write(*,*) "relativ betraegt die Differenz ", relativeDiffernz * 100, "%."
  write(*,*) "Das hat uebrigens ",i - 1, "Durchlaeufe gedauert."

end program ehochx
