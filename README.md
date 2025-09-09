# Purpose

This repository contains helper scripts to test the correctness of the Witchcraft Compiler Collection (WCC) software, hosted at: https://github.com/endrazine/wcc

# Testing WCC on Ubuntu 24.04

To build, copy the Dockerfile in this repository under /tmp/test/Dockerfile. Then type:

	docker build . -t wcc:24.04 -f Dockerfile-24.04

This should produce a new image named wcc:24.04.

You can then run the tests as such:

	jonathan@blackbox:/tmp/test$ docker run -it wcc:24.04

	root@60b09a74e54d:~/wcc-tests# ls

	Dockerfile-20.04  Dockerfile-22.04  Dockerfile-24.04  Makefile  README.md  chroot-test  complex.sh  loader  loader.c  regressions  scripts  test  test_all

	root@60b09a74e54d:~/wcc-tests# time make test

=> This should libify and load the 400+ binaries in the PATH under 2 seconds.

Then, to test the CVE scripts accross the 3 versions of openssl (3.0.6, 3.0.7 and 3.0.8), simply type: 

        root@60b09a74e54d:~/wcc-tests# make cve-2002-3602
or:
        root@60b09a74e54d:~/wcc-tests# make cve-2022-3786

# Testing WCC on Ubuntu 22.04

Start by building the wcc:22.04 image with:

	docker build . -t wcc:22.04 -f Dockerfile-22.04

Then proceed with the instructions above.

# Testing WCC on Ubuntu 20.04

Start by building the wcc:20.04 image with:

	docker build . -t wcc:20.04 -f Dockerfile-20.04

Then proceed with the instructions above.


# Testing WCC on Fedora 41

Start by building the wcc:fedora image with:

	docker build . -t wcc:fedora -f Dockerfile-fedora

Then proceed with the instructions above.


# Testing WCC on Alpine 3.21 (experimental)

Start by building the wcc:alpine image with:

	docker build . -t wcc:alpine -f Dockerfile-alpine

Then proceed with the instructions above.
