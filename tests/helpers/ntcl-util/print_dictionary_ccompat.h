// Copyright 2022 Matthias Heinz
#ifndef TESTS_HELPERS_NTCL_UTIL_PRINT_DICTIONARY_CCOMPAT_H_
#define TESTS_HELPERS_NTCL_UTIL_PRINT_DICTIONARY_CCOMPAT_H_

#include "ntcl-c/ntcl-util/dictionary/dictionary_ccompat.h"

#ifdef __cplusplus
extern "C" {
#endif

void print_dictionary_ccompat(struct dictionary_ccompat* str);

#ifdef __cplusplus
}
#endif

#endif  // TESTS_HELPERS_NTCL_UTIL_PRINT_DICTIONARY_CCOMPAT_H_
