program merge_hp
  use merge
  implicit none

  type(filecomp), dimension(:), allocatable :: arbeitsfeld
  integer :: anzahlDateien, i

  write(*,*) "Wie viele Dateien sollen gemischt werden?"
  read(*,*) anzahlDateien
  !anzahlDateien = 99
  allocate(arbeitsfeld(1:anzahlDateien))

  call phase1(anzahlDateien)
  write(*,*) "Phase 1 fertig"
  write(*,*) "------------------------------------------------"

  call phase2(arbeitsfeld, anzahlDateien)
  write(*,*) "Phase 2 fertig"
  write(*,*) "Sortiertes Feld mit ersten Zahlen"
  do i = 1, anzahlDateien
    write(*,*) "Unit: ", arbeitsfeld(i)%unitnummer, " Zahl: ", arbeitsfeld(i)%last_number_from_file
  end do
  write(*,*) "------------------------------------------------"

  call phase3(arbeitsfeld, anzahlDateien)
  write(*,*) "Phase 3 fertig"
end program merge_hp
