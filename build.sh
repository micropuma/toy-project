#!/bin/bash

cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/home/leon/tutorial/mlir-tutorial/install -DCMAKE_BUILD_TYPE=Debug 
make
