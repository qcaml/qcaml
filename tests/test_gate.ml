open Quantum.Register
open Quantum.Complex
open Quantum.Gate

let float_eq = Alcotest.(check (float 0.0001))

let test_x () =
  let reg = allocate 1 in
  x reg 0;
  let amp0 = get_amplitude reg 0 in
  let amp1 = get_amplitude reg 1 in
  float_eq "amp |0⟩" 0.0 amp0.re;
  float_eq "amp |1⟩" 1.0 amp1.re

let test_y () =
  let reg = allocate 1 in
  y reg 0;
  let amp0 = get_amplitude reg 0 in
  let amp1 = get_amplitude reg 1 in
  float_eq "amp |0⟩ re" 0.0 amp0.re;
  float_eq "amp |0⟩ im" 0.0 amp0.im;
  float_eq "amp |1⟩ re" 0.0 amp1.re;
  float_eq "amp |1⟩ im" 1.0 amp1.im

let test_z () =
  let reg = allocate 1 in
  h reg 0;
  z reg 0;
  let amp0 = get_amplitude reg 0 in
  let amp1 = get_amplitude reg 1 in
  let sqrt2_inv = 1.0 /. sqrt 2.0 in
  float_eq "amp |0⟩" sqrt2_inv amp0.re;
  float_eq "amp |1⟩" (-.sqrt2_inv) amp1.re

let test_h () =
  let reg = allocate 1 in
  h reg 0;
  let amp0 = get_amplitude reg 0 in
  let amp1 = get_amplitude reg 1 in
  let sqrt2_inv = 1.0 /. sqrt 2.0 in
  float_eq "amp |0⟩" sqrt2_inv amp0.re;
  float_eq "amp |1⟩" sqrt2_inv amp1.re

let test_rx () =
  let reg = allocate 1 in
  rx reg 0 Float.pi;
  let amp0 = get_amplitude reg 0 in
  let amp1 = get_amplitude reg 1 in
  float_eq "amp |0⟩ re" 0.0 amp0.re;
  float_eq "amp |1⟩ im" (-1.0) amp1.im

let test_ry () =
  let reg = allocate 1 in
  ry reg 0 Float.pi;
  let amp0 = get_amplitude reg 0 in
  let amp1 = get_amplitude reg 1 in
  float_eq "amp |0⟩" 0.0 amp0.re;
  float_eq "amp |1⟩" 1.0 amp1.re

let test_rz () =
  let reg = allocate 1 in
  h reg 0;
  rz reg 0 Float.pi;
  let amp0 = get_amplitude reg 0 in
  let amp1 = get_amplitude reg 1 in
  let sqrt2_inv = 1.0 /. sqrt 2.0 in
  float_eq "amp |0⟩ im" (-.sqrt2_inv) amp0.im;
  float_eq "amp |1⟩ im" sqrt2_inv amp1.im

(* Test CNOT on |10⟩ -> |11⟩ *)
let test_cnot () =
  let reg = allocate 2 in
  x reg 0;  (* Create |10⟩ *)
  cnot reg 0 1;  (* Should flip to |11⟩ *)
  let amp11 = get_amplitude reg 3 in
  float_eq "amp |11⟩" 1.0 amp11.re

(* Test CNOT creates Bell state *)
let test_cnot_bell () =
  let reg = allocate 2 in
  h reg 0;
  cnot reg 0 1;
  let amp00 = get_amplitude reg 0 in
  let amp11 = get_amplitude reg 3 in
  let sqrt2_inv = 1.0 /. sqrt 2.0 in
  float_eq "amp |00⟩" sqrt2_inv amp00.re;
  float_eq "amp |11⟩" sqrt2_inv amp11.re

let () =
  Alcotest.run "Gate" [
    "pauli", [
      Alcotest.test_case "X gate" `Quick test_x;
      Alcotest.test_case "Y gate" `Quick test_y;
      Alcotest.test_case "Z gate" `Quick test_z;
    ];
    "hadamard", [
      Alcotest.test_case "H gate" `Quick test_h;
    ];
    "rotation", [
      Alcotest.test_case "Rx gate" `Quick test_rx;
      Alcotest.test_case "Ry gate" `Quick test_ry;
      Alcotest.test_case "Rz gate" `Quick test_rz;
    ];
    "entangling", [
      Alcotest.test_case "CNOT" `Quick test_cnot;
      Alcotest.test_case "Bell state" `Quick test_cnot_bell;
    ]
  ]
