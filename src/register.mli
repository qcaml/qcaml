(**
  @author       Elias GAUTHIER
  file :        register.mli
  date :        2026-01-16
  license :     Apache-2.0
  description : Implementation of qubit register
*)

(** Type representing n qubits register *)
type qreg  = {
    n_qubits: int;
    mutable amplitudes : Complex.complex array
}

(** Allocate n qubit register

    @param n Number of qubits
    @return Allocated qubit register
*)
val allocate : int -> qreg

(** Get the number of qubits in the register

    @param qreg Qubit register
    @return Number of qubits
*)
val size : qreg -> int

(** Get the dimension of the register's state vector

    @param qreg Qubit register
    @return Dimension of the state vector
*)
val dim : qreg -> int

(** Get the amplitude of the state at index i 

    @param qreg Qubit register
    @param i Index of the state
    @return Amplitude of the state
*)
val get_amplitude : qreg -> int -> Complex.complex

(** Set the amplitude of the state at index i 

    @param qreg Qubit register
    @param i Index of the state
    @param amp New amplitude to set
*)
val set_amplitude : qreg -> int -> Complex.complex -> unit


(** Get the qubit at index i 

    @param qreg Qubit register
    @param i Index of the qubit
    @return Tuple of references to the amplitudes of |0> and |1> states)
*)
val get_qubit : qreg -> int -> Complex.complex ref * Complex.complex ref

(** Display the full state of the qubit register

    @param qreg Qubit register
*)
val display_qreg : qreg -> unit

(** Display the state of the qubit at index i 

    @param qreg Qubit register
    @param i Index of the qubit
*)
val display_qubit : qreg -> int -> unit