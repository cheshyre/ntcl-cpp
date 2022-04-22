// Copyright 2022 Matthias Heinz
#ifndef NTCL_C_NTCL_UTIL_DICTIONARY_DICTIONARY_CCOMPAT_H_
#define NTCL_C_NTCL_UTIL_DICTIONARY_DICTIONARY_CCOMPAT_H_

#include "ntcl-c/ntcl-util/string/short_string_ccompat.h"

#ifdef __cplusplus
extern "C" {
#endif

struct dictionary_ccompat {
  void* ptr_to_class;
}

void create_dictionary_ccompat(struct dictionary_ccompat* dict_handle_ptr);

void cleanup_dictionary_ccompat(struct dictionary_ccompat* dict_handle_ptr);

void add_key_value_pair_to_dictionary_ccompat(
    struct dictionary_ccompat* dict_handle_ptr,
    struct short_string_ccompat* key_ptr,
    struct short_string_ccompat* value_ptr);

#ifdef __cplusplus
}
#endif

#endif  // NTCL_C_NTCL_UTIL_DICTIONARY_DICTIONARY_CCOMPAT_H_
