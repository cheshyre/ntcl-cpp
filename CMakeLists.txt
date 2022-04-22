cmake_minimum_required(VERSION 3.10)

project(
    ntcl-cpp
    VERSION
    0.1.0
)

enable_language(Fortran)

set(NTCL_CPP_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(NTCL_CPP_BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR})

add_subdirectory(ntcl)

# Dummy executable; will be removed later
add_executable(Main main.f90)
target_link_libraries(
    Main
    ntcl_util::api
)

add_subdirectory(ntcl-c)
add_subdirectory(tests)
