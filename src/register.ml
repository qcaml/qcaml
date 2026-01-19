(*
 * Copyright 2026 Elias GAUTHIER <elias.gauthier@etu.u-bordeaux.fr>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *)

type qreg  = {
    n_qubits: int;
    mutable amplitudes : Complex.complex array
}

let allocate n =
  if n < 0 then
    invalid_arg "Number of qubits must be non-negative";

  let size = 1 lsl n in (* 2^n *)

  (*create array of size element*)
  let amps = Array.make size Complex.zero in
  amps.(0) <- Complex.one;
  { n_qubits = n; amplitudes = amps }

let size qreg = qreg.n_qubits

let dim qreg = 1 lsl qreg.n_qubits

let get_amplitude qreg index =
  if index < 0 || index >= Array.length qreg.amplitudes then
    invalid_arg (Printf.sprintf "Index %d out of bounds [0, %d)" 
                  index (Array.length qreg.amplitudes));
  qreg.amplitudes.(index)

let set_amplitude qreg index amp =
  if index < 0 || index >= Array.length qreg.amplitudes then
    invalid_arg (Printf.sprintf "Index %d out of bounds [0, %d)" 
                  index (Array.length qreg.amplitudes));
  qreg.amplitudes.(index) <- amp

let display_qreg qreg =
  for i = 0 to Array.length qreg.amplitudes - 1 do
    let strbin = Utils.strbin_of_int i in
    let padded = String.make (qreg.n_qubits - String.length strbin) '0' ^ strbin in
    print_endline ("|" ^ padded ^ "⟩ " ^ Complex. string_of_complex qreg.amplitudes.(i))
  done

let get_qubit qreg k =
  let alpha = ref Complex.zero in
  let beta = ref Complex.zero in
  for i = 0 to dim qreg - 1 do
    (*We apply a left shift and an AND operation 
      to check the k-th bit of i is 0 or 1.

      Then we accumulate the corresponding amplitudes
      in alpha for |0> and beta for |1>.
    *)
    if i land (1 lsl k) = 0 then
      alpha := Complex.cadd !alpha (get_amplitude qreg i)
    else
      beta := Complex.cadd !beta (get_amplitude qreg i)
  done;
  (alpha, beta)

let display_qubit qreg k =
  let alpha, beta = get_qubit qreg k in
  Printf.printf "|ψ%d⟩ = (%s)|0⟩ + (%s)|1⟩\n"
    k
    (Complex.string_of_complex !alpha)
    (Complex.string_of_complex !beta)