program hello_world_test_fort
  use :: string_module, only : string
  use :: print_string_module, only : print_string

  type(string) :: val

  print *, 'Should be: Hello, World!'
  val = string('Hello, World!')

  call print_string(val)

end program hello_world_test_fort