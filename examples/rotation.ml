open Quantum

let q = Qubit.zero ()

let rotation q =
  (* 30° rotation then 45° rotation *)
  Gate.ry q (3.14 /. 6.0);
  Gate.rx q (3.14 /. 4.0);
  Visualization.plot_bloch q ()

let () =
  rotation q