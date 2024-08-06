# 默认的tablegen生成MLIRDlyIncGen
add_mlir_dialect(Dly dly)
add_custom_target(header2 DEPENDS MLIRDlyIncGen)