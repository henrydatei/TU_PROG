program diff_hp
  use diffmod
  implicit none

  real :: a,b, schrittweite, zaehler

  zaehler = 0

  write(*,*) "untere Grenze eingeben"
  read(*,*) a

  write(*,*) "Schrittweite eingeben"
  read(*,*) schrittweite

  do
    write(*,*) "obere Grenze eingeben"
    read(*,*) b
    if(a + schrittweite <= b) exit
  end do

  do
    call put(funktion(a + zaehler * schrittweite))
    zaehler = zaehler + 1
    if(a + zaehler * schrittweite > b) exit
  end do
end program diff_hp
