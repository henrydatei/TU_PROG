program einkaufssimulation
  use queuemod
  implicit none

  type(schlange), dimension(:), allocatable :: kassenbereich
  integer :: anzahl_kassen, i, stunde, minute, sekunde, menge, kurz
  real :: ankunftswahrscheinlichkeit, h

  write(*,*) "Wie viele Kassen sollen geoeffnet werden?"
  read(*,*) anzahl_kassen
  allocate(kassenbereich(1:anzahl_kassen))
  do i=1, anzahl_kassen
    call init(kassenbereich(i))
  end do

  write(*,*) "Ankunftswahrscheinlichkeit in jeder Sekunde"
  read(*,*) ankunftswahrscheinlichkeit

  call random_seed()

  do stunde=8, 21
    do minute=1, 59
      do sekunde=1, 60
        call random_number(h)
        if ( h < ankunftswahrscheinlichkeit ) then
          menge = random_int(10,300)

          call finde_kuerzeste_schlange(kassenbereich,kurz)

          call anstellen(kassenbereich(kurz),menge)

          write(*,*) "-----------------------------------"
          write(*,"(A,1X,1I2,':',1I2,':',1I2)") "Jemand hat sich angestellt. Es ist", stunde, minute, sekunde
          call gibt_alle_kassen_aus(kassenbereich)
        end if

        do i=1, anzahl_kassen
          if(.not. empty(kassenbereich(i))) then
            kassenbereich(i)%head%menge = kassenbereich(i)%head%menge - 1
            if(kassenbereich(i)%head%menge == 0) then
              call schlange_verkuerzen(kassenbereich(i))

              write(*,*) "-----------------------------------"
              write(*,"(A,1X,1I2,':',1I2,':',1I2)") "Jemand wurde bedient. Es ist", stunde, minute, sekunde
              call gibt_alle_kassen_aus(kassenbereich)
            end if
          end if
        end do

      end do
    end do
  end do

contains

  function random_int(unten, oben)
    integer :: unten, oben, random_int
    real :: h

    call random_number(h)
    random_int = unten + int(h * (oben-unten))
  end function random_int

  subroutine finde_kuerzeste_schlange(kassenmenge, nummer_der_kuerzesten_kasse)
    type(schlange), dimension(:), intent(in) :: kassenmenge
    integer, intent(out) :: nummer_der_kuerzesten_kasse
    integer :: anzahl_kassen, k, aktuelle_laenge, min

    nummer_der_kuerzesten_kasse = 1
    min = kassenmenge(1)%laenge
    anzahl_kassen = ubound(kassenmenge, dim=1)

    do k=1, anzahl_kassen
      aktuelle_laenge = kassenmenge(k)%laenge
      if ( aktuelle_laenge < min ) then
        min = aktuelle_laenge
        nummer_der_kuerzesten_kasse = k
      end if
    end do
  end subroutine finde_kuerzeste_schlange

  subroutine gibt_alle_kassen_aus(kassenmenge)
    type(schlange), dimension(:) :: kassenmenge
    integer :: i, anzahl_kassen

    anzahl_kassen = ubound(kassenmenge, dim=1)

    do i=1, anzahl_kassen
      call put(kassenmenge(i))
    end do
  end subroutine gibt_alle_kassen_aus
end program einkaufssimulation
