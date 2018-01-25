program magisches_quadrat
  implicit none
  integer :: n
  integer,dimension(:,:), allocatable :: A
  integer :: i,m, aktuelleZeile, aktuelleSpalte, ausgabeZeile, loru, rolu,k

  do
    write(*,*) "magisches Quadrat mit n Spalten und Zeilen generieren, n ungerade"
    read(*,*) n
    if(mod(n,2)==1) exit
  end do

  allocate(A(n,n))
  A = 0
  m = (n+1)/2
  aktuelleZeile = 1
  aktuelleSpalte = m
  write(*,*) "Setze in Zeile:", aktuelleZeile, "und Spalte:", aktuelleSpalte, "die Zahl ",1
  A(aktuelleZeile,aktuelleSpalte) = 1

  do i = 2, n**2
    if((A(aktuelleZeile-1,aktuelleSpalte-1) /= 0) .OR. aktuelleZeile-1<1 .OR. aktuelleSpalte-1<1) then
      if(aktuelleZeile==1 .AND. aktuelleSpalte==1) then
        aktuelleZeile = 2
        write(*,*) "1"
      else
        if(aktuelleZeile==1 .AND. (aktuelleSpalte /= 1)) then
          aktuelleZeile = n
          aktuelleSpalte = aktuelleSpalte-1
          write(*,*) "2"
        else
          if((aktuelleZeile /= 1) .AND. aktuelleSpalte==1) then
            aktuelleZeile = aktuelleZeile-1
            aktuelleSpalte = n
            write(*,*) "3"
          else
            if((aktuelleZeile /= 1) .AND. (aktuelleSpalte /= 1)) then
              aktuelleZeile = aktuelleZeile+1
              write(*,*) "4"
            end if
          end if
        end if
      end if
    else
      aktuelleZeile = aktuelleZeile - 1
      aktuelleSpalte = aktuelleSpalte - 1
    end if

    A(aktuelleZeile, aktuelleSpalte) = i
    write(*,*) "Setze in Zeile:", aktuelleZeile, "und Spalte:", aktuelleSpalte, "die Zahl ",i
  end do

  write(*,*) "Dein magisches Quadrat:"
  do ausgabeZeile=1, n
    write(*,*) A(ausgabeZeile, 1:n)
  end do

  do k=1,n
      loru = loru + A(k,k)
  end do
  do k=1,n
      rolu = rolu + A(k,n-(k-1))
  end do
  write(*,*) "Ueberpruefung"
  write(*,*) "Zeilen: ", sum(A,1)
  write(*,*) "Spalten: ", sum(A,2)
  write(*,*) "Diagonale lo nach ru", loru
  write(*,*) "Diagonale ro nach lu", rolu
  deallocate(A)
end program magisches_quadrat
