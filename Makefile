all:
	gcc loader.c -o loader -ldl
	debootstrap $(shell cat /etc/lsb-release|grep CODENAME|awk -F "=" '{print $$2}') ./chroot-test || :

test:
	rm -f exec.log
	./test_all
	grep Load ./exec.log |wc -l

cves:
	wsh ../openssl/build-3.0.8/libcrypto.a < ./scripts/CVE-2022-3786.wsh || echo ""
	wsh ../openssl/build-3.0.8/libcrypto.a < ./scripts/CVE-2022-3602.wsh || echo ""
	wsh ../openssl/build-3.0.7/libcrypto.a < ./scripts/CVE-2022-3786.wsh || echo ""
	wsh ../openssl/build-3.0.7/libcrypto.a < ./scripts/CVE-2022-3602.wsh || echo ""
	wsh ../openssl/build-3.0.6/libcrypto.a < ./scripts/CVE-2022-3786.wsh || echo ""
	wsh ../openssl/build-3.0.6/libcrypto.a < ./scripts/CVE-2022-3602.wsh || echo ""
