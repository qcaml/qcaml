open Complex
open Qubit

type reg  = {
  n_qubits : int;                    (* Nombre de qubits *)
  mutable amplitudes : Qubit.q array;  (* Taille 2^n *)
}

let allocate n = 
  


