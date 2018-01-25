program kredit
real(kind=4) :: kreditHoehe, rate, zinssatz, restSchuld, zinsenGesamt
integer :: laufzeit

  write(*,*) "Kredithoehe und Zinssatz in Prozent eingeben"
  read(*,*) kreditHoehe, zinssatz
  restSchuld = kreditHoehe

  write(*,*) "Bitte die Rate eingeben"
  read(*,*) rate

  do while(rate <= kreditHoehe*(zinssatz/100) )
    write(*,*) "Wie waere es den mal mit einer hoeheren Rate? Sonst wirst du nie fertig!"
    read(*,*) rate
  end do

  laufzeit = 0
  zinsenGesamt = 0

  do while(restSchuld > 0)
    laufzeit = laufzeit + 1
    zinsenGesamt = zinsenGesamt + (restSchuld * (zinssatz/100))
    restSchuld = restSchuld + (restSchuld * (zinssatz/100))
    write(*,*) "Ihre Schuld betraegt ", restSchuld, " Euro."
    if(rate > restSchuld) then
      rate = restSchuld
      write(*,*) "Das Ende Ihrer Laufzeit ist in Sicht. Ihre letzte Rate betraegt ", rate, " Euro."
    end if
    write(*,*) "Sie zahlen Ihre Rate. Ihre neue Schuld betraegt ", restSchuld - rate, " Euro."
    restSchuld = restSchuld - rate
  end do

  write(*,*) "Endlich fertig nach ", laufzeit, " Jahren."
  write(*,*) "Insgesamt haben Sie ", zinsenGesamt, " Euro an Zinsen gezahlt."
end program kredit
