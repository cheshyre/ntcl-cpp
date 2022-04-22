// Copyright 2022 Matthias Heinz
#include "ntcl-c/ntcl-util/string/short_string_ccompat.h"

#include <string.h>

struct ntcl_short_string_ccompat short_string_from_c_string(const char * c_str) {
    struct ntcl_short_string_ccompat short_str;

    short_str.length = strlen(c_str);
    strcpy(short_str.str, c_str);
    // for (int i = 0; i < short_str.length; i += 1) {
    //     short_str[i] = c_str[i];
    // }

    return short_str;
}
