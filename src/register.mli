open Complex

type t = {
  n_qubits : int;                    (* Nombre de qubits *)
  mutable amplitudes : Qubit.q array;  (* Taille 2^n *)
}

val allocate : int n -> Qubit.q array;
