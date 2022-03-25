#include <stdio.h>

#include "c/ntcl-util/string/short_string_ccompat.h"
#include "tests/helpers/ntcl-util/print_short_string.h"

int main(void) {
  printf("Should be\n");
  printf("%s\n", "Hello, world!");
  char * c_str = "Hello, world!";
  struct ntcl_short_string_ccompat ntcl_str = short_string_from_c_string(c_str);
  print_short_string(&ntcl_str);
  print_short_string_as_string(&ntcl_str);
}