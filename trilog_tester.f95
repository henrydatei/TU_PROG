program trilog_tester
  use trilogie
  implicit none

  type(trilog) :: A,B,C
  integer :: i,j,k

  write(*,*) "=== 1. Distributivgesetz ==="
  do i = 1, -1, -1
    !write(*,*) i
    A%wert = i

    do j = 1, -1, -1
      B%wert = j
      !write(*,*) j

      do k = 1, -1, -1
        C%wert = k
        !write(*,*) k

        write(*,*) "A: ", text(A), "B: ", text(B), "C: ", text(C)
        write(*,*) "links:  ", text(A .AND. (B .OR. C))
        write(*,*) "rechts: ", text((A .AND. B) .OR. (A .AND. C))
      end do
    end do
  end do

  write(*,*) "=== 2. Distributivgesetz ==="
  do i = 1, -1, -1
    !write(*,*) i
    A%wert = i

    do j = 1, -1, -1
      B%wert = j
      !write(*,*) j

      do k = 1, -1, -1
        C%wert = k
        !write(*,*) k

        write(*,*) "A: ", text(A), "B: ", text(B), "C: ", text(C)
        write(*,*) "links:  ", text(A .OR. (B .AND. C))
        write(*,*) "rechts: ", text((A .OR. B) .AND. (A .OR. C))
      end do
    end do
  end do

  write(*,*) "=== 1. De Morgansches Gesetz ==="
  do i = 1, -1, -1
    !write(*,*) i
    A%wert = i

    do j = 1, -1, -1
      B%wert = j
      !write(*,*) j

      do k = 1, -1, -1
        C%wert = k
        !write(*,*) k

        write(*,*) "A: ", text(A), "B: ", text(B), "C: ", text(C)
        write(*,*) "links:  ", text(.NOT. (A .AND. B))
        write(*,*) "rechts: ", text((.NOT. A) .OR. (.NOT. B))
      end do
    end do
  end do

  write(*,*) "=== 2. De Morgansches Gesetz ==="
  do i = 1, -1, -1
    !write(*,*) i
    A%wert = i

    do j = 1, -1, -1
      B%wert = j
      !write(*,*) j

      do k = 1, -1, -1
        C%wert = k
        !write(*,*) k

        write(*,*) "A: ", text(A), "B: ", text(B), "C: ", text(C)
        write(*,*) "links:  ", text(.NOT. (A .OR. B))
        write(*,*) "rechts: ", text((.NOT. A) .AND. (.NOT. B))
      end do
    end do
  end do

end program trilog_tester
