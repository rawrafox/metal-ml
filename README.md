# Aurora's Rust / OCaml bindings #

Hello and welcome to this work in progress thing!

To build stuff run `rake && ocamlbuild -pkgs core,ctypes.foreign -lflags -cclib,-framework,-cclib,Cocoa,-cclib,-framework,-cclib,Metal,-cclib,-framework,-cclib,MetalKit -tag 'debug' -I src triangle.native` then you will have a program that renders a triangle and stuff.

## Questions ##

 - Is this API stable? No!
 - Is this a long-term project? Probably no, the Rust version is the primary target for now.
 - Why? I was at the Mirage hack retreat in Marrakesh to learn me some OCamls.
