module mirpprimzahl
  implicit none

  integer :: zahl, zubestimmen, richtigePrimzahl

  contains

  function anzahlStellen(zubestimmen)
    implicit none
    integer :: anzahlStellen, zubestimmen, zaehler
    zaehler = 1

    do while(zubestimmen > 9)
      zubestimmen = zubestimmen/10
      zaehler = zaehler + 1
    end do
    anzahlStellen = zaehler
  end function anzahlStellen

  function primzahl(richtigePrimzahl)
      implicit none
      logical :: primzahl
      integer :: richtigePrimzahl, richtigePrimzahlBackup, j, intWurzel
      real :: realPrimzahl

      richtigePrimzahlBackup = richtigePrimzahl
      realPrimzahl = real(richtigePrimzahlBackup)
      intWurzel = int(sqrt(realPrimzahl)) + 1

      if (richtigePrimzahlBackup < 2) then
        primzahl = .FALSE.
        return
      end if

      if (mod(richtigePrimzahlBackup,2) == 0) then
        primzahl = .FALSE.
        return
      end if

      do j = 3, intWurzel
        if (mod(j,2) == 0) cycle
        if (mod(richtigePrimzahlBackup, j) == 0) then
          primzahl = .FALSE.
          return
        end if
      end do
      primzahl = .TRUE.

  end function primzahl

  function vonHintenNachVorne(zahl, potenz)
    implicit none
    integer :: zahl, tmp, ziffer, potenz, vonHintenNachVorne, zahlBackup, i
    tmp = 0
    zahlBackup = zahl

    do i = 1, (potenz - 1)
      ziffer = mod(zahlBackup,10)
      tmp = tmp + ziffer * (10 ** (potenz - 1))
      zahlBackup = zahlBackup/10
      potenz = potenz - 1
    end do

    tmp = tmp + zahlBackup

    vonHintenNachVorne = tmp
  end function vonHintenNachVorne

end module mirpprimzahl

program zahlenfinder
  use mirpprimzahl
  implicit none
  integer :: anfang, ende, stellen, eingabeBackup, Umkehrzahl, k, kbackup, kbackupbackup
  logical :: prim, mirp

  do
    write(*,*) "Alle Prim- und Mirpzahlen im Intervall [a,b] finden:"
    read(*,*) anfang, ende
    if (anfang < ende .AND. anfang >= 2 .AND. ende <= 1000000000) exit
  end do

  do k = anfang, ende
    kbackup = k
    kbackupbackup = k
    prim = primzahl(k)
    mirp = primzahl(vonHintenNachVorne(kbackup,anzahlStellen(kbackupbackup)))
    if (prim .AND. .NOT. mirp) write(*,*) k, "ist Primzahl"
    if (prim .AND. mirp) write(*,*) kbackup, "ist Mirpzahl"
  end do


end program zahlenfinder
