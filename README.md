QEMU tutotial
=============

This is a base image for running a QEMU tutorial.

It is base on the ubuntu:14.04 image and adds QEMU dependencies, gcc/clang
compilers, libcapstone3 disassembler library. The QEMU sources with
instrumentation plugins are bundled and pre-compiled.

Run the image with:

$ docker pull guillon/qemu-tutorial
$ docker run -it guillon/qemu-tutorial
...
