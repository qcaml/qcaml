(lang dune 3.17)
(name qcaml)
(version 1.0.0)
(use_standard_c_and_cxx_flags false)
(generate_opam_files true)

(source (github elias-utf8/qcaml))
(license Apache-2.0)
(authors "Elias GAUTHIER")
(maintainers "elias.gauthier@etu.u-bordeaux.fr")

(documentation "https://elias-utf8.github.io/qcaml/")

(package
 (name qcaml)
 (synopsis "OCaml library for quantum computing simulation")
 (description "\
QCaml is a lightweight OCaml library for simulating quantum algorithms.
It provides n-qubit registers, quantum gates and measurements for learning
quantum computing concepts and visualizing qubit states on the Bloch sphere.

Features:
- N-qubit state registers with complex amplitudes
- Quantum gates (Pauli-X/Y/Z, Hadamard, Rx, Ry, Rz, CNOT)
- Quantum measurements with probabilistic collapse and renormalization
- Interactive Bloch sphere visualization using Raylib
- Comprehensive test suite")
 (depends
  (ocaml (>= 5.2))
  (dune (>= 3.17))
  dune-configurator
  raylib
  (alcotest :with-test)
  (odoc :with-doc)
  (bisect_ppx :with-test))
 (tags
  (quantum computing simulation qubits gates visualization bloch-sphere)))
