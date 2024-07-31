#include "mlir/IR/DialectRegistry.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Transforms/Passes.h"
#include "toy/ToyDialect.h"
using namespace mlir;
using namespace llvm;

int main(int argc, char ** argv) {
  DialectRegistry registry;
  // 注册 Dialect
  // 注册了ToyDialect，是tutorial自行编写的dialect！
  registry.insert<toy::ToyDialect, func::FuncDialect>();

  // 注册两个 Pass
  registerCSEPass();
  registerCanonicalizerPass();

  return asMainReturnCode(MlirOptMain(argc, argv, "toy-opt", registry));
}