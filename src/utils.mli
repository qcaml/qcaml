(**
  @author       Elias GAUTHIER
  file :        utils.mli
  date :        2026-16-01
  license :     Apache-2.0
  description : Various utility functions for qcaml.
*)

(** Convert int in binary string reprensation

    @param n Integer to convert
    @return String binary representation
*)
val strbin_of_int : int -> string
