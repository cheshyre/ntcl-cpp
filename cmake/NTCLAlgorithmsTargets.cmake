set(NTCL_ALGORITHMS_SRC_LIB ${NTCL_ROOT_DIR}/ntcl-algorithms/lib/libntcl_algorithms_full.a)
set(NTCL_ALGORITHMS_BUILD_LIB ${NTCL_BUILD_DIR}/libntcl_algorithms_full.a)
set(NTCL_ALGORITHMS_SRC_INC ${NTCL_ROOT_DIR}/ntcl-algorithms/include)
set(NTCL_ALGORITHMS_BUILD_INC ${NTCL_BUILD_DIR}/include/ntcl-algorithms)

add_custom_target(
    ntcl_algorithms_src_tree
    ALL
    poetry run python3 ${NTCL_ROOT_DIR}/ntcl-build/bin/ntcl-build.py -c -x algorithms
    DEPENDS
    ntcl_build
    ntcl_util_src_tree
    ntcl_data_src_tree
    ntcl_tensor_src_tree
    WORKING_DIRECTORY
    ${NTCL_ROOT_DIR}
)

add_custom_command(
    OUTPUT
    ${NTCL_ALGORITHMS_SRC_LIB}
    COMMAND
    touch ${NTCL_ALGORITHMS_SRC_LIB}
    DEPENDS
    ntcl_algorithms_src_tree
)

file(
    MAKE_DIRECTORY
    ${NTCL_ALGORITHMS_BUILD_INC}
)

add_custom_command(
    OUTPUT
    ${NTCL_ALGORITHMS_BUILD_LIB}
    COMMAND
    cp ${NTCL_ALGORITHMS_SRC_LIB} ${NTCL_ALGORITHMS_BUILD_LIB}
    COMMAND
    cp "${NTCL_ALGORITHMS_SRC_INC}/*" "${NTCL_ALGORITHMS_BUILD_INC}/"
    DEPENDS
    ${NTCL_ALGORITHMS_SRC_LIB}
)

add_custom_target(
    ntcl_algorithms_build_tree
    DEPENDS
    ${NTCL_ALGORITHMS_BUILD_LIB}
)

add_library(
    ntcl_algorithms
    STATIC IMPORTED GLOBAL
)
add_dependencies(ntcl_algorithms ntcl_algorithms_build_tree)
set_target_properties(
    ntcl_algorithms
    PROPERTIES
    IMPORTED_LOCATION ${NTCL_ALGORITHMS_BUILD_LIB}
    INTERFACE_LINK_LIBRARIES "ntcl_data;ntcl_util;ntcl_tensor"
    INTERFACE_INCLUDE_DIRECTORIES ${NTCL_ALGORITHMS_BUILD_INC}
)
