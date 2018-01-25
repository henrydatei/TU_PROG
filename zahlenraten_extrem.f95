program zahlenraten_spammer
  implicit none

  real :: IntervallAnfang, IntervallEnde, IntervallMitte, randomNumber
  integer :: Zaehler

  IntervallAnfang = 0
  IntervallEnde = 101
  IntervallMitte = 51

  read(*,*) randomNumber

    do while(randomNumber /= IntervallMitte)
      IntervallMitte = IntervallAnfang + nint((IntervallEnde - IntervallAnfang)/2)
      Zaehler = Zaehler + 1

      if(randomNumber <= IntervallMitte) then
        IntervallEnde = IntervallMitte
      end if

      if(randomNumber >= IntervallMitte) then
        IntervallAnfang = IntervallMitte
      end if
    end do

    write(*,*) Zaehler
end program zahlenraten_spammer
