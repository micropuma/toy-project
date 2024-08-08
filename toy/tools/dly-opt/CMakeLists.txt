# 设置源文件
set(DLYC_SOURCES
    dly.cpp
)

# 设置编译类型为Debug 以启用调试信息
set(CMAKE_BUILD_TYPE Debug)

# 生成可执行文件
add_executable(dlyc ${DLYC_SOURCES})

# 设置可执行文件的输出目录
set_target_properties(dlyc PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# 使用llvm-config获取LLVM编译和链接标志
execute_process(COMMAND llvm-config --cxxflags OUTPUT_VARIABLE LLVM_CXXFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
execute_process(COMMAND llvm-config --ldflags OUTPUT_VARIABLE LLVM_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
execute_process(COMMAND llvm-config --libs all OUTPUT_VARIABLE LLVM_LIBS OUTPUT_STRIP_TRAILING_WHITESPACE)

# 设置编译选项
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LLVM_CXXFLAGS}")

# 链接所需的库
target_link_libraries(dlyc
  PRIVATE ParserLib
  Dly
  DlyCombine
  MLIRAnalysis
  MLIRFunctionInterfaces
  MLIRIR
  MLIRParser
  MLIRSideEffectInterfaces
  MLIRTransforms
)

# 设置链接选项
set_target_properties(dlyc PROPERTIES LINK_FLAGS "${LLVM_LDFLAGS}")

# 包含头文件目录
target_include_directories(dlyc PRIVATE ${CMAKE_SOURCE_DIR}/include)

