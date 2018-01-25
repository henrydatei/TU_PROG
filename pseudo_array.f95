program pseudo_array
  implicit none
  integer :: anzahl, i
  integer :: zahl, maximum, minimum, summe, mittel
  summe = 0

  do
    write(*,*) "Wie viele Zahlen?"
    read(*,*) anzahl
    if (anzahl >= 1) then
      exit
    end if
  end do

  write(*,*) "Zahl eingeben"
  read(*,*) zahl

  write(*,*) "Das Maximum ist", zahl
  write(*,*) "Das Minimum ist", zahl
  write(*,*) "Die Summe aller Zahlen ist", zahl
  write(*,*) "Das Mittel aller Zahlen ist", zahl

  do i=2, anzahl
    write(*,*) "Zahl eingeben"
    read(*,*) zahl

    if(zahl > maximum) then
      maximum = zahl
    end if

    if(zahl < minimum) then
      minimum = zahl
    end if

    summe = summe + zahl
    mittel = real(summe)/i

    write(*,*) "Das Maximum ist", maximum
    write(*,*) "Das Minimum ist", minimum
    write(*,*) "Die Summe aller Zahlen ist", summe
    write(*,*) "Das Mittel aller Zahlen ist", mittel
  end do

end program pseudo_array
