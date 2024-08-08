# 默认的tablegen生成MLIRDlyIncGen
add_mlir_dialect(Dly dly)
set(LLVM_TARGET_DEFINITIONS DlyCombine.td)
mlir_tablegen(DlyCombine.h.inc -gen-rewriters)
add_public_tablegen_target(DlyCombineIncGen)
add_custom_target(header2 DEPENDS MLIRDlyIncGen DlyCombineIncGen)
