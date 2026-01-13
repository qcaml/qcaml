(**
  @author       Elias GAUTHIER
  file :        gate.mli
  date :        2025-16-02
  license :     Apache-2.0
  description : Implementation of gates (X, Z, Y, Hadamard, S, T)
*)
open Qubit

(** X gate
    Matrice X = [[0, 1], [1, 0]]
    Result: [α'] = [0·α + 1·β] = [β]
            [β']   [1·α + 0·β]   [α]
    @param q Qubit to apply the gate on
    @return unit

*)
val x : q -> unit

(** Y gate
    Matrice Y = [[0, -i], [i, 0]]
    Result: [α'] = [0·α + i·β] = [i·β]
            [β']   [(-i)·α + 0·β] = [-i·α]
    @param q Qubit to apply the gate on
    @return unit

*)
val y : q -> unit

(** Z gate
    Matrice Z = [[1, 0], [0, -1]]
    Result: [α'] = [1·α + 0·β] = [α]
            [β']   [0·α + (-1)·β] = [-β]
    @param q Qubit to apply the gate on
    @return unit
*)
val z : q -> unit

(** Hadamard gate
    Matrice H = 1/√2 × [[1, 1], [1, -1]]
    Result: [α'] = 1/√2 × [1·α + 1·β] = (α + β)/√2
            [β'] = 1/√2 × [1·α + (-1)·β] = (α - β)/√2
    @param q Qubit to apply the gate on
    @return unit
*)
val h : q -> unit


(**S gate
    Matrice S = [[1, 0], [0, i]]
    Result: [α'] = [1·α + 0·β] = [α]
            [β'] = [0·α + i·β] = [i·β]
    @param q Qubit to apply the gate on
    @return unit
*)
val s : q -> unit

(**T gate
    Matrice T = [[1, 0], [0, exp(i·π/4)]]
    Result: [α'] = [1·α + 0·β] = [α]
            [β'] = [0·α + exp(i·π/4)·β] = [exp(i·π/4)·β]
    @param q Qubit to apply the gate on
    @return unit
*)
val t : q -> unit

(**Rx gate
   Matrice Rx = [[cos(θ/2), -i·sin(θ/2)], [-i·sin(θ/2), cos(θ/2)]]
   Result: [α'] = [cos(θ/2)·α + (-i·sin(θ/2))·β]
           [β'] = [(-i·sin(θ/2))·α + cos(θ/2)·β]
    @param q Qubit to apply the gate on
    @param theta Angle in radians
    @return unit
*)
val rx : q -> float -> unit

(**Ry gate
   Matrice Ry = [[cos(θ/2), -sin(θ/2)], [sin(θ/2), cos(θ/2)]]
   Result: [α'] = [cos(θ/2)·α + (-sin(θ/2))·β]
           [β'] = [sin(θ/2)·α + cos(θ/2)·β]
    @param q Qubit to apply the gate on
    @param theta Angle in radians
    @return unit
*)
val ry : q -> float -> unit

(**Rz gate
   Matrice Rz = [[exp(-i·θ/2), 0], [0, exp(i·θ/2)]]
   Result: [α'] = [exp(-i·θ/2)·α + 0·β] = [exp(-i·θ/2)·α]
           [β'] = [0·α + exp(i·θ/2)·β] = [exp(i·θ/2)·β]
    @param q Qubit to apply the gate on
    @param theta Angle in radians
    @return unit
*)
val rz : q -> float -> unit
