add_custom_target(
    ntcl_build
    ALL
    poetry run python3 ${NTCL_ROOT_DIR}/ntcl-build/bin/ntcl-build.py -c -x build
    WORKING_DIRECTORY
    ${NTCL_ROOT_DIR}
)
