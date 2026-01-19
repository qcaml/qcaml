open Quantum.Complex

let test_cadd () =
  let c1 = { re = 1.0; im = 2.0 } in
  let c2 = { re = 3.0; im = 4.0 } in
  let r = cadd c1 c2 in
  Alcotest.(check (float 0.0001)) "re" 4.0 r.re;
  Alcotest.(check (float 0.0001)) "im" 6.0 r.im

let test_cmul() =
  let c1 = { re = 3.0; im = 2.0 } in
  let c2 = { re = 7.0; im = 2.0 } in
  let r = cmul c1 c2 in
  Alcotest.(check (float 0.0001)) "re" 17.0 r.re;
  Alcotest.(check (float 0.0001)) "im" 20.0 r.im

let test_csub() =
  let c1 = { re = 5.0; im = 3.0 } in
  let c2 = { re = 4.0; im = 1.0 } in
  let r = csub c1 c2 in
  Alcotest.(check (float 0.0001)) "re" 1.0 r.re;
  Alcotest.(check (float 0.0001)) "im" 2.0 r.im

let test_cconj() =
  let c = { re = 1.0; im = 9.0 } in
  let r = cconj c in
  Alcotest.(check (float 0.0001)) "re" 1.0 r.re;
  Alcotest.(check (float 0.0001)) "im" (-9.0) r.im

let test_cmul_scalar() = 
  let c = { re = 4.0; im = 2.0 } in
  let s = 4.0 in
  let r = cmul_scalar s c in
  Alcotest.(check (float 0.0001)) "re" 16.0 r.re;
  Alcotest.(check (float 0.0001)) "im" 8.0 r.im

let test_cmod() =
  let c = { re = 3.0; im = 4.0 } in
  let r = cmod c in
  Alcotest.(check (float 0.0001)) "modulus" 5.0 r

let test_carg() =
  let c = { re = 1.0; im = 1.0 } in
  let r = carg c in
  let pi_4 = Float.pi /. 4.0 in
  Alcotest.(check (float 0.0001)) "argument" pi_4 r

let test_carg_negative() =
  let c = { re = -1.0; im = 0.0 } in
  let r = carg c in
  Alcotest.(check (float 0.0001)) "argument pi" Float.pi r

let test_cneg() =
  let c = { re = 3.0; im = -5.0 } in
  let r = cneg c in
  Alcotest.(check (float 0.0001)) "re" (-3.0) r.re;
  Alcotest.(check (float 0.0001)) "im" 5.0 r.im

let test_string_of_complex() =
  let c = { re = 2.0; im = 3.0 } in
  let s = string_of_complex c in
  Alcotest.(check string) "string" "2. + 3.i" s

let () =
  let open Alcotest in
  run "Complex tests" [
    "addition", [ test_case "cadd" `Quick test_cadd ];
    "multiplication", [ test_case "cmul" `Quick test_cmul];
    "soustraction", [test_case "csub" `Quick test_csub];
    "conjugate", [test_case "cconj" `Quick test_cconj];
    "scalar multiplication", [test_case "cmul_scalar" `Quick test_cmul_scalar];
    "modulus", [test_case "cmod" `Quick test_cmod];
    "argument", [
      test_case "carg" `Quick test_carg;
      test_case "carg negative" `Quick test_carg_negative
    ];
    "negation", [test_case "cneg" `Quick test_cneg];
    "string conversion", [test_case "string_of_complex" `Quick test_string_of_complex]
  ]
