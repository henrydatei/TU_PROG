program sparmod_hp
  use sparmod
  implicit none

  type(sparvektor) :: v, w

  call init(v)
  call init(w)

  write(*,*) "Erster Vektor"
  call lesevektor(v)

  write(*,*) "Zweiter Vektor"
  call lesevektor(w)

  write(*,*) "----------------------------------------------"

  write(*,*) "Der erste Vektor war:"
  call GibVektorAus(v)

  write(*,*) "Der zweite Vektor war:"
  call GibVektorAus(w)

  write(*,*) "----------------------------------------------"

  write(*,*) "Das Skalarprodukt ist:", v * w

  write(*,*) "----------------------------------------------"

  write(*,*) "Betrag Vektor 1:", betrag2(v)

  write(*,*) "Betrag Vektor 2:", betrag2(w)
end program sparmod_hp
