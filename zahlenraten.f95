program zahlenraten
  implicit none

  real :: IntervallAnfang, IntervallEnde, IntervallMitte, IntervallMitteOld
  integer :: Zaehler
  character(len=1) :: Eingabe, weiteresSpiel

  aussen:do

    Zaehler = 0
    Eingabe = ""

    write(*,*) "Bitte das offene Intervall angeben"
    read(*,*) IntervallAnfang, IntervallEnde

    do while(IntervallEnde < IntervallAnfang)
      write(*,*) "Bitte neues Intervallende eingeben"
      read(*,*) IntervallEnde
    end do

    do while(Eingabe /= "=")
      IntervallMitte = IntervallAnfang + nint((IntervallEnde - IntervallAnfang)/2)
      if(IntervallMitte == IntervallMitteOld .OR. IntervallMitte == IntervallEnde .OR. IntervallMitte == IntervallAnfang) then
        write(*,*) "Deine Eingaben widersprechen sich!"
        exit aussen
      end if

      Zaehler = Zaehler + 1

      write(*,*) "Ist deine Zahl kleiner, groesser oder gleich ", IntervallMitte
      read (*,*) Eingabe

      IntervallMitteOld = IntervallMitte

      if(Eingabe == "<") then
        IntervallEnde = IntervallMitte
      end if

      if(Eingabe == ">") then
        IntervallAnfang = IntervallMitte
      end if

      if(Eingabe == "=") then
        write(*,*) "Deine Zahl war die ", IntervallMitte
        write(*,*) "Ich habe ", Zaehler, "Versuche gebraucht"
      end if
    end do

    write(*,*) "Willst du noch einmal spielen? (y oder n)"
    read(*,*) weiteresSpiel
    if(weiteresSpiel == "n") exit
  end do aussen

end program zahlenraten
