set(NTCL_UTIL_SRC_LIB ${NTCL_ROOT_DIR}/ntcl-util/lib/libntcl_util_full.a)
set(NTCL_UTIL_BUILD_LIB ${NTCL_BUILD_DIR}/libntcl_util_full.a)
set(NTCL_UTIL_SRC_INC ${NTCL_ROOT_DIR}/ntcl-util/include)
set(NTCL_UTIL_BUILD_INC ${NTCL_BUILD_DIR}/include/ntcl-util)

add_custom_target(
    ntcl_util_src_tree
    ALL
    poetry run python3 ${NTCL_ROOT_DIR}/ntcl-build/bin/ntcl-build.py -c -x util
    DEPENDS
    ntcl_build
    WORKING_DIRECTORY
    ${NTCL_ROOT_DIR}
)

add_custom_command(
    OUTPUT
    ${NTCL_UTIL_SRC_LIB}
    COMMAND
    touch ${NTCL_UTIL_SRC_LIB}
    DEPENDS
    ntcl_util_src_tree
)

file(
    MAKE_DIRECTORY
    ${NTCL_UTIL_BUILD_INC}
)

add_custom_command(
    OUTPUT
    ${NTCL_UTIL_BUILD_LIB}
    COMMAND
    cp ${NTCL_UTIL_SRC_LIB} ${NTCL_UTIL_BUILD_LIB}
    COMMAND
    cp "${NTCL_UTIL_SRC_INC}/*" "${NTCL_UTIL_BUILD_INC}/"
    DEPENDS
    ${NTCL_UTIL_SRC_LIB}
)

add_custom_target(
    ntcl_util_build_tree
    DEPENDS
    ${NTCL_UTIL_BUILD_LIB}
)

add_library(
    ntcl_util
    STATIC IMPORTED GLOBAL
)
add_dependencies(ntcl_util ntcl_util_build_tree)
set_target_properties(
    ntcl_util
    PROPERTIES
    IMPORTED_LOCATION ${NTCL_UTIL_BUILD_LIB}
    INTERFACE_INCLUDE_DIRECTORIES ${NTCL_UTIL_BUILD_INC}
)
