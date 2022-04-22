module print_dictionary_module
    use :: dictionary_module, only : dictionary
    use :: string_module, only : string
    use :: print_string_module, only : print_string_basic

    implicit none
    private

    public :: print_dictionary

    interface print_dictionary
        module procedure print_dictionary
    end interface print_dictionary

contains

    subroutine print_dictionary(dict)
        type(dictionary), intent(in) :: dict
        integer :: i
        type(string), dimension(:), allocatable :: keys

        keys = dict%get_keys()

        do i=1,size(keys)
            print *, "key = "
            call print_string_basic(keys(i))
            print *, "value = "
            call print_string_basic(dict%get_value(keys(i)))
        end do

    end subroutine print_dictionary

end module print_dictionary_module
