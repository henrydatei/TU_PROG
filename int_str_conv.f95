program integer_string_convert
  implicit none

  integer :: zahl
  character :: string

  !Integer -> String
  zahl = 5
  write(string,'(I1.1)') zahl
  write(*,*) "Hallo, die Zahl war "//trim(string)

  !String -> Integer
  string = "5"
  read(string,*) zahl
  write(*,*) "Die Zahl plus 1 ist", zahl+1
end program integer_string_convert
