program marathon_ausgabe
  use marathon

  integer :: x, z, p
  type(ergebnis), dimension(:), allocatable :: liste

  write(*,*) "Wie viele Läufer sind in der marathon.dat Datei?"
  read(*,*) x

  allocate(liste(x))

  call leseliste2(liste, z)

  !write(*,*) liste
  !write(*,*) "Es wurden ", z-1, "Eintraege in die Liste gemacht."

  liste = liste(1:z-1)

  call bubblesort(liste)

  write(*,*) "Sortierte Liste:"
  write(*,*) liste

  do p = 1, 3, 1
    write(*,*) p, ". Platz ", trim(liste(p)%name), " mit ",  &
    & liste(p)%gesamteZeit%stunden, "Stunden, ",  &
    & liste(p)%gesamteZeit%minuten, "Minuten und ", &
    & liste(p)%gesamteZeit%sekunden, "Sekunden."
  end do

contains

  subroutine bubblesort(liste)
    type(ergebnis), dimension(:), intent(inout) :: liste
    integer :: AnzahlListenElemente, i, n
    type(ergebnis) :: temp1, temp2

    AnzahlListenElemente = ubound(liste, dim=1)

    do n = AnzahlListenElemente, 1, -1
      do i = 0, n-1, 1
        if ( liste(i+1)%gesamteZeit < liste(i)%gesamteZeit ) then
          temp1 = liste(i)
          temp2 = liste(i+1)

          liste(i) = temp2
          liste(i+1) = temp1
        end if
      end do
    end do
  end subroutine bubblesort

end program marathon_ausgabe
