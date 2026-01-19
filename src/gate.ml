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

 (*
  Note : since we are using a qubit register 
  represended as an array of complex amplitudes,
  applying gates will be done by identifying pairs 
  of amplitudes that differ by the target qubit bit,
  and modifying them according to the gate definition.
 *)

let x (qreg : Register.qreg) target =
  let amps_copy = Array.copy qreg.amplitudes in
  for i=0 to Register.dim qreg - 1 do
    let pair = i lxor (1 lsl target) in
    amps_copy.(i) <- qreg.amplitudes.(pair)
  done;
  qreg.amplitudes <- amps_copy

let y (qreg :Register.qreg) target =
  let amps_copy = Array.copy qreg.amplitudes in
  for i=0 to Register.dim qreg - 1 do
    if i land (1 lsl target) = 0 then
      let pair = i lxor (1 lsl target) in
        amps_copy.(i) <- Complex.cmul Complex.minus_i qreg.amplitudes.(pair);
        amps_copy.(pair) <- Complex.cmul Complex.minus_i qreg.amplitudes.(i)
    done;
  qreg.amplitudes <- amps_copy

let z (qreg : Register.qreg) target =
  let amps_copy = Array.copy qreg.amplitudes in
  for i=0 to Register.dim qreg - 1 do
    if i land (1 lsl target) = 0 then
      let pair = i lxor (1 lsl target) in
      amps_copy.(i) <- qreg.amplitudes.(i);
      amps_copy.(pair) <- Complex.cneg qreg.amplitudes.(pair)
    done;
  qreg.amplitudes <- amps_copy

let h (qreg : Register.qreg) target =
  let amps_copy = Array.copy qreg.amplitudes in
  let sqrt2_2 = sqrt 2.0 /. 2.0 in
  for i=0 to Register.dim qreg - 1 do
    if i land (1 lsl target) = 0 then
      let pair = i lxor (1 lsl target) in
      amps_copy.(i) <- Complex.cadd (Complex.cmul_scalar sqrt2_2 qreg.amplitudes.(i)) (Complex.cmul_scalar sqrt2_2 qreg.amplitudes.(pair));      
      amps_copy.(pair) <- Complex.csub (Complex.cmul_scalar sqrt2_2 qreg.amplitudes.(i)) (Complex.cmul_scalar sqrt2_2 qreg.amplitudes.(pair))
    done;
  qreg.amplitudes <- amps_copy

let rx (qreg : Register.qreg) target phase =
  let amps_copy = Array.copy qreg.amplitudes in
  let phi2 = phase /. 2.0 in
  for i=0 to Register.dim qreg - 1 do
    if i land (1 lsl target) = 0 then
      let pair = i lxor (1 lsl target) in
      amps_copy.(i) <- Complex.cadd (Complex.cmul_scalar (cos phi2) qreg.amplitudes.(i)) (Complex.cmul_scalar (Complex.minus_i.im *. sin phi2) qreg.amplitudes.(pair));
      amps_copy.(pair) <- Complex.cadd (Complex.cmul_scalar (Complex.minus_i.im *. sin phi2) qreg.amplitudes.(i)) (Complex.cmul_scalar (cos phi2) qreg.amplitudes.(pair));
    done;
  qreg.amplitudes <- amps_copy
      