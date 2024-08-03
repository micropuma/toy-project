build/bin/toy-opt --help
build/bin/toy-opt ./test/right/basic.mlir
build/bin/toy-opt -canonicalize ./test/right/cse.mlir
build/bin/toy-opt -cse ./test/right/cse.mlir
build/bin/toy-opt ./test/right/func.mlir
build/bin/toy-opt -convert-toy-to-arith="name=help" ./test/right/pass1.mlir
build/bin/toy-opt -convert-toy-to-arith="name=jdjdjjdjd" -toy-dce ./test/right/pass1.mlir
