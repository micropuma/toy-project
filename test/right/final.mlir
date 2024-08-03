toy.func @add(%a: !toy.int<32>, %b: !toy.int<32>) -> !toy.int<32> {
  %c = toy.add %a, %b : !toy.int<32>
  toy.ret %c : !toy.int<32>
}

toy.func @test(%a: !toy.int<32>, %b: !toy.int<32>) -> !toy.int<32> {
  %c = toy.call @add(%a, %b) : (!toy.int<32>, !toy.int<32>) -> !toy.int<32>
  %d = toy.add %a, %b : !toy.int<32>
  %f = toy.add %d, %d : !toy.int<32>
  toy.ret %f : !toy.int<32>
}