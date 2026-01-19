open Quantum

let () =
  let reg = Register.allocate 3 in (* 3 registers qubits :  |000⟩ *) 
  let size = Register.size reg in
  let dim  = Register.dim reg in

  Printf.printf "Register size: %d qubits\n" size;
  Printf.printf "Register dimension: %d\n" dim;

  Register.display_qreg reg;
  Register.display_qubit reg 1;