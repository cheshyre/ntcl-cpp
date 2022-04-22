module print_short_string_module
    use :: short_string_ccompat_module, only : short_string_ccompat, to_string
    use :: print_string_module, only : print_string

    implicit none
    private

    public :: print_short_string
    public :: print_short_string_as_string

    interface print_short_string
        module procedure print_short_string
    end interface print_short_string

    interface print_short_string_as_string
        module procedure print_short_string_as_string
    end interface print_short_string_as_string

contains

    subroutine print_short_string(str) bind(c)
        type(short_string_ccompat), intent(in) :: str
        integer :: k

        print *, "short_string"
        print *, "str=", (str%str(k), k=1,str%length)
        print *, "unused bytes="
        do k=str%length+1,ubound(str%str,1)
            write(*, '(Z2.2)', advance='no') str%str(k)
        end do
        print *, ""
        print *, "length", str%length
    end subroutine print_short_string

    subroutine print_short_string_as_string(str) bind(c)
        type(short_string_ccompat), intent(in) :: str

        call print_string(to_string(str))
    end subroutine print_short_string_as_string

end module print_short_string_module
