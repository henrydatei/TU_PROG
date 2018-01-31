program boothroyd
  use boothroyd_matrix

  integer :: n, i
  integer, dimension(:,:), allocatable :: booth, dekk, mul

  do
    write(*,*) "n eingeben"
    read(*,*) n
    if (n>0) exit
  end do

  allocate(booth(n,n), dekk(n,n), mul(n,n))

  booth = generate_matrix(n)
  dekk = generate_matrix(n, .TRUE.)
  mul = matmul(booth, dekk)

  write(*,*) "Boothroyd-Matrix"
  do i=1, n
    write(*,*) booth(i, 1:n)
  end do
  write(*,*) "Boothroyd-Matrix * Inverse"
  do i=1, n
    write(*,*) mul(i, 1:n)
  end do

end program boothroyd
