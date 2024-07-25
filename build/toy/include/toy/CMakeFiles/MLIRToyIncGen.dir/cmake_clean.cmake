file(REMOVE_RECURSE
  "CMakeFiles/MLIRToyIncGen"
  "Toy.cpp.inc"
  "Toy.h.inc"
  "ToyDialect.cpp.inc"
  "ToyDialect.h.inc"
  "ToyTypes.cpp.inc"
  "ToyTypes.h.inc"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/MLIRToyIncGen.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
