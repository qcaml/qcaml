open Quantum

let () =
  let q0 = Qubit.zero () in
  Gate.h q0;
  Measurement.measure q0;
  Printf.printf "%s\n" (Qubit.print () q0);
  Measurement.measure q0;
  Printf.printf "%s\n" (Qubit.print () q0);
  Measurement.measure q0;
  Printf.printf "%s\n" (Qubit.print () q0);

