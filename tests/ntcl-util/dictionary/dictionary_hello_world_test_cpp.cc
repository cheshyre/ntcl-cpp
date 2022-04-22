#include "ntcl-c/ntcl-util/dictionary/dictionary_ccompat.h"
#include "ntcl-c/ntcl-util/string/short_string_ccompat.h"
#include "tests/helpers/ntcl-util/print_dictionary_ccompat.h"

#include <stdio.h>

int main(void) {
  struct dictionary_ccompat dict;

  create_dictionary_ccompat(&dict);

  struct ntcl_short_string_ccompat key;
  struct ntcl_short_string_ccompat value;

  key = short_string_from_c_string("Title");
  value = short_string_from_c_string("Dictionary hello world");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);

  printf("\nPrinting dictionary\n\n");
  print_dictionary_ccompat(&dict);

  key = short_string_from_c_string("Kanna");
  value = short_string_from_c_string("Komori Maniwa");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Namakura");
  value = short_string_from_c_string("Ginkaku Uneri");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Tsurugi");
  value = short_string_from_c_string("Meisai Tsuruga");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Hari");
  value = short_string_from_c_string("Hakuhei Sabi");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Yoroi");
  value = short_string_from_c_string("Kanara Azekura");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Kanazuchi");
  value = short_string_from_c_string("Konayuki Itezora");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Bita");
  value = short_string_from_c_string("Nanami Yasuri");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Kanzashi");
  value = short_string_from_c_string("none");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Nokogiri");
  value = short_string_from_c_string("Zanki Kiguchi");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Hakari");
  value = short_string_from_c_string("Rinne Higaki");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Mekki");
  value = short_string_from_c_string("Houo Maniwa");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);
  key = short_string_from_c_string("Ju");
  value = short_string_from_c_string("Emonzaemon Soda");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);

  key = short_string_from_c_string("Title");
  value = short_string_from_c_string("Katanagatari");
  add_key_value_pair_to_dictionary_ccompat(&dict, &key, &value);

  printf("\nPrinting dictionary\n\n");
  print_dictionary_ccompat(&dict);

  cleanup_dictionary_ccompat(&dict);

  return 0;
}
