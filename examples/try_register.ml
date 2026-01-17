open Quantum

let () =
  let reg = Register.allocate 2 in (* 2 registers qubits :  |00⟩ *) 
  let size = Register.size reg in
  let dim  = Register.dim reg in
  let qubit_index = 1 in
  let index = 3 in
  let qubit = Register.get_qubit_value index qubit_index in 
  Printf.printf "Register size: %d qubits\n" size;
  Printf.printf "Register dimension: %d\n" dim;
  print_endline ("Value of qubit" ^ string_of_int qubit_index ^ " at " ^ string_of_int index ^ " : " ^ string_of_int qubit);


  (* Set amplitude of |10⟩ to 1/sqrt(2) and |11⟩ to 1/sqrt(2) *)
  Register.display reg
