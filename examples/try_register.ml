open Quantum

let () =
  let reg = Register.allocate 5 in  (* 3 registers qubits :  |000⟩ *)
  Register.display reg
