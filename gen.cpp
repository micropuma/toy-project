#include "mlir/IR/AsmState.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/Parser/Parser.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "llvm/Support/raw_ostream.h"

using namespace mlir;

int main(int argc, char **argv) {
    MLIRContext ctx;
    ctx.loadDialect<func::FuncDialect, arith::ArithDialect>();
    
    // 创建OpBuilder
    OpBuilder builder(&ctx);
    auto mod = builder.create<ModuleOp>(builder.getUnknownLoc());

    // 设置插入点
    llvm::errs() << "=====================\n";
    mod.getBody()->dump();
    llvm::errs() << "=====================\n";

    builder.setInsertionPointToEnd(mod.getBody());

    // 创建函数
    auto i32 = builder.getI32Type();
    auto funcType = builder.getFunctionType({i32, i32}, i32);
    auto func = builder.create<func::FuncOp>(builder.getUnknownLoc(), "test", funcType);

    // 添加基本块
    auto entry = func.addEntryBlock();
    auto args = entry->getArguments();

    // 设置插入点
    builder.setInsertionPointToEnd(entry);

    // 检查参数
    if (args.size() != 2) {
        llvm::errs() << "Error: Function does not have two input args\n";
        return 1;
    }

    // 创建arith.addi
    auto addi = builder.create<arith::AddIOp>(builder.getUnknownLoc(), args[0], args[1]);
    // 创建 func.return
    builder.create<func::ReturnOp>(builder.getUnknownLoc(), ValueRange({addi}));
    mod->print(llvm::outs());

    return 0;
}