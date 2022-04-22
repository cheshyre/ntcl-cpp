module print_dictionary_ccompat_module
    use, intrinsic :: iso_c_binding, only : c_f_pointer

    use :: dictionary_module, only : dictionary
    use :: dictionary_ccompat_module, only : dictionary_ccompat
    use :: print_dictionary_module, only : print_dictionary

    implicit none
    private

    public :: print_dictionary_ccompat

    interface print_dictionary_ccompat
        module procedure print_dictionary_ccompat
    end interface print_dictionary_ccompat

contains

    subroutine print_dictionary_ccompat(dict_handle) bind(c)
        type(dictionary_ccompat), intent(in) :: dict_handle
        type(dictionary), pointer :: dict

        call c_f_pointer(dict_handle%cptr_to_class, dict)

        call print_dictionary(dict)

    end subroutine print_dictionary_ccompat

end module print_dictionary_ccompat_module
