module print_string_module
    use :: string_module, only : string

    implicit none
    private

    public :: print_string
    public :: print_string_basic

    interface print_string
        module procedure print_string
    end interface print_string

    interface print_string_basic
        module procedure print_string_basic
    end interface print_string_basic

contains

    subroutine print_string(str)
        type(string), intent(in) :: str

        print *, "NTCL string"
        print *, "char_array=", str%as_char_array()
        print *, "length", str%length
    end subroutine print_string

    subroutine print_string_basic(str)
        type(string), intent(in) :: str

        print *, str%as_char_array()
    end subroutine print_string_basic

end module print_string_module