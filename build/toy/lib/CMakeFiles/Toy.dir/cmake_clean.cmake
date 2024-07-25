file(REMOVE_RECURSE
  "libToy.a"
  "libToy.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/Toy.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
