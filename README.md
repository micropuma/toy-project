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
> bash build.sh  
bash dump.sh

### mlir gen
> bash build.sh  
bash gen.sh

### play with mlir-opt



## mlir toy项目


## References
1. https://github.com/KEKE046/mlir-tutorial(mlir tutorial部分重点参考此文档)
