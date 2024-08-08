add_mlir_library(Dly Dialect.cpp MLIRGen.cpp DEPENDS MLIRDlyIncGen DlyCombineIncGen)
add_subdirectory(Transforms)