#include <iostream>

#include "c/ntcl-util/string/short_string_ccompat.h"
#include "tests/helpers/ntcl-util/print_short_string.h"

int main(void) {
  std::cout << "Should be\n";
  std::cout << "Hello, world!\n";
  auto ntcl_str = short_string_from_c_string("Hello, world!");
  print_short_string(&ntcl_str);
  print_short_string_as_string(&ntcl_str);
}