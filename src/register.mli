(**
  @author       Elias GAUTHIER
  file :        register.mli
  date :        2026-01-16
  license :     Apache-2.0
  description : Implementation of qubit register
*)

(** Type representing n qubits register *)
type qreg

(** Allocate n qubit register *)
val allocate : int -> qreg

val size : qreg -> int

val dim : qreg -> int

val get_amplitude : qreg -> int -> Complex.complex

val set_amplitude : qreg -> int -> Complex.complex -> unit

val display : qreg -> unit
