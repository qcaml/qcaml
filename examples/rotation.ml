open Quantum

let q = Qubit.zero ()

let rotation q =
  (* 30° rotation then 45° rotation *)
  Gate.rx q (3.14);
  Visualization.plot_bloch q ()

let () =
  rotation q