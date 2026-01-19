(* Quantum Interference

   Applying Hadamard twice returns to the initial state: H*H = I
   This demonstrates constructive and destructive interference.
*)

open Quantum

let () =
  let reg = Register.allocate 1 in

  print_endline "Initial state |0>:";
  Register.display_qubit reg 0;

  Gate.h reg 0;
  print_endline "\nAfter first H (superposition):";
  Register.display_qubit reg 0;

  Gate.h reg 0;
  print_endline "\nAfter second H (interference):";
  Register.display_qubit reg 0;

  let alpha, _ = Register.get_qubit reg 0 in
  Printf.printf "\nAmplitude of |0> = %.4f (back to initial state)\n" !alpha.re
