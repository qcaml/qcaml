open Quantum. Register
open Quantum.Complex

let test_allocate () =
  let reg = allocate 2 in
  Alcotest.(check int) "size" 2 (size reg);
  Alcotest.(check int) "dim" 4 (dim reg);
  let amp0 = get_amplitude reg 0 in
  Alcotest.(check (float 0.001)) "amp |00⟩" 1.0 amp0.re;
  let amp1 = get_amplitude reg 1 in
  Alcotest.(check (float 0.001)) "amp |01⟩" 0.0 amp1.re

let () =
  Alcotest. run "Register" [
    "basic", [
      "allocate", `Quick, test_allocate;
    ]
  ]