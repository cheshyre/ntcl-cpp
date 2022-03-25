// Copyright 2022 Matthias Heinz
#ifndef TESTS_HELPERS_NTCL_UTIL_PRINT_SHORT_STRING_H_
#define TESTS_HELPERS_NTCL_UTIL_PRINT_SHORT_STRING_H_

#include "c/ntcl-util/string/short_string_ccompat.h"

#ifdef __cplusplus
extern "C" {
#endif

void print_short_string(struct ntcl_short_string_ccompat* str);
void print_short_string_as_string(struct ntcl_short_string_ccompat* str);

#ifdef __cplusplus
}
#endif

#endif  // TESTS_HELPERS_NTCL_UTIL_PRINT_SHORT_STRING_H_
