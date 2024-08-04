func.func @main(%arg0: i32) -> i32 {
  %0 = func.call @my_ctlz(%arg0) : (i32) -> i32
  func.return %0 : i32
}
func.func @my_ctlz(%arg0: i32) -> i32 {
  %c32_i32 = arith.constant 32 : i32
  %c0_i32 = arith.constant 0 : i32
  %0 = arith.cmpi eq, %arg0, %c0_i32 : i32
  %1 = scf.if %0 -> (i32) {
    scf.yield %c32_i32 : i32
  } else {
    %c1 = arith.constant 1 : index
    %c1_i32 = arith.constant 1 : i32
    %c32 = arith.constant 32 : index
    %c0_i32_0 = arith.constant 0 : i32
    %2:2 = scf.for %arg1 = %c1 to %c32 step %c1 iter_args(%arg2 = %arg0, %arg3 = %c0_i32_0) -> (i32, i32) {
      %3 = arith.cmpi slt, %arg2, %c0_i32 : i32
      %4:2 = scf.if %3 -> (i32, i32) {
        scf.yield %arg2, %arg3 : i32, i32
      } else {
        %5 = arith.addi %arg3, %c1_i32 : i32
        %6 = arith.shli %arg2, %c1_i32 : i32
        scf.yield %6, %5 : i32, i32
      }
      scf.yield %4#0, %4#1 : i32, i32
    }
    scf.yield %2#1 : i32
  }
  func.return %1 : i32
}