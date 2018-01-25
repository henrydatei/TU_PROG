module trilogie
  implicit none

  type trilog
      integer :: wert
  end type trilog

  public :: trilog, operator(.AND.), operator(.OR.), operator(.NOT.), operator(==), text, trilog_constructor, true, false, maybe
  type(trilog), parameter :: true = trilog(1), false = trilog(-1), maybe = trilog(0)

  !true = trilog_constructor(1)
  !false = trilog_constructor(-1)
  !maybe = trilog_constructor(0)

  interface operator (.AND.)
    module procedure und
  end interface

  interface operator (.OR.)
    module procedure oder
  end interface

  interface operator (.NOT.)
    module procedure nicht
  end interface

  interface operator (==)
    module procedure gleich
  end interface

contains

  function trilog_constructor(n)
    integer, intent(in) :: n
    type(trilog) :: trilog_constructor
    if(n == 1) trilog_constructor%wert = 1
    if(n == -1) then
      trilog_constructor%wert = -1
    else
      trilog_constructor%wert = 0
    end if
  end function trilog_constructor

  function und (l, r)
    type(trilog), intent(in) :: l,r
    type(trilog) :: und

    if (l%wert == 1) then
      if(r%wert == 1) und%wert = 1
      if(r%wert == 0) und%wert = 0
      if(r%wert == -1) und%wert = -1
    end if

    if (l%wert == 0) und%wert = 0

    if (l%wert == -1) then
      if(r%wert == 1) und%wert = -1
      if(r%wert == 0) und%wert = 0
      if(r%wert == -1) und%wert = -1
    end if
  end function und

  function oder (l, r)
    type(trilog), intent(in) :: l,r
    type(trilog) :: oder

    if (l%wert == 1) then
      if(r%wert == 1) oder%wert = 1
      if(r%wert == 0) oder%wert = 0
      if(r%wert == -1) oder%wert = 1
    end if

    if (l%wert == 0) then
      if(r%wert == 1) oder%wert = 0
      if(r%wert == 0) oder%wert = 0
      if(r%wert == -1) oder%wert = 0
    end if

    if (l%wert == -1) then
      if(r%wert == 1) oder%wert = 1
      if(r%wert == 0) oder%wert = 0
      if(r%wert == -1) oder%wert = -1
    end if
  end function oder

  function nicht (l)
    type(trilog), intent(in) :: l
    type(trilog) :: nicht

    if (l%wert == 1) nicht%wert = -1

    if (l%wert == 0) nicht%wert = 0

    if (l%wert == -1) nicht%wert = 1
  end function nicht

  function gleich (l, r)
    type(trilog), intent(in) :: l,r
    type(trilog) :: gleich

    if (l%wert == 1) then
      if(r%wert == 1) gleich%wert = 1
      if(r%wert == 0) gleich%wert = 0
      if(r%wert == -1) gleich%wert = -1
    end if

    if (l%wert == 0) then
      if(r%wert == 1) gleich%wert = 0
      if(r%wert == 0) gleich%wert = 0
      if(r%wert == -1) gleich%wert = 0
    end if

    if (l%wert == -1) then
      if(r%wert == 1) gleich%wert = -1
      if(r%wert == 0) gleich%wert = 0
      if(r%wert == -1) gleich%wert = 1
    end if
  end function gleich

  function text(l)
    type(trilog), intent(in) :: l
    character(len = 1) :: text

    if(l%wert == 1) text = "T"
    if(l%wert == 0) text = "?"
    if(l%wert == -1) text = "F"

    !write(*,*) text
  end function text

end module trilogie
