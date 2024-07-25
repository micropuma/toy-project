build/bin/toy-opt --help
build/bin/toy-opt ./test/right/basic.mlir
build/bin/toy-opt -canonicalize ./test/right/cse.mlir
build/bin/toy-opt -cse ./test/right/cse.mlir
