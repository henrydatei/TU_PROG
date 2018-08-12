module sparmod

implicit none

type content
  integer :: index
  real :: wert
end type content

type node
  type(content) :: vektorinhalt
  type(node), pointer :: nachfolger
end type node

type sparvektor
  type(node), pointer :: top
end type sparvektor

interface operator(*)
  module procedure skalarprodukt
end interface operator(*)

contains

subroutine addKomponente(vektor, index, wert)
  type(sparvektor) :: vektor
  integer :: index
  real :: wert
  type(node), pointer :: tail, neuerEintrag

  allocate(tail, neuerEintrag)

  if ( empty(vektor) ) then
    neuerEintrag%vektorinhalt%index = index
    neuerEintrag%vektorinhalt%wert = wert
    nullify(neuerEintrag%nachfolger)
    vektor%top => neuerEintrag
  else
    tail => vektor%top
    do while(associated(tail%nachfolger))
      tail => tail%nachfolger
    end do
    neuerEintrag%vektorinhalt%index = index
    neuerEintrag%vektorinhalt%wert = wert
    nullify(neuerEintrag%nachfolger)
    tail%nachfolger => neuerEintrag
  end if
end subroutine addKomponente

subroutine lesevektor(vektor)
  type(sparvektor), intent(out) :: vektor
  integer :: i
  real :: wert

  do
    write(*,*) "Index i der Komponente eingeben"
    read(*,*) i
    if (i <= 0) exit
    write(*,*) "Wert für die ", i, "-te Komponente eingeben"
    read(*,*) wert
    call addKomponente(vektor, i, wert)
  end do
end subroutine lesevektor

subroutine GibVektorAus(vektor)
  type(sparvektor) :: vektor
  type(node), pointer :: ptr


  allocate(ptr)

  ptr => vektor%top

  do while (associated(ptr%nachfolger))
    write(*,*) "Index: ", ptr%vektorinhalt%index
    write(*,*) "Wert: ", ptr%vektorinhalt%wert
    ptr => ptr%nachfolger
  end do
  write(*,*) "Index: ", ptr%vektorinhalt%index
  write(*,*) "Wert: ", ptr%vektorinhalt%wert
end subroutine GibVektorAus

subroutine init(vektor)
  type(sparvektor), intent(out) :: vektor
  nullify(vektor%top)
end subroutine init

function empty(vektor)
  type(sparvektor), intent(in) :: vektor
  logical :: empty
  empty = .not. associated(vektor%top)
end function empty

function skalarprodukt(a,b)
  type(sparvektor), intent(in) :: a,b
  real :: skalarprodukt
  real :: summe = 0
  type(node), pointer :: ptr1, ptr2

  ptr1 => a%top
  ptr2 => b%top

  do while (associated(ptr1%nachfolger) .AND. associated(ptr2%nachfolger))
    if ( ptr1%vektorinhalt%index == ptr2%vektorinhalt%index ) then
      summe = summe + ptr1%vektorinhalt%wert * ptr2%vektorinhalt%wert
    end if
    ptr1 => ptr1%nachfolger
    ptr2 => ptr2%nachfolger
  end do
  if ( ptr1%vektorinhalt%index == ptr2%vektorinhalt%index ) then
    summe = summe + ptr1%vektorinhalt%wert * ptr2%vektorinhalt%wert
  end if

  skalarprodukt = summe
end function skalarprodukt

function betrag (vektor) ! produziert iwie Probleme beim 2. Vektor
  type(sparvektor), intent(in) :: vektor
  real :: betrag

  betrag = sqrt(skalarprodukt(vektor, vektor))
end function betrag

function betrag2 (vektor)
  type(sparvektor), intent(in) :: vektor
  real :: betrag2, summe
  type(node), pointer :: ptr

  ptr => vektor%top

  do while (associated(ptr%nachfolger))
    summe = summe + ptr%vektorinhalt%wert ** 2
    ptr => ptr%nachfolger
  end do
  summe = summe + ptr%vektorinhalt%wert ** 2

  betrag2 = sqrt(summe)
end function betrag2

end module sparmod
