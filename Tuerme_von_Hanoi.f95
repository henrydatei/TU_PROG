! Copyright (c) 1994 Unicomp, Inc.
!
! Developed at Unicomp, Inc.
!
! Permission to use, copy, modify, and distribute this
! software is freely granted, provided that this notice
! is preserved.

module hanoi_module
  public :: hanoi

contains

  recursive subroutine hanoi (number_of_disks, starting_post, goal_post)
    integer, intent (in) :: number_of_disks, starting_post, goal_post
    ! all_posts is the sum of the post values 1+2+3
    ! so that the free post can be determined
    ! by subtracting the STARTING_POST and the
    ! goal_post from this sum.
    integer :: free_post
    integer, parameter :: all_posts = 6

    if (number_of_disks > 0) then
      free_post =  all_posts - starting_post - goal_post
      call hanoi (number_of_disks - 1, starting_post, free_post)
      print *, "Move disk", number_of_disks,  "from post", starting_post,  "to post", goal_post
      call hanoi (number_of_disks - 1,  free_post, goal_post)
    end if
  end subroutine hanoi
end module hanoi_module

program test_hanoi
  use hanoi_module
  integer :: number_of_disks = 16

  print *, "Input data  number_of_disks:",  number_of_disks
  print *
  call hanoi (number_of_disks, 1, 3)
end program test_hanoi
