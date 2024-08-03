#ifndef TOY_OPS_TD
#define TOY_OPS_TD

include "mlir/IR/OpBase.td"
include "toy/ToyDialect.td"
include "mlir/Interfaces/SideEffectInterfaces.td"
include "mlir/Interfaces/ControlFlowInterfaces.td"
include "mlir/Interfaces/InferTypeOpInterface.td"
include "mlir/Interfaces/FunctionInterfaces.td"
include "mlir/IR/RegionKindInterface.td"

// mnemonic 指名字
class ToyOp<string mnemonic, list<Trait> traits = []> :
  Op<ToyDialect, mnemonic, traits>;

// Pure 是 Trait，表示没有 SideEffect 的纯函数
def AddOp : ToyOp<"add", [Pure, SameOperandsAndResultType]> {
  let summary = "add operation";
  let arguments = (ins Variadic<AnyInteger>:$inputs);
  let results = (outs AnyInteger:$result);
  let assemblyFormat = "$inputs attr-dict `:` type($result)";
}

def SubOp : ToyOp<"sub", [Pure, SameOperandsAndResultType]> {
  let summary = "sub operation";
  let arguments = (ins AnyInteger:$lhs, AnyInteger:$rhs);
  let results = (outs AnyInteger:$result);

  // 用于发现IR的错误的table gen选项。
  let hasVerifier = true;
  // 教程使用自建的build方法，但是后面使用SameOperandsAndResultType 
  // 该trait会自动构建，导致冲突。

  let assemblyFormat = "$lhs `,` $rhs attr-dict `:` type($result)";
}

def ConstantOp : ToyOp<"const", [Pure, InferTypeOpAdaptor]> {
  let summary = "const operation";
  let arguments = (ins APIntAttr:$value);
  let results = (outs AnyInteger:$result);
  
  let extraClassDeclaration = [{
    int64_t getWidth() {
      return getResult().getType().getWidth();
    }
  }];

  let assemblyFormat = "$value attr-dict";
}

def ReturnOp : ToyOp<"ret", [Terminator, ReturnLike]> {
  let summary = "return operation";
  let arguments = (ins Optional<AnyInteger>:$data);
  let assemblyFormat = "$data attr-dict `:` type($data)";
}

def FuncOp : ToyOp<"func", [
  // This trait asserts that the regions of an operation will not capture, or reference, 
  // SSA values defined above the region scope.
  IsolatedFromAbove,
  FunctionOpInterface, 
  RegionKindInterface]> {
  let summary = "function";
  let arguments = (ins
    SymbolNameAttr:$sym_name,
    TypeAttrOf<FunctionType>:$function_type,
    // FunctionOpInterface 需要两个 Attr 来记录 arg 和 res 的名字
    OptionalAttr<DictArrayAttr>:$arg_attrs,
    OptionalAttr<DictArrayAttr>:$res_attrs
  );
  dag regions = (region AnyRegion:$body);
  let hasCustomAssemblyFormat = true;
  let extraClassDeclaration = [{
    // Method of FunctionOpInterface
    mlir::Region * getCallableRegion() {return &getBody();}
    // getFunctionType 函数会自动生成
    // mlir::FunctionType getFunctionType(); 

    // Method of CallableOpInterface
    llvm::ArrayRef<mlir::Type> getArgumentTypes() {return getFunctionType().getInputs();}
    llvm::ArrayRef<mlir::Type> getResultTypes() {return getFunctionType().getResults();}

    // Method of RegionKindInterface
    static mlir::RegionKind getRegionKind(unsigned idx) { return mlir::RegionKind::SSACFG; }
  }];
}

def CallOp : ToyOp<"call", [CallOpInterface]> {
  let summary = "call operation";
  let arguments = (ins SymbolRefAttr:$callee, Variadic<AnyType>:$arg_operands);
  let results = (outs AnyType:$result);
  let assemblyFormat = "$callee `(` $arg_operands `)` attr-dict `:` functional-type($arg_operands, results)";
  let extraClassDeclaration = [{
    mlir::CallInterfaceCallable getCallableForCallee() { return getCalleeAttr(); }
    void setCalleeFromCallable(mlir::CallInterfaceCallable callee) { setCalleeAttr(callee.get<mlir::SymbolRefAttr>()); }
  }];
}

#endif // TOY_OPS_TD
