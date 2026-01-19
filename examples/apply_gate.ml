open Quantum

let () =
  let reg = Register.allocate 3 in
  Visualization.plot_bloch reg 2 ();
  Gate.rx reg 2 (3.14 /. 6.0);
  Visualization.plot_bloch reg 2 ();