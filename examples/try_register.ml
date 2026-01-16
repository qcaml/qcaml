open Quantum

let () =
  let reg = Register.allocate 2 in (* 2 registers qubits :  |00⟩ *) 
  Register.display reg
