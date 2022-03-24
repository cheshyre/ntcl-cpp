set(NTCL_DATA_SRC_LIB ${NTCL_ROOT_DIR}/ntcl-data/lib/libntcl_data_full.a)
set(NTCL_DATA_BUILD_LIB ${NTCL_BUILD_DIR}/libntcl_data_full.a)

add_custom_target(
    ntcl_data_src_tree
    ALL
    poetry run python3 ${NTCL_ROOT_DIR}/ntcl-build/bin/ntcl-build.py -c -x data
    DEPENDS
    ntcl_build
    ntcl_util_src_tree
    WORKING_DIRECTORY
    ${NTCL_ROOT_DIR}
)

add_custom_command(
    OUTPUT
    ${NTCL_DATA_SRC_LIB}
    COMMAND
    touch ${NTCL_DATA_SRC_LIB}
    DEPENDS
    ntcl_data_src_tree
)

add_custom_command(
    OUTPUT
    ${NTCL_DATA_BUILD_LIB}
    COMMAND
    cp ${NTCL_DATA_SRC_LIB} ${NTCL_DATA_BUILD_LIB}
    DEPENDS
    ${NTCL_DATA_SRC_LIB}
)

add_custom_target(
    ntcl_data_build_tree
    DEPENDS
    ${NTCL_DATA_BUILD_LIB}
)

add_library(
    ntcl_data
    STATIC IMPORTED GLOBAL
)
add_dependencies(ntcl_data ntcl_data_build_tree)
set_target_properties(
    ntcl_data
    PROPERTIES
    IMPORTED_LOCATION ${NTCL_DATA_BUILD_LIB}
    INTERFACE_LINK_LIBRARIES ntcl_data
)
