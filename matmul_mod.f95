module matmul_mod
  implicit none

contains

  function simple_matmul(A,B)
    real, dimension(:,:) :: A, B
    real, dimension(:,:), allocatable :: simple_matmul
    integer :: size, zeile, spalte, summe, j

    size = ubound(A,1)
    allocate(simple_matmul(1:size, 1:size))

    do zeile = 1, size
      do spalte = 1, size
        summe = 0
        do j = 1, size
          summe = summe + (A(zeile, j) * B(j, spalte)) 
        end do
        simple_matmul(zeile, spalte) = summe
      end do
    end do

  end function simple_matmul

  recursive function strassen_matmul(A,B) result(ergebnis)
    real, dimension(:,:) :: A, B
    real, dimension(:,:), allocatable :: ergebnis
    real, dimension(:,:), allocatable :: M1, M2, M3, M4, M5, M6, M7
    real, dimension(:,:), allocatable :: A11, A12, A21, A22
    real, dimension(:,:), allocatable :: B11, B12, B21, B22
    real, dimension(:,:), allocatable :: C11, C12, C21, C22
    integer :: size

    size = ubound(A, dim=1)
    allocate(ergebnis(1:size, 1:size))

    if (size == 1) then
      ergebnis = A * B
    else
      allocate(M1(size/2,size/2),M2(size/2,size/2),M3(size/2,size/2),M4(size/2,size/2), &
      & M5(size/2,size/2),M6(size/2,size/2),M7(size/2,size/2))
      allocate(A11(size/2,size/2),A12(size/2,size/2),A21(size/2,size/2),A22(size/2,size/2))
      allocate(B11(size/2,size/2),B12(size/2,size/2),B21(size/2,size/2),B22(size/2,size/2))
      allocate(C11(size/2,size/2),C12(size/2,size/2),C21(size/2,size/2),C22(size/2,size/2))

      A11 = A(1:size/2, 1:size/2)
      A12 = A(1:size/2, size/2+1:size)
      A21 = A(size/2+1:size, 1:size/2)
      A22 = A(size/2+1:size, size/2+1:size)
      B11 = B(1:size/2, 1:size/2)
      B12 = B(1:size/2, size/2+1:size)
      B21 = B(size/2+1:size, 1:size/2)
      B22 = B(size/2+1:size, size/2+1:size)

      M1 = strassen_matmul(A12-A22,B21+B22)
      M2 = strassen_matmul(A11+A22,B11+B22)
      M3 = strassen_matmul(A11-A21,B11+B12)
      M4 = strassen_matmul(A11+A12,B22)
      M5 = strassen_matmul(A11,B12-B22)
      M6 = strassen_matmul(A22,B21-B11)
      M7 = strassen_matmul(A21+A22,B11)

      C11 = M1 + M2 - M4 + M6
      C12 = M4 + M5
      C21 = M6 + M7
      C22 = M2 - M3 + M5 - M7

      ergebnis(1:size/2, 1:size/2) = C11
      ergebnis(1:size/2, size/2+1:size) = C12
      ergebnis(size/2+1:size, 1:size/2) = C21
      ergebnis(size/2+1:size, size/2+1:size) = C22

    end if
  end function strassen_matmul


end module matmul_mod
