(**
  @author       Elias GAUTHIER
  file :        measurement.mli
  date :        2025-10-10
  license :     Apache-2.0
  description : Implementation of qubit measurement
*)


(** Measure a qubit in the computational basis.
    This collapses one qubit of register to either 
    |0⟩ or |1⟩ based on the probability
    amplitudes and returns the measurement result.

    @param qreg The qubit register
    @param target The targer qubit
*)
val measure : Register.qreg -> int  -> unit 
