module marathon
  implicit none

  type zeit
    integer :: stunden,minuten
    real :: sekunden
  end type

  type ergebnis
    type(zeit) :: gesamteZeit
    character(len=30) :: name
  end type

  public zeit,ergebnis,operator( < ), leseliste2

  interface operator( < )
    module procedure zeitenVergleich
  end interface

contains

  function zeitenVergleich(l,r)
    type(zeit), intent(in) :: l,r
    logical :: zeitenVergleich
    zeitenVergleich = .FALSE.

    if(l%stunden < r%stunden) then
      zeitenvergleich = .TRUE.
    else
      if(l%stunden == r%stunden .AND. l%minuten < r%minuten) then
        zeitenVergleich = .TRUE.
      else
        if(l%stunden == r%stunden .AND. l%minuten == r%minuten .AND. l%sekunden < r%sekunden) zeitenVergleich = .TRUE.
      end if
    end if
  end function zeitenVergleich

  subroutine leseliste2(liste, zaehler)
    type(ergebnis), dimension(:), intent(inout) :: liste
    type(ergebnis) :: zeile
    integer :: err, ios
    integer, intent(out) :: zaehler

    zaehler = 1

    open(unit=33, file="marathon.dat", iostat=ios, action="read")
    do
      read(33, *, iostat=err) zeile
      if (err < 0 .OR. zaehler  > ubound(liste, dim=1)) exit

      liste(zaehler) = zeile
      zaehler = zaehler+1
    end do
  end subroutine leseliste2
end module marathon
