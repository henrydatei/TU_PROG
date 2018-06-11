module merge
  implicit none

  type filecomp
    integer :: unitnummer
    integer :: last_number_from_file
  end type filecomp

  interface operator(<=)
    module procedure less_equal
  end interface

contains

  function less_equal(l,r)
    type(filecomp), intent(in) :: l,r
    logical :: less_equal

    if(l%last_number_from_file <= r%last_number_from_file) then
      less_equal = .TRUE.
    else
      less_equal = .FALSE.
    end if
  end function less_equal

  subroutine sort(liste) !bubblesort
    type(filecomp), dimension(:), intent(inout) :: liste
    integer :: Anzahl_Listen_Elemente, i, n
    type(filecomp) :: temp1, temp2

    Anzahl_Listen_Elemente = ubound(liste, dim=1)

    do n = Anzahl_Listen_Elemente, 1, -1
      do i = 0, n-1, 1
        if(liste(i+1) <= liste(i)) then
          temp1 = liste(i)
          temp2 = liste(i+1)

          liste(i) = temp2
          liste(i+1) = temp1
        end if
      end do
    end do
  end subroutine sort

  subroutine insert(liste, bitte_einfuegen)
    type(filecomp), dimension(:), intent(inout) :: liste
    type(filecomp) :: bitte_einfuegen
    integer :: unten, oben, j, mitte, antiSpam, mitteBackup

    unten = 1
    oben = size(liste, dim=1)

    do antiSpam = 1, 30
      if (bitte_einfuegen%last_number_from_file > liste(oben)%last_number_from_file) then
        mitte = oben
        exit
      end if
      mitteBackup = mitte
      mitte = aint((oben+unten)/2 + 0.5)
      if (mitte == mitteBackup) then
        exit
      end if
      if (bitte_einfuegen <= liste(mitte)) then
        oben = mitte
      else
        unten = mitte
      end if
      if (oben == unten) then
        exit
      end if
    end do

    do j = 2, mitte
      liste(j-1) = liste(j)
    end do

    liste(mitte) = bitte_einfuegen

  end subroutine insert

  subroutine phase1(n)
    integer :: n, i
    character :: string
    character(len=2) :: zahl_als_string
    character(len=12) :: file_name
    do i = 1, n, 1
      write(zahl_als_string,'(I2.2)') i
      file_name = "erfass"//zahl_als_string//".dat"
      open(unit=29+i, file=file_name, action="read")
      write(*,*) file_name, " Unit: ", 29+i
    end do
    open(unit=500, file="ziel.dat", action="write")
  end subroutine phase1

  subroutine phase2(arbeitsfeld, n)
    type(filecomp), dimension(:) :: arbeitsfeld
    integer :: n, i

    do i = 1, n
      arbeitsfeld(i)%unitnummer = i + 29
      read(i + 29,*) arbeitsfeld(i)%last_number_from_file
      write(*,*) "Unit: ", arbeitsfeld(i)%unitnummer, " Zahl: ", arbeitsfeld(i)%last_number_from_file
    end do

    call sort(arbeitsfeld)
  end subroutine phase2

  subroutine phase3 (arbeitsfeld, n)
    type(filecomp), dimension(1:n) :: arbeitsfeld
    integer :: n, unterer_index, ios
    type(filecomp) :: neues_Element

    unterer_index = 1
    do
      write(500,*) arbeitsfeld(unterer_index)%last_number_from_file
      write(*,*) "Packe Zahl im Index ", unterer_index, " in Ziel: ", arbeitsfeld(unterer_index)%last_number_from_file
      neues_Element%unitnummer = arbeitsfeld(unterer_index)%unitnummer
      read(unit=neues_Element%unitnummer,fmt=*,iostat=ios) neues_Element%last_number_from_file
      if ( ios /= 0 ) then
        unterer_index = unterer_index + 1
      else
        call insert(arbeitsfeld(unterer_index:n), neues_Element)
      end if
      if (unterer_index == n+1) exit
    end do

  end subroutine phase3
end module merge
