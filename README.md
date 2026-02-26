# <img src="https://github.com/elias-utf8/qcaml/blob/main/assets/images/qcaml_banner.png" alt="QCaml logo" width="220"/>

[![License](https://img.shields.io/badge/License-Apache%202.0-3c60b1.svg?logo=opensourceinitiative&logoColor=white&style=flat-square)](https://github.com/elias-utf8/qcaml/blob/main/LICENSE)
[![OCaml](https://img.shields.io/badge/OCaml-5.2-ec6813.svg?style=flat-square&logo=ocaml&logoColor=white)](https://ocaml.org/)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/elias-utf8/qcaml/test.yml?branch=main&style=flat-square&logo=github&label=tests)
![GitHub Release](https://img.shields.io/github/v/release/qcaml/qcaml?style=flat-square&logo=gitlfs&logoColor=white)

**QCaml** for Quantum (O)Caml is a lightweight library to experiment with quantum states, gates and simulating quantum algorithms.

It provides n-qubit registers, quantum gates (Pauli, Hadamard, rotations, CNOT), measurement with state collapse, and interactive Bloch sphere visualization.

## Installation
### Prerequisites
You need the [opam](https://opam.ocaml.org/) package manager to install the OCaml build tools.
```sh
$ sudo apt install opam   # debian/ubuntu
$ opam init
$ opam switch create 5.2.0
$ eval $(opam env)
$ opam install dune odoc alcotest bisect_ppx raylib
```
### Install from OPAM (recommended)
QCaml is now available on the official OPAM repository, so you can install it directly via `opam`:
```sh
$ opam install qcaml
```
### Develop locally
If you want to work on QCaml locally (for development, testing, or contributing), you can still clone and build the repository manually.

The following will clone the repository, build QCaml and install it into your opam.
```sh
$ git clone https://github.com/elias-utf8/qcaml.git
$ cd qcaml/
$ make
$ opam install .
```

## Create your first quantum program with QCaml
Now that QCaml is installed on your system you can create your first quantum program.

Try this simple example by running `dune exec examples/superposition.exe` to visualize a qubit in superposition on the Bloch sphere.

```ocaml
(* examples/superposition.ml *)
open Quantum
let () =
  (* allocate a 1-qubit register in |0⟩ *)
  let reg = Register.allocate 1 in

  (* print state before transformation *)
  Register.display_qubit reg 0;     
  
  (* apply Hadamard: |0⟩ > |+⟩ *)
  Gate.h reg 0;                     

  (* print state after superposition *)
  Register.display_qubit reg 0;

  (* display qubit 0 on the Bloch sphere *)
  Visualization.plot_bloch reg 0 ()
```

The first thing to do is to open the `Quantum` module, which gives access to all of QCaml's features. Then we allocate a register of 1 qubit with `Register.allocate 1` — this register is initialized in the $|0\rangle$ state.
<br>We call `Register.display_qubit reg 0` to print the qubit's state vector before any transformation.
<br>Next we apply an Hadamard gate on the first qubit with `Gate.h reg 0`, which creates an equal superposition: the qubit goes from $|0\rangle$ to $|+\rangle = \frac{|0\rangle + |1\rangle}{\sqrt{2}}$. A second `display_qubit` call lets us see the new amplitudes.
<br>Finally, `Visualization.plot_bloch reg 0 ()` opens an interactive Bloch sphere window showing where the qubit sits on the sphere reflecting the equal superposition.

<img src="https://github.com/qcaml/qcaml/blob/main/assets/images/bloch.png" alt="Bloch Sphere" width="350">

## Features

<table>
  <thead>
    <tr>
      <th width="35%">Feature</th>
      <th width="20%">Status</th>
      <th width="45%">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Qubit Initialization</strong></td>
      <td><span>✓ Completed</span></td>
      <td>Single and multi-qubit state initialization with arbitrary amplitudes</td>
    </tr>
    <tr>
      <td><strong>Basic Quantum Gates</strong></td>
      <td><span>✓ Completed</span></td>
      <td>Implementation of fundamental gates (Hadamard, Pauli-X/Y/Z)</td>
    </tr>
    <tr>
      <td><strong>Quantum Measurements</strong></td>
      <td><span style="color: #6c757d;">✓ Completed</span></td>
      <td>Computational basis measurements with probability calculations</td>
    </tr>
    <tr>
    <tr>
      <td><strong>Bloch sphere visualization</strong></td>
      <td><span>✓ Completed</span></td>
      <td>Visualization of qubit states on the Bloch sphere</td>
    </tr>
    <tr>
      <td><strong>Rotation Gates</strong></td>
      <td><span>✓ Completed</span></td>
      <td>Rx, Ry, Rz with arbitrary angle rotations</td>
    </tr>
    <tr>
      <td><strong>Multi-Qubit Operations</strong></td>
      <td><span>✓ Completed</span></td>
      <td>N-qubit registers with CNOT entangling gate</td>
    </tr>
    <tr>
      <td><strong>Simulator</strong></td>
      <td><span>○ Planned</span></td>
      <td>Circuit builder API, QASM export</td>
    </tr>
  </tbody>
</table>

## Documentation
<p>

   API Reference: Generated documentation at `_build/default/_doc/_html/index.html` (after running dune build @doc) or see [online documentation](https://qcaml.github.io/qcaml/) )
</p>

## Acknowledgements
**Quantum Computing Course – Math and Theory for Beginners :** https://youtu.be/tsbCSkvHhMo?si=XTbz10_b1v1aAS-3

## Citation


## License
[Apache License 2.0](https://github.com/qcaml/qcaml/blob/main/LICENSE)
