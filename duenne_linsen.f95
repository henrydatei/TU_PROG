program duenne_linsen
  use ivalmod
  implicit none

  real(kind=pr) :: fNull, bNull, deltaF, deltaB, gNull, deltaG
  type(interval) :: f, b, gZwei, gEins
  logical :: teilmenge

  write(*,*) "Wert fuer f_0, b_0, delta f und delta b eingeben"
  read(*,*) fNull, bNull, deltaF, deltaB

  gNull = 1/(1/fNull - 1/bNull)
  deltaG = deltaF/(1 - fNull/bNull)**2 + deltaB/(bNull/fNull - 1)**2
  gEins = IVAL(gNull-deltaG,gNull+deltaG)

  write(*,*) "Intervall g_1"
  call PUT(gEins)

  f = IVAL(fNull-deltaF, fNull+deltaF)
  b = IVAL(bNull-deltaB, bNull+deltaB)

  write(*,*) "Intervall f"
  call PUT(f)
  write(*,*) "Intervall b"
  call PUT(b)

  gZwei = intervallInverses((intervallInverses(f) - intervallInverses(b)))
  write(*,*) "Intergall g_2"
  call PUT(gZwei)

  teilmenge = gZwei .SB. gEins
  write(*,*) "Ist g_2 in g_1 enthalten: ", teilmenge

contains

  function intervallInverses(INTVAL)
      type (INTERVAL), intent(in) :: INTVAL
      type (INTERVAL)             :: intervallInverses
      real(kind=kind(0.0D0)) :: supr, infi

      supr = SUP(INTVAL)
      infi = INF(INTVAL)
      intervallInverses = IVAL(1/supr, 1/infi)
  end function intervallInverses


end program duenne_linsen
