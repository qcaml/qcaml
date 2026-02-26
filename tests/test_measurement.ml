open Quantum.Register
open Quantum.Complex
open Quantum.Gate
open Quantum.Measurement

let float_eq = Alcotest.(check (float 0.0001))

(* Test that measurement collapses a superposition state *)
let test_measure_superposition () =
  let reg = allocate 1 in
  (* Create superposition |+⟩ = (|0⟩ + |1⟩)/√2 *)
  h reg 0;

  (* Before measurement, both amplitudes should be non-zero *)
  let amp0_before = get_amplitude reg 0 in
  let amp1_before = get_amplitude reg 1 in
  Alcotest.(check bool) "amp0 non-zero before" true (cmod amp0_before > 0.001);
  Alcotest.(check bool) "amp1 non-zero before" true (cmod amp1_before > 0.001);

  (* Measure *)
  measure reg 0;

  (* After measurement, one amplitude should be ~1 and the other ~0 *)
  let amp0_after = get_amplitude reg 0 in
  let amp1_after = get_amplitude reg 1 in
  let mod0 = cmod amp0_after in
  let mod1 = cmod amp1_after in

  (* Check that one is close to 1 and the other close to 0 *)
  let collapsed = (abs_float (mod0 -. 1.0) < 0.001 && mod1 < 0.001) ||
                  (abs_float (mod1 -. 1.0) < 0.001 && mod0 < 0.001) in
  Alcotest.(check bool) "collapsed to |0⟩ or |1⟩" true collapsed

(* Test that measuring |0⟩ always gives 0 *)
let test_measure_zero () =
  let reg = allocate 1 in
  (* State is |0⟩ *)
  measure reg 0;

  (* Should remain in |0⟩ *)
  let amp0 = get_amplitude reg 0 in
  let amp1 = get_amplitude reg 1 in
  float_eq "amp |0⟩" 1.0 amp0.re;
  float_eq "amp |1⟩" 0.0 (cmod amp1)

(* Test that measuring |1⟩ always gives 1 *)
let test_measure_one () =
  let reg = allocate 1 in
  (* Flip to |1⟩ *)
  x reg 0;
  measure reg 0;

  (* Should remain in |1⟩ *)
  let amp0 = get_amplitude reg 0 in
  let amp1 = get_amplitude reg 1 in
  float_eq "amp |0⟩" 0.0 (cmod amp0);
  float_eq "amp |1⟩" 1.0 amp1.re

(* Test measurement on multi-qubit register *)
let test_measure_multi_qubit () =
  let reg = allocate 2 in
  (* Create state |00⟩ *)
  h reg 0;  (* Now (|00⟩ + |01⟩)/√2 *)

  (* Measure qubit 0 *)
  measure reg 0;

  (* Check normalization - sum of |amplitudes|² should be 1 *)
  let sum = ref 0.0 in
  for i = 0 to dim reg - 1 do
    let amp = get_amplitude reg i in
    sum := !sum +. (cmod amp) ** 2.0
  done;
  float_eq "normalized" 1.0 !sum

(* Test measurement preserves normalization *)
let test_normalization_after_measurement () =
  let reg = allocate 2 in
  h reg 0;
  h reg 1;  (* Create (|00⟩ + |01⟩ + |10⟩ + |11⟩)/2 *)

  (* Measure qubit 0 *)
  measure reg 0;

  (* Check that state is still normalized *)
  let sum = ref 0.0 in
  for i = 0 to dim reg - 1 do
    let amp = get_amplitude reg i in
    sum := !sum +. (cmod amp) ** 2.0
  done;
  float_eq "normalized after measurement" 1.0 !sum

(* Test multiple measurements on same qubit give same result *)
let test_repeated_measurement () =
  let reg = allocate 1 in
  h reg 0;  (* Superposition *)

  measure reg 0;
  let amp0_first = get_amplitude reg 0 in
  let amp1_first = get_amplitude reg 1 in

  (* Measure again *)
  measure reg 0;
  let amp0_second = get_amplitude reg 0 in
  let amp1_second = get_amplitude reg 1 in

  (* State should be unchanged *)
  float_eq "amp0 unchanged" (cmod amp0_first) (cmod amp0_second);
  float_eq "amp1 unchanged" (cmod amp1_first) (cmod amp1_second)

let () =
  Alcotest.run "Measurement" [
    "collapse", [
      Alcotest.test_case "superposition" `Quick test_measure_superposition;
      Alcotest.test_case "measure |0⟩" `Quick test_measure_zero;
      Alcotest.test_case "measure |1⟩" `Quick test_measure_one;
    ];
    "multi-qubit", [
      Alcotest.test_case "measure one qubit" `Quick test_measure_multi_qubit;
    ];
    "normalization", [
      Alcotest.test_case "after measurement" `Quick test_normalization_after_measurement;
      Alcotest.test_case "repeated measurement" `Quick test_repeated_measurement;
    ]
  ]
