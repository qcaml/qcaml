# <img src="https://github.com/elias-utf8/qcaml/blob/main/assets/images/qcaml_banner.png" alt="QCaml logo" width="250"/>

[![License](https://img.shields.io/badge/License-Apache%202.0-3c60b1.svg?logo=opensourceinitiative&logoColor=white&style=flat-square)](https://github.com/elias-utf8/qcaml/blob/main/LICENSE)
[![OCaml](https://img.shields.io/badge/OCaml-5.2-ec6813.svg?style=flat-square&logo=ocaml&logoColor=white)](https://ocaml.org/)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/elias-utf8/qcaml/test.yml?branch=main&style=flat-square&logo=github&label=tests)
![GitHub Release](https://img.shields.io/github/v/release/elias-utf8/qcaml?style=flat-square&logo=gitlfs&logoColor=white)

## Presentation 

QCaml for Quantum (O)Caml is a library for simulating quantum algorithms. It provides n-qubit registers, quantum gates (Pauli, Hadamard, rotations, CNOT), measurement with state collapse, and interactive Bloch sphere visualization.

> [!IMPORTANT]
>
> **Status**: The project is not yet mature, and I am looking for contributors to help it grow. Thank you!
>
> 
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
QCaml is now available on the official OPAM repository, so you can install it directly:
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

## Quick start
Try this simple example by running `dune exec examples/superposition.exe` to visualize a qubit in superposition on the Bloch sphere:
<table align="center">
<tr>
<td>
  
```ocaml
(* examples/superposition.ml *)
open Quantum
let () =
  let reg = Register.allocate 1 in
  Register.display_qubit reg 0;
  Gate.h reg 0;
  Register.display_qubit reg 0;
  Visualization.plot_bloch reg 0 ()
```

</td>
<td>
  <img src="https://github.com/qcaml/qcaml/blob/main/assets/images/bloch.png" alt="Bloch Sphere" width="350">
</td>
</tr>
</table>

## Architecture
<p align="center">
  <img src="https://github.com/elias-utf8/qcaml/blob/main/assets/images/diag_qcaml.svg" alt="QCaml architecture diagram">
</p>

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

   API Reference: Generated documentation at `_build/default/_doc/_html/index.html` (after running dune build @doc) or see [online documentation](https://elias-utf8.github.io/qcaml/) )
</p>

## Resources
**Quantum Computing Course – Math and Theory for Beginners :** https://youtu.be/tsbCSkvHhMo?si=XTbz10_b1v1aAS-3
