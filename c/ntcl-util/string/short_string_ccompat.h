// Copyright 2022 Matthias Heinz
#ifndef C_NTCL_UTIL_STRING_SHORT_STRING_CCOMPAT_H_
#define C_NTCL_UTIL_STRING_SHORT_STRING_CCOMPAT_H_

#ifdef __cplusplus
extern "C" {
#endif

struct ntcl_short_string_ccompat {
    char str[60];
    int length;
};

struct ntcl_short_string_ccompat short_string_from_c_string(const char * c_str);

#ifdef __cplusplus
}
#endif


#endif  // C_NTCL_UTIL_STRING_SHORT_STRING_CCOMPAT_H_
