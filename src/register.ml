type qreg  = {
    n_qubits: int;
    amplitudes : Complex.complex array
}

let allocate n = 
  let size = 1 lsl n in (* 2^n *)

  (*create array of size element*)
  let amps = Array.make size Complex.zero in
  amps.(0) <- Complex.one;
  { n_qubits = n; amplitudes = amps }

let size qreg = qreg.n_qubits

let dim qreg = 1 lsl qreg.n_qubits

let get_amplitude qreg index = qreg.amplitudes.(index)

let set_amplitude qreg index amp = qreg.amplitudes.(index) <- amp

let display qreg =
  print_endline (string_of_int qreg.n_qubits ^ " qubits register");
  Array.iteri (fun i elem ->
    print_endline (string_of_int i ^ ": " ^ Complex.string_of_complex elem)
  ) qreg.amplitudes
