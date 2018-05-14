module queuemod

  implicit none
  public :: put, einkaufswagen, schlange, init, empty, anstellen, schlange_verkuerzen

  type einkaufswagen
    integer :: menge
    type(einkaufswagen), pointer :: nachfolger
  end type einkaufswagen

  type schlange
    integer :: laenge
    type(einkaufswagen), pointer :: head, tail
  end type schlange

  interface put
    module procedure schlange_ausgeben
  end interface

contains

  subroutine init(s)
    type(schlange) :: s

    nullify(s%head)
    nullify(s%tail)
  end subroutine

  function empty(s)
    type(schlange) :: s
    logical :: empty

    if(s%laenge == 0) then
      empty = .TRUE.
    else
      empty = .FALSE.
    end if
  end function empty

  subroutine anstellen(s, inhalt)
    type(schlange) :: s
    integer :: inhalt

    if(empty(s)) then
      allocate(s%head)
      s%head%menge = inhalt
      s%tail => s%head
    else
      allocate(s%tail%nachfolger)
      s%tail%nachfolger%menge = inhalt
      s%tail => s%tail%nachfolger
    end if

    !write(*,*) "+Wagen Menge mit Tail ", s%tail%menge
    s%laenge = s%laenge + 1

  end subroutine anstellen

  subroutine schlange_verkuerzen(s)
    type(schlange) :: s
    type(einkaufswagen), pointer :: hilfe

    if(empty(s)) then
      write(*,*) "Schlange bereits leer"
    else
      if(associated(s%head,s%tail)) then   !nur noch 1 Kunde in Schlange
        deallocate(s%head)
        nullify(s%head)
        nullify(s%tail)
      else
        hilfe => s%head%nachfolger
        deallocate(s%head)
        s%head => hilfe
      end if
      s%laenge = s%laenge - 1
    end if
  end subroutine schlange_verkuerzen

  subroutine schlange_ausgeben(s)
    type(schlange) :: s
    integer :: i
    type(einkaufswagen), pointer :: ptr

    ptr => s%head

    if(empty(s)) then
      write(*,*) "Schlange leer"
    else
      do i=1, s%laenge-1
        write(*, "(A, 1I3)", advance="no") ' ', ptr%menge
        !write(*,*) ptr%menge
        ptr => ptr%nachfolger
      end do
      write(*, "(A, 1I3)", advance="yes") ' ', ptr%menge
    end if
  end subroutine schlange_ausgeben

end module queuemod
