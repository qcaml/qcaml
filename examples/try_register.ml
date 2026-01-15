open Quantum

let () =
  let reg = Register.allocate 3 in (* 3 registers qubits :  |000⟩ *)
  let amp1 = Register.get_amplitude reg 0 in 
  print_endline (Complex.string_of_complex amp1);
  Register.display reg
