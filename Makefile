all:
	gcc loader.c -o loader

	debootstrap jammy ./chroot-test

test:
	./test_all

cves:
	wsh ../openssl/build-3.0.8/libcrypto.a < ./scripts/CVE-2022-3786.wsh
	wsh ../openssl/build-3.0.8/libcrypto.a < ./scripts/CVE-2022-3602.wsh
        wsh ../openssl/build-3.0.7/libcrypto.a < ./scripts/CVE-2022-3786.wsh
        wsh ../openssl/build-3.0.7/libcrypto.a < ./scripts/CVE-2022-3602.wsh
        wsh ../openssl/build-3.0.6/libcrypto.a < ./scripts/CVE-2022-3786.wsh
        wsh ../openssl/build-3.0.6/libcrypto.a < ./scripts/CVE-2022-3602.wsh

