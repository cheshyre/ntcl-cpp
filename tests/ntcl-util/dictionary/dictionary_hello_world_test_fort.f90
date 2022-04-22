program dictionary_hello_world_test_fort
  use :: dictionary_module, only : dictionary
  use :: print_dictionary_module, only : print_dictionary

  type(dictionary) :: dict

  dict = dictionary()


  call dict%set_value('Title', 'Dictionary hello world')

  print *, ""
  print *, "Printing dictionary!"
  print *, ""
  call print_dictionary(dict)

  call dict%set_value('Kanna', 'Komori Maniwa')
  call dict%set_value('Namakura', 'Ginkaku Uneri')
  call dict%set_value('Tsurugi', 'Meisai Tsuruga')
  call dict%set_value('Hari', 'Hakuhei Sabi')
  call dict%set_value('Yoroi', 'Kanara Azekura')
  call dict%set_value('Kanazuchi', 'Konayuki Itezora')
  call dict%set_value('Bita', 'Nanami Yasuri')
  call dict%set_value('Kanzashi', 'none')
  call dict%set_value('Nokogiri', 'Zanki Kiguchi')
  call dict%set_value('Hakari', 'Rinne Higaki')
  call dict%set_value('Mekki', 'Houo Maniwa')
  call dict%set_value('Ju', 'Emonzaemon Soda')

  call dict%set_value('Title', 'Katanagatari')

  print *, ""
  print *, "Printing dictionary!"
  print *, ""
  call print_dictionary(dict)

end program dictionary_hello_world_test_fort
