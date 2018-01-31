module boothroyd_matrix
  implicit none

  public operator (.ueber.), generate_matrix

  interface operator (.ueber.)
    module procedure binocoeff
  end interface

contains

  function binocoeff(n,k)
    integer, intent(in) :: n,k
    integer :: i, c, binocoeff

    c = 1

    do i = 1, min(k,n-k), 1
      c = c * (n-i+1)/i
    end do

    binocoeff = c
  end function binocoeff

  function generate_matrix(n, inv)
    integer, intent(in) :: n
    logical, optional :: inv
    integer, dimension(:,:), allocatable :: boothroyd, generate_matrix
    integer :: i,j

    allocate(boothroyd(n,n))

    if (present(inv) .AND. inv .eqv. .TRUE.) then
      !Inverse
      do i=1, n, 1
        do j=1, n, 1
          boothroyd(i,j) = ((n+i-1) .ueber. (i-1)) * ((n-1) .ueber. (n-j)) * n / (i+j-1) * (-1)**(i+j)
        end do
      end do
    else
      !normale Matrix
      do i=1, n, 1
        do j=1, n, 1
          boothroyd(i,j) = ((n+i-1) .ueber. (i-1)) * ((n-1) .ueber. (n-j)) * n / (i+j-1)
        end do
      end do
    end if

    generate_matrix = boothroyd

  end function generate_matrix
end module boothroyd_matrix
