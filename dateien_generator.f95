 !!! generiert 99 vorsortierte dateien !!!

program  dateien_generator

  implicit none

  integer, parameter :: n= 99, min_anz= 100, max_anz= 1000, &
 &                             min_add=  0, max_add= 100
  integer            :: i, j, anz, summe
  character(len=2)   :: str
  real               :: z

  call random_seed()   ! optional

  do i= 1, n

    write(unit=str, fmt="(i2.2)") i
    open (unit=100+i, file="erfass"//trim(adjustl(str))     &
         &//".dat", action="write", status="replace")

    call random_number(z)
    anz= int(z*real(max_anz-min_anz)) + min_anz

    summe= 0
    do j= 1, anz
      call random_number(z)
      summe= summe + int(z*real(max_add-min_add)) + min_add
      write(unit=100+i, fmt=*) summe
    end do

    close(100+i)

  end do

end program  dateien_generator
