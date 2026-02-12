(* Quantum Superposition

   A qubit can exist in a linear combination of |0⟩ and |1⟩.
   The Hadamard gate creates an equal superposition: |0⟩ -> |+⟩
*)

open Quantum

let () =
  let reg = Register.allocate 1 in

  Register.display_qubit reg 0;
  Gate.h reg 0;
  Register.display_qubit reg 0;

  Visualization.plot_bloch reg 0 ()
