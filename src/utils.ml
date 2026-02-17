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

let strbin_of_int n =
  match n with
  | 0 -> "0"
  | _ ->
    let result = ref "" in
    let temp = ref n in
    while !temp > 0 do
      result := string_of_int (!temp mod 2) ^ !result;
      temp := !temp / 2
    done;
    !result

let randfloat () =
    Random.self_init ();
    Random.float 1.0
