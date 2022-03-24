set(NTCL_TENSOR_SRC_LIB ${NTCL_ROOT_DIR}/ntcl-tensor/lib/libntcl_tensor_full.a)
set(NTCL_TENSOR_BUILD_LIB ${NTCL_BUILD_DIR}/libntcl_tensor_full.a)
set(NTCL_TENSOR_SRC_INC ${NTCL_ROOT_DIR}/ntcl-tensor/include)
set(NTCL_TENSOR_BUILD_INC ${NTCL_BUILD_DIR}/include/ntcl-tensor)

add_custom_target(
    ntcl_tensor_src_tree
    ALL
    poetry run python3 ${NTCL_ROOT_DIR}/ntcl-build/bin/ntcl-build.py -c -x tensor
    DEPENDS
    ntcl_build
    ntcl_util_src_tree
    ntcl_data_src_tree
    WORKING_DIRECTORY
    ${NTCL_ROOT_DIR}
)

add_custom_command(
    OUTPUT
    ${NTCL_TENSOR_SRC_LIB}
    COMMAND
    touch ${NTCL_TENSOR_SRC_LIB}
    DEPENDS
    ntcl_tensor_src_tree
)

file(
    MAKE_DIRECTORY
    ${NTCL_TENSOR_BUILD_INC}
)

add_custom_command(
    OUTPUT
    ${NTCL_TENSOR_BUILD_LIB}
    COMMAND
    cp ${NTCL_TENSOR_SRC_LIB} ${NTCL_TENSOR_BUILD_LIB}
    COMMAND
    cp "${NTCL_TENSOR_SRC_INC}/*" "${NTCL_TENSOR_BUILD_INC}/"
    DEPENDS
    ${NTCL_TENSOR_SRC_LIB}
)

add_custom_target(
    ntcl_tensor_build_tree
    DEPENDS
    ${NTCL_TENSOR_BUILD_LIB}
)

add_library(
    ntcl_tensor
    STATIC IMPORTED GLOBAL
)
add_dependencies(ntcl_tensor ntcl_tensor_build_tree)
set_target_properties(
    ntcl_tensor
    PROPERTIES
    IMPORTED_LOCATION ${NTCL_TENSOR_BUILD_LIB}
    INTERFACE_LINK_LIBRARIES "ntcl_data;ntcl_util"
    INTERFACE_INCLUDE_DIRECTORIES ${NTCL_TENSOR_BUILD_INC}
)
