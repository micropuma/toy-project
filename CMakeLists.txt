cmake_minimum_required(VERSION 3.22.0)

project(mlir-toy VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON) # 生成 compile_commands.json 便于代码高亮
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED YES)

# 输出一些调试信息
message(STATUS "Starting CMake configuration for mlir-toy")

find_package(MLIR REQUIRED CONFIG)
message(STATUS "MLIR found: ${MLIR_DIR}")
message(STATUS "MLIR CMake directory: ${MLIR_CMAKE_DIR}")

find_package(LLVM REQUIRED CONFIG)
message(STATUS "LLVM found: ${LLVM_DIR}")
message(STATUS "LLVM CMake directory: ${LLVM_CMAKE_DIR}")

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

message(STATUS "CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")

include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)

include_directories(${LLVM_INCLUDE_DIRS} ${MLIR_INCLUDE_DIRS})

# 输出包含目录信息
message(STATUS "LLVM include directories: ${LLVM_INCLUDE_DIRS}")
message(STATUS "MLIR include directories: ${MLIR_INCLUDE_DIRS}")

# dump mlir表示
add_executable(mlir-dump dump.cpp)
set_target_properties(mlir-dump PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# 链接 LLVM 和 MLIR 库
target_link_libraries(
    mlir-dump
    MLIRIR
    MLIRParser
    MLIRFuncDialect
    MLIRArithDialect
)

# 输出目标信息
message(STATUS "Executable target: mlir-toy")
message(STATUS "Source files for mlir-toy: main.cpp")
