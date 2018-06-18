program neue_matmul
  use matmul_mod
  implicit none

  real, dimension(:,:), allocatable :: A, B, implementiert, simple, strassen
  integer :: i, n, k, zeile, spalte
  real :: start, finish
  character(len=128) :: mat_ausgabe, mat_eingabe, pfadA, pfadB

  write(*,*) "Sollen die berechneten Matrizen ausgeben werden? (y/n)"
  read(*,*) mat_ausgabe

  write(*,*) "Wie sollen die Matrizen eingeben werden? (hilbert/datei)"
  read(*,*) mat_eingabe

  if (mat_eingabe == "hilbert") then
    write(*,*) "k für 2^k x 2^k - Matrizen"
    read(*,*) k
    allocate(A(2**k,2**k), B(2**k,2**k))
    do zeile = 1, 2**k
      do spalte = 1, 2**k
        A(zeile, spalte) = 1/(zeile + spalte - 1)
        B(zeile, spalte) = 1/(zeile + spalte - 1)
      end do
    end do
  else
    write(*,*) "Datei-Pfad für Datei mit Matrix A"
    read(*,*) pfadA
    open(unit=100, file=pfadA, action="read")

    write(*,*) "Größe der Matrix"
    read(*,*) n
    allocate(A(n,n), B(n,n))

    do zeile = 1, n
      read(100,*) A(zeile,1:n)
    end do

    write(*,*) "Datei-Pfad für Datei mit Matrix B"
    read(*,*) pfadB
    open(unit=200, file=pfadB, action="read")

    do zeile = 1, n
      read(200,*) B(zeile,1:n)
    end do
  end if

  call cpu_time(start)
  implementiert = matmul(A,B)
  call cpu_time(finish)

  write(*,*) "Implementierte Multiplikation"
  if (mat_ausgabe == "y") then
    do i=1, n
      write(*,*) implementiert(i, 1:n)
    end do
  end if
  write(*,*) "Benoetigte Zeit: ", finish-start

  call cpu_time(start)
  simple = simple_matmul(A,B)
  call cpu_time(finish)

  write(*,*) "Standard Multiplikation"
  if (mat_ausgabe == "y") then
    do i=1, n
      write(*,*) simple(i, 1:n)
    end do
  end if
  write(*,*) "Benoetigte Zeit: ", finish-start

  call cpu_time(start)
  strassen = strassen_matmul(A,B)
  call cpu_time(finish)

  write(*,*) "Strassen Multiplikation"
  if (mat_ausgabe == "y") then
    do i=1, n
      write(*,*) strassen(i, 1:n)
    end do
  end if
  write(*,*) "Benoetigte Zeit: ", finish-start
end program neue_matmul
