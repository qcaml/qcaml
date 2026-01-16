(**
  @author       Elias GAUTHIER
  file :        gate.mli
  date :        2026-01-16
  license :     Apache-2.0
  description : Implementation of gates (X, Z, Y, Hadamard) for n-qubit register
*)

val x : Register.qreg -> int -> unit

val y : Register.qreg -> int -> unit

val z : Register.qreg -> int -> unit

val h : Register.qreg -> int -> unit
