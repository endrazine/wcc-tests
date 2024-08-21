# Purpose

This repository contains helper scripts to test the correctness of the Witchcraft Compiler Collection (WCC) software, hosted at: https://github.com/endrazine/wcc

# Testing WCC

To build, copy the Dockerfile in this repository under /tmp/woot24/Dockerfile. Then type:

	docker build . -t witchcraft:latest

This should produce a new image named witchcraft:latest.

You can then run the tests as such:

	jonathan@blackbox:/tmp$ docker run -it witchcraft:latest

	root@60b09a74e54d:~/wcc-tests# ls

	Makefile README.md chroot-test loader loader.c scripts test_all

	root@60b09a74e54d:~/wcc-tests# time make test

=> This should libify and load the 435 binaries in the PATH under 2 seconds.

Then, to test the CVE scripts accross the 3 versions of openssl (3.0.6, 3.0.7 and 3.0.8), simply type: 

        root@60b09a74e54d:~/wcc-tests# make cves

