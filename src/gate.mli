(**
  @author       Elias GAUTHIER
  file :        gate.mli
  date :        2026-01-16
  license :     Apache-2.0
  description : Implementation of gates (X, Z, Y, Hadamard) for n-qubit register
*)

(** 
  Apply the X (NOT) gate to the target qubit of the given quantum register.
  
  @param qreg The quantum register to which the gate is applied.
  @param target The index of the target qubit (0-based).
*)
val x : Register.qreg -> int -> unit

(** 
  Apply the Y gate to the target qubit of the given quantum register.
  
  @param qreg The quantum register to which the gate is applied.
  @param target The index of the target qubit (0-based).
*)
val y : Register.qreg -> int -> unit

(**   
  Apply the Z gate to the target qubit of the given quantum register.
  
  @param qreg The quantum register to which the gate is applied.
  @param target The index of the target qubit (0-based).
*)
val z : Register.qreg -> int -> unit

(** 
  Apply the Hadamard gate to the target qubit of the given quantum register.
  
  @param qreg The quantum register to which the gate is applied.
  @param target The index of the target qubit (0-based).
*)
val h : Register.qreg -> int -> unit

(**
  Apply the Rotation-X gate to the target qubit of the given quantum register.

  @param qreg The quantum register to which the gate is applied.
  @param target The index of the target qubit (0-based).
  @param theta The rotation angle in radians.
*)
val rx : Register.qreg -> int -> float -> unit


(**
  Apply the Rotation-Y gate to the target qubit of the given quantum register.

  @param qreg The quantum register to which the gate is applied.
  @param target The index of the target qubit (0-based).
  @param theta The rotation angle in radians.
*)
val ry : Register.qreg -> int -> float -> unit

(**
  Apply the Rotation-Z gate to the target qubit of the given quantum register.

  @param qreg The quantum register to which the gate is applied.
  @param target The index of the target qubit (0-based).
  @param theta The rotation angle in radians.
*)
val rz : Register.qreg -> int -> float -> unit