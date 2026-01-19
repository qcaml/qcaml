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

let test_allocate_single_qubit () =
  let reg = allocate 1 in
  Alcotest.(check int) "size" 1 (size reg);
  Alcotest.(check int) "dim" 2 (dim reg);
  let amp0 = get_amplitude reg 0 in
  Alcotest.(check (float 0.001)) "amp |0⟩" 1.0 amp0.re;
  let amp1 = get_amplitude reg 1 in
  Alcotest.(check (float 0.001)) "amp |1⟩" 0.0 amp1.re

let test_allocate_zero_qubit () =
  let reg = allocate 0 in
  Alcotest.(check int) "size" 0 (size reg);
  Alcotest.(check int) "dim" 1 (dim reg)

let test_allocate_negative () =
  Alcotest.check_raises "negative qubits" (Invalid_argument "Number of qubits must be non-negative")
    (fun () -> ignore (allocate (-1)))

let test_set_amplitude () =
  let reg = allocate 2 in
  let new_amp = { re = 0.5; im = 0.5 } in
  set_amplitude reg 1 new_amp;
  let amp = get_amplitude reg 1 in
  Alcotest.(check (float 0.001)) "re" 0.5 amp.re;
  Alcotest.(check (float 0.001)) "im" 0.5 amp.im

let test_get_amplitude_out_of_bounds () =
  let reg = allocate 2 in
  Alcotest.check_raises "out of bounds" (Invalid_argument "Index 10 out of bounds [0, 4)")
    (fun () -> ignore (get_amplitude reg 10))

let test_set_amplitude_out_of_bounds () =
  let reg = allocate 2 in
  let amp = { re = 1.0; im = 0.0 } in
  Alcotest.check_raises "out of bounds" (Invalid_argument "Index 5 out of bounds [0, 4)")
    (fun () -> set_amplitude reg 5 amp)

let test_get_qubit () =
  let reg = allocate 2 in
  (* Initial state |00⟩ *)
  let alpha, beta = get_qubit reg 0 in
  Alcotest.(check (float 0.001)) "alpha re" 1.0 !alpha.re;
  Alcotest.(check (float 0.001)) "alpha im" 0.0 !alpha.im;
  Alcotest.(check (float 0.001)) "beta re" 0.0 !beta.re;
  Alcotest.(check (float 0.001)) "beta im" 0.0 !beta.im

let test_get_qubit_superposition () =
  let reg = allocate 1 in
  (* Create equal superposition |+⟩ = (|0⟩ + |1⟩)/√2 *)
  let sqrt2_inv = 1.0 /. sqrt 2.0 in
  set_amplitude reg 0 { re = sqrt2_inv; im = 0.0 };
  set_amplitude reg 1 { re = sqrt2_inv; im = 0.0 };
  let alpha, beta = get_qubit reg 0 in
  Alcotest.(check (float 0.001)) "alpha" sqrt2_inv !alpha.re;
  Alcotest.(check (float 0.001)) "beta" sqrt2_inv !beta.re

let () =
  Alcotest. run "Register" [
    "allocate", [
      Alcotest.test_case "2 qubits" `Quick test_allocate;
      Alcotest.test_case "1 qubit" `Quick test_allocate_single_qubit;
      Alcotest.test_case "0 qubit" `Quick test_allocate_zero_qubit;
      Alcotest.test_case "negative" `Quick test_allocate_negative;
    ];
    "amplitude", [
      Alcotest.test_case "set" `Quick test_set_amplitude;
      Alcotest.test_case "get out of bounds" `Quick test_get_amplitude_out_of_bounds;
      Alcotest.test_case "set out of bounds" `Quick test_set_amplitude_out_of_bounds;
    ];
    "qubit", [
      Alcotest.test_case "get initial" `Quick test_get_qubit;
      Alcotest.test_case "superposition" `Quick test_get_qubit_superposition;
    ]
  ]