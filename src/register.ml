type qreg  = {
    n_qubits: int;
    mutable amplitudes : Complex.complex array
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
