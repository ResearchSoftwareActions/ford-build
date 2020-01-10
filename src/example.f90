module point_module
  !! Point type and associated functions

  type point
    !! A point on a two dimensional plane
    real :: x
    !! 'x' coordinate
    real :: y
    !! 'y' coordinate
  end type

  interface operator (+)
    !! Overload '+' operator for adding points
    module procedure point_add
  end interface

  interface operator (-)
    !! Overloard '0' operator for subtracting points
    module procedure point_negative
    module procedure point_subtract
  end interface

contains

  function point_add(p1, p2) result(p3)
    !! Add two point objects
    type(point), intent(in) :: p1, p2
    type(point) :: p3
    p3%x = p1%x + p2%x
    p3%y = p1%y + p2%y
  end function

  function point_negative(p1) result(p2)
    !! Get the negative value of a point
    type(point), intent(in) :: p1
    type(point) :: p2
    p2%x = -p1%x
    p2%y = -p1%y
  end function

  function point_subtract(p1, p2) result(p3)
    !! Subtract two points
    type(point), intent(in) :: p1, p2
    type(point) :: p3
    p3 = p1 + (-p2)
  end function

end module

program example
  use, intrinsic :: iso_fortran_env, only: ou=>output_unit
  use point_module

  type(point) :: a = point(1,2)
  type(point) :: b = point(2,4)
  type(point) :: c

  c = a + b
  write(ou,'(g0)') c%x, c%y
  c = -c
  write(ou,'(g0)') c%x, c%y
  c = b - a
  write(ou,'(g0)') c%x, c%y
end program
