(**
  @author       Elias GAUTHIER
  file :        measurement.mli
  date :        2025-27-10
  license :     Apache-2.0
  description : Visualization of qubit
*)

(** Type holding values for Bloch sphere visualization *)
type svalues

(** Get the Cartesian coordinates of a qubit on the Bloch sphere *)
val get_cartesian_coordinates :  Complex.complex ref * Complex.complex ref -> float * float * float

(** Get the values needed for Bloch sphere visualization from a qubit *)
val get_values :  Complex.complex ref * Complex.complex ref -> svalues

(** Plot the Bloch sphere and the qubit state *)
val plot_bloch : Register.qreg -> int -> unit -> unit