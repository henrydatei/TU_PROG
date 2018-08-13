module diffmod
  implicit none

  type diff
    private
    real value
    real deriv
  end type diff

  interface operator(+)
    module procedure add
  end interface operator(+)

  interface operator(*)
    module procedure mul
  end interface operator(*)

  interface operator(/)
    module procedure div
  end interface operator(/)

contains

  function add(u,v)
    type(diff), intent(in) :: u,v
    type(diff) :: add

    add%value = u%value + v%value
    add%deriv = u%deriv + v%deriv
  end function add

  function mul(u,v)
    type(diff), intent(in) :: u,v
    type(diff) :: mul

    mul%value = u%value * v%value
    mul%deriv = u%value * v%deriv + u%deriv * v%value
  end function mul

  function div(u,v)
    type(diff), intent(in) :: u,v
    type(diff) :: div

    div%value = u%value / v%value
    div%deriv = (u%deriv - (u%value/v%value) * v%deriv)/v%value
  end function div

  function diffcon(c)
    real, intent(in) :: c
    type(diff) :: diffcon

    diffcon%value = c
    diffcon%deriv = 0
  end function diffcon

  function diffval(x)
    real, intent(in) :: x
    type(diff) :: diffval

    diffval%value = x
    diffval%deriv = 1
  end function diffval

  subroutine put(ausgabe)
    type(diff) :: ausgabe

    write(*,*) "Der Funktionwert ist ", ausgabe%value
    write(*,*) "Die Ableitung ist    ", ausgabe%deriv
  end subroutine put

  function funktion(x)
    real, intent(in) :: x
    type(diff) :: funktion

    funktion = (diffval(x) + diffcon(4.0))/(diffval(x) * diffval(x) + diffcon(5.0))
  end function funktion
end module diffmod
