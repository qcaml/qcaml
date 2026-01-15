open Quantum

let () =
  let reg = Register.allocate 3 in  (* 3 registers qubits :  |000⟩ *)
  Register.display reg
