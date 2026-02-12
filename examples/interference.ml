(* Quantum Interference

   Applying Hadamard twice returns to the initial state: H*H = I
   This demonstrates constructive and destructive interference.
*)

open Quantum

let () =
  let reg = Register.allocate 1 in
   Register.display_qubit reg 0;

  Gate.h reg 0;
  Register.display_qubit reg 0;

  Gate.h reg 0;
  Register.display_qubit reg 0; 