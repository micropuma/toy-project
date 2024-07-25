# MLIR toy compiler
## Set up  
运用模版构建standalone mlir项目。
```shell
mlir-tutorial
├── install       # MLIR 编译后安装到这里
├── llvm-project  # MLIR 项目
└── mlir-toy      # 自己的 MLIR 工程
```
如下方式构建mlir项目:  
> git clone git@github.com:llvm/llvm-project.git  

> cd llvm-project  
mkdir build  
cd build  

用下述build选项build项目：
```shell
cmake -DBUILD_SHARED_LIBS=On \
      -DCMAKE_BUILD_TYPE=Release\
      -DLLVM_ENABLE_LLD=On \
      -DLLVM_LINK_LLVM_DYLIB=Off \
      -DLLVM_OPTIMIZED_TABLEGEN=On \
      -DLLVM_ENABLE_PROJECTS="mlir" \
	  -DLLVM_BUILD_EXAMPLES=ON \
	  -DLLVM_TARGETS_TO_BUILD="Native;NVPTX;AMDGPU" \
	  -DCMAKE_INSTALL_PREFIX=/home/leon/tutorial/mlir-tutorial/install \
      -G Ninja \
      ../llvm
```
* project支持mlir和clang。
* 后端支持标准的X86等成熟后端以及amdgpu。
* 启动example选项，支持toy等例子的编译（llvm in tree教学项目）。  

查看install目录下的llvm构建内容：
``` shell
install
├── bin
├── examples
├── include
├── lib
└── share
```
> echo 'export PATH=/home/leon/tutorial/mlir-tutorial/install/bin:$PATH' >> ~/.bashrc  
source ~/.bashrc 

持久化更改，方便调用install下的bin里面的mlir-opt等程序。  

## mlir tutorial
### mlir dump
```shell
bash build.sh  
bash dump.sh
```

### mlir gen
```
bash build.sh  
bash gen.sh
```
### tblgen project 
如下是tablegen的项目结构：
```shell
ex3-dialect
├── CMakeLists.txt           # 控制其他各个部分的 CMakeList
├── include
│   └── toy
│       ├── CMakeLists.txt  # 控制 Dialect 定义的 CMakeList
│       ├── ToyDialect.h    # Dialect 头文件
│       ├── ToyDialect.td   # Dialect TableGen 文件
│       ├── ToyOps.h        # Op 头文件
│       ├── ToyOps.td       # Op TableGen 文件
│       └── Toy.td          # 把 ToyDialect.td 和 ToyOps.td include 到一起，用于 tablegen
├── lib
│   ├── CMakeLists.txt
│   └── toy.cpp             # Dialect library
└── tools
    └── toy-opt
        ├── CMakeLists.txt
        └── toy-opt.cpp     # Executable Tool
```


## mlir toy项目


## References
1. https://github.com/KEKE046/mlir-tutorial(mlir tutorial部分重点参考此文档)
