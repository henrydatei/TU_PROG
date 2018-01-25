module fibonacci
  implicit none
  save

  integer(kind(0d0)) :: zahl, n

  contains

  integer(kind(0d0)) function fibinterativ(zahl)
    implicit none
    integer(kind(0d0)) :: zahl, start1, start2, i, fibit

    start1 = 1
    start2 = 1
    fibit = 1

    do i = 0, zahl - 3
      fibit = start1 + start2
      start1 = start2
      start2 = fibit
    end do

    fibinterativ = fibit

    return !gibt ab zahl = 47 Probleme
  end function fibinterativ

  recursive function fibrekursiv(n) result(ret)
    implicit none
    integer(kind(0d0)) :: n, ret

    if (n == 1) ret = 1
    if (n == 2) ret = 1
    if(n > 2) ret = fibrekursiv(n-1) + fibrekursiv(n-2)

    return
  end function fibrekursiv

end module fibonacci

program fibReIt
  use fibonacci
  implicit none
  integer(kind(0d0)) :: eingabe

  do
    write(*,*) "nte Fibonacci Zahl eingeben"
    read(*,*) eingabe
    if (eingabe > 0) exit
  end do

  write(*,*) "Iterativ: ", fibinterativ(eingabe)
  write(*,*) "Rekursiv: ", fibrekursiv(eingabe)

end program fibReIt
