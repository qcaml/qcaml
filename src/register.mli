(** Type representing n qubits register *)
type qreg

(** Allocate n qubit register *)
val allocate : int -> qreg

val size : qreg -> int

val dim : qreg -> int

val get_amplitude : qreg -> int -> Complex.complex

val set_amplitude : qreg -> int -> Complex.complex -> unit
