(**
  @author       Elias GAUTHIER
  file :        utils.mli
  date :        2026-01-16
  license :     Apache-2.0
  description : Various utility functions for qcaml.
*)

(** Convert int in binary string reprensation

    @param n Integer to convert
    @return String binary representation
*)
val strbin_of_int : int -> string

(** Get random float between 0 and 1

    @return Float number
*)
val randfloat : unit -> int
