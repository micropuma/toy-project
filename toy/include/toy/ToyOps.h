#pragma once

#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Builders.h"

#include "toy/ToyDialect.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "mlir/Interfaces/ControlFlowInterfaces.h"

#define GET_OP_CLASSES
#include "toy/Toy.h.inc"