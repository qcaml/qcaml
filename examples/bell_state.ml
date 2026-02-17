(* Bell state & measurement *)
open Quantum

let () =
  let reg = Register.allocate 2 in

  Gate.h reg 0;
  Gate.cnot reg 0 1;

  Printf.printf "Bell state:\n";
  Register.display_qreg reg;

  Printf.printf "\nMeasurement:\n";
  Measurement.measure reg 0;
  Measurement.measure reg 1;

  Register.display_qreg reg
