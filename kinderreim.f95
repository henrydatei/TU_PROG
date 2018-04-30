program kinderreim
  implicit none

  type kinddaten
    character(len=10) :: name
    integer :: alter
  end type kinddaten

  type kiste
    type(kinddaten) :: kind
    type(kiste), pointer :: nachfolger
  end type kiste

  type stack
    type(kiste), pointer :: top
  end type stack

  type(kinddaten) :: zeile
  integer :: error, i, j
  type(stack) :: liste
  integer :: anzahlKinder = 1
  type(kiste), pointer :: tail, aktuellesKind, letztesaktuellesKind

  call init(liste)

  open(unit=33, file="KREIM.DAT", action="read")
  do
    read(33, *, iostat=error) zeile
    if(error < 0) exit

    call inject(liste, zeile)
    anzahlKinder = anzahlKinder + 1
  end do

  allocate(tail, aktuellesKind)
  tail => liste%top
  do while(associated(tail%nachfolger))
    tail => tail%nachfolger
  end do
  tail%nachfolger => liste%top

  do j=1, anzahlKinder-2
    write(*,*) "Ausgabe der aktuellen Liste"
    call ausgabeListe(liste)
    write(*,*) "----------------------- Rundenstart -----------------------"
    aktuellesKind => liste%top
    write(*,*) "Zähle 21 Schritte ab"
    do i=1, 20
      aktuellesKind => aktuellesKind%nachfolger
    end do
    call speziellesKindAusgeben(aktuellesKind)
    write(*,*) "Alter des Kindes: ", aktuellesKind%kind%alter
    write(*,*) "weiter abzählen"
    do i=1, aktuellesKind%kind%alter-1
      aktuellesKind => aktuellesKind%nachfolger
    end do
    call speziellesKindAusgeben(aktuellesKind%nachfolger)
    call pop_next(liste,aktuellesKind)
    write(*,*) "----------------------- Rundenende -----------------------"
    liste%top => aktuellesKind%nachfolger
  end do

  write(*,*) "----------------------- Spielende -----------------------"
  write(*,*) "gewonnen hat:"
  call ausgabeListe(liste)

contains

  subroutine init(liste)
    type(stack), intent(out) :: liste
    nullify(liste%top)
  end subroutine init

  function empty(liste)
    type(stack), intent(in) :: liste
    logical :: empty
    empty = .not. associated(liste%top)
  end function empty

  subroutine push(liste, elem)
    type(stack), intent(inout) :: liste
    type(kinddaten), intent(in) :: elem
    type(kiste), pointer :: kasten

    allocate(kasten)
    kasten%kind = elem
    kasten%nachfolger => liste%top
    liste%top => kasten
  end subroutine

  subroutine inject(liste, elem)
    type(stack), intent(inout) :: liste
    type(kinddaten), intent(in) :: elem
    type(kiste), pointer :: kasten, tail

    allocate(kasten, tail)

    if (empty(liste)) then
      kasten%kind = elem
      liste%top => kasten
      nullify(kasten%nachfolger)
    else
      tail => liste%top
      do while(associated(tail%nachfolger))
        tail => tail%nachfolger
      end do
      kasten%kind = elem
      tail%nachfolger => kasten
      nullify(kasten%nachfolger)
    end if
  end subroutine inject

  subroutine pop(liste, elem)
    type(stack), intent(inout)           :: liste
    type(kinddaten), intent(out), optional :: elem
    type(kiste), pointer             :: ptr
    if (.not. empty(liste)) then
      ptr => liste%top
      if (present(elem))  elem = ptr%kind
      liste%top => ptr%nachfolger
      deallocate (ptr)
    else
      write(*,*) ' cannot pop from empty stack!'
    end if
  end subroutine pop

  subroutine pop_next(liste, aktuell)
    type(stack), intent(inout) :: liste
    type(kiste), pointer :: aktuell, hilfe

    allocate(hilfe)

    hilfe%nachfolger => aktuell%nachfolger%nachfolger
    if (associated(aktuell%nachfolger, liste%top)) then
      liste%top => hilfe%nachfolger
    end if
    deallocate(aktuell%nachfolger)
    aktuell%nachfolger => hilfe%nachfolger
  end subroutine pop_next

  subroutine ausgabeListe(liste)
    type(stack), intent(in) :: liste
    type(kiste), pointer :: ptr
    integer :: i
    !ptr => liste%top
    !do i = 2, anzahl-1
    !  write(*,*) "Name: ", ptr%kind%name, ", Alter: ", ptr%kind%alter
    !  ptr => ptr%nachfolger
    !end do
    !write(*,*) "Name: ", ptr%kind%name, ", Alter: ", ptr%kind%alter
    ptr => liste%top
    do
      write(*,*) "Name: ", ptr%kind%name, ", Alter: ", ptr%kind%alter
      ptr => ptr%nachfolger
      if(associated(ptr, liste%top)) exit
    end do
  end subroutine ausgabeListe

  subroutine speziellesKindAusgeben(ptr)
    type(kiste), pointer :: ptr
    write(*,*) "Name: ", ptr%kind%name, ", Alter: ", ptr%kind%alter
  end subroutine speziellesKindAusgeben

  subroutine  copy (s, t, reverse)
    type(stack)       :: s, t, h, i
    logical, optional :: reverse
    type(kinddaten)     :: elem
    logical           :: rev

    rev= .false.
    if (present(reverse))  rev = reverse
    call init(t)
    call init(h)
    if (.not. rev)  call init(i)
    do while (.not. empty(s))
      call pop(s, elem)
      call push(h, elem)    ! create temporary stack to restore s !
      if (rev) then
        call push(t, elem)       ! create copy t in reverse order !
      else
        call push(i, elem)   ! create temporary stack to create t !
      end if
    end do
    do while (.not. empty(h))        ! restore original stack s !
      call pop(h, elem)
      call push(s, elem)
    end do
    if (.not. rev) then
      do while (.not. empty(i))
        call pop(i, elem)
        call push(t, elem)
      end do
    end if
  end subroutine  copy

end program kinderreim
