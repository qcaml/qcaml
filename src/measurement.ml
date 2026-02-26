(*
 * Copyright 2025 Elias GAUTHIER <elias.gauthier@etu.u-bordeaux.fr>
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

let measure qreg target =
    let ran_number = Utils.randfloat () in
    let p0 = ref 0.0 in
    for i = 0 to Register.dim qreg - 1 do
        if i land (1 lsl target) = 0 then
            p0 := !p0 +. (Complex.cmod (Register.get_amplitude qreg i)) ** 2.0
    done;
    if ran_number < !p0 then begin
        (* measurement gives 0 *)
        for i = 0 to Register.dim qreg - 1 do
            if i land (1 lsl target) <> 0 then
                Register.set_amplitude qreg i Complex.zero
        done;
        (* normalize *)
        let norm = sqrt !p0 in
        for i = 0 to Register.dim qreg - 1 do
            let amp = Register.get_amplitude qreg i in
            Register.set_amplitude qreg i (Complex.cmul_scalar (1.0 /. norm) amp)
        done
    end else begin
        (* measurement gives 1 *)
        for i = 0 to Register.dim qreg - 1 do
            if i land (1 lsl target) = 0 then
                Register.set_amplitude qreg i Complex.zero
        done;
        (* normalize *)
        let norm = sqrt (1.0 -. !p0) in
        for i = 0 to Register.dim qreg - 1 do
            let amp = Register.get_amplitude qreg i in
            Register.set_amplitude qreg i (Complex.cmul_scalar (1.0 /. norm) amp)
        done
    end
