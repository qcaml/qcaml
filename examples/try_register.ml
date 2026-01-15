open Quantum

let () =
  let reg = Register.allocate 2 in  (* Registre de 2 qubits :  |00⟩ *)

  let amp0 = Register.get_amplitude reg 0 in  (* Amplitude de |00⟩ → {re=1.0; im=0.0} *)
  let amp1 = Register.get_amplitude reg 1 in  (* Amplitude de |01⟩ → {re=0.0; im=0.0} *)
  let amp2 = Register.get_amplitude reg 2 in  (* Amplitude de |10⟩ → {re=0.0; im=0.0} *)
  let amp3 = Register.get_amplitude reg 3 in  (* Amplitude de |11⟩ → {re=0.0; im=0.0} *)

  (* On peut ensuite accéder aux parties réelle/imaginaire *)
  Printf.printf "Amplitude |00⟩ = %.2f + %.2fi\n" amp0.re amp0.im
