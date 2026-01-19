(* Quantum Superposition

   A qubit can exist in a linear combination of |0⟩ and |1⟩.
   The Hadamard gate creates an equal superposition: |0⟩ → |+⟩
*)

open Quantum

let () =
  let reg = Register.allocate 1 in

  print_endline "Initial state |0>:";
  Register.display_qubit reg 0;

  Gate.h reg 0;
  print_endline "\nAfter Hadamard gate - superposition |+> = (|0> + |1>)/sqrt(2):";
  Register.display_qubit reg 0;

  let alpha, beta = Register.get_qubit reg 0 in
  let p0 = Complex.cmod !alpha ** 2.0 in
  let p1 = Complex.cmod !beta ** 2.0 in
  Printf.printf "\nProbabilities: P(|0>) = %.0f%%  P(|1>) = %.0f%%\n" (p0 *. 100.) (p1 *. 100.);

  print_endline "\nBloch sphere (|+> points to +X axis):";
  Visualization.plot_bloch reg 0 ()
