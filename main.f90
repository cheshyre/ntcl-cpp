program hello
  use :: string_module, only : string

  type(string) :: val
  character(:), allocatable :: c_arr
  ! This is a comment line; it is ignored by the compiler
  print *, 'Hello, World!'
  val = string('Hello, World!')
  c_arr = val%as_char_array()
  print *, c_arr
end program hello
