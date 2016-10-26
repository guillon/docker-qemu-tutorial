QEMU tutotial
=============

This is a base image for running a QEMU tutorial.

It is base on the ubuntu:14.04 image and adds QEMU dependencies, gcc/clang
compilers, libcapstone3 disassembler library. The QEMU sources with
instrumentation plugins are bundled and pre-compiled.

Run
---

Run the image with:

    $ docker pull guillon/qemu-tutorial
    $ docker run -it guillon/qemu-tutorial
    
    Welcome to the JCF11 QEMU Tutorial

    You're running bash into a Ubuntu 14.04 container as user 'hacker'.

    You may check your install with:
    > check-install.sh
    which should dump a binary search call trace.

    hacker@container:~$

Check
-----

Once launched, one may to a sanity check that the tutorial sources and qemu-plugins build are properly setup, with:

    $ check-install.sh
    building bsearch-rec
    ....

Use Image
---------

The image contains a prebuilt version of qemu-plugins which is installed in the PATH and that can be modified, compiled, for instance:

    $ cd qemu-plugins-build
    $ emacs tcg/plugins/dyntrace.c
    # Modify as you whish
    $ make -j4 && make install
    $ (cd ~/qemu-tutorial/src && qemu-x86_64 -tcg-plugin dyntrace ./bsearch-rec) 2>&1 | grep './bsearch-rec:'
    ...
    bsearch-rec 623 623: CPU #0 - 0x00000000004007bd [2]: 1 instruction(s) in 'bsearch-rec:main'
    bsearch-rec 623 623: CPU #0 - 0x0000000000400808 [2]: 2 instruction(s) in 'bsearch-rec:main'

Modify Image
------------

The image sources are located at https://github.com/guillon/docker-qemu-tutorial, actually an automated Docker hub build is setup and the images are available at https://hub.docker.com/r/guillon/qemu-tutorial/ when this repo is modify.

In order to rebuild the image locally, extract sources and execute the `./build.sh` script which build the Docker image locally under the name `guillon/dev-qemu-tutorial`:

    $ git clone https://github.com/guillon/docker-qemu-tutorial
    $ cd docker-qemu-tutorial
    $ ./build.sh
    $ docker run -it guillon/dev-qemu-tutorial
    ...
    
References
----------

Ref qemu-plugins repository: https://github.com/guillon/qemu-plugins

Ref docker-qemu-tutorial repository: https://github.com/guillon/docker-qemu-tutorial

Ref docker hub prebuilt images: https://hub.docker.com/r/guillon/qemu-tutorial/
