#!/bin/bash

cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/home/leon/tutorial/mlir-tutorial/install
make
