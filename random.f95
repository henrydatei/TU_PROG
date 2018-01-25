program zufall
  implicit none

  real :: r
  do
    call random_number(r)
    write(*,*) r
    write(*,*) aint(r*100) + 1
  end do
end program zufall
