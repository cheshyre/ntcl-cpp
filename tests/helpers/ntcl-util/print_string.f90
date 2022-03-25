module print_string_module
    use :: string_module, only : string

    implicit none
    private

    public :: print_string

    interface print_string
        module procedure print_string
    end interface print_string

contains

    subroutine print_string(str)
        type(string), intent(in) :: str

        print *, "NTCL string"
        print *, "char_array=", str%as_char_array()
        print *, "length", str%length
    end subroutine print_string

end module print_string_module