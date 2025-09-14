all:
	gcc loader.c -o loader -ldl
	debootstrap $(shell cat /etc/lsb-release|grep CODENAME|awk -F "=" '{print $$2}') ./chroot-test || :

ubuntu-test:
	rm -f exec.log
	./test_all
	grep Load ./exec.log |wc -l

alpine-test:
	rm -f exec.log
	./test_alpine
	grep Load ./exec.log |wc -l

fedora-39-test:
	rm -f exec.log
	./test_fedora-39
	grep Load ./exec.log |wc -l

fedora-40-test:
	rm -f exec.log
	./test_fedora-40
	grep Load ./exec.log |wc -l

fedora-41-test:
	rm -f exec.log
	./test_fedora-41
	grep Load ./exec.log |wc -l

cve-2022-3602:
	wsh ../openssl/build-3.0.8/libcrypto.a < ./scripts/CVE-2022-3602.wsh || echo ""
	wsh ../openssl/build-3.0.7/libcrypto.a < ./scripts/CVE-2022-3602.wsh || echo ""
	wsh ../openssl/build-3.0.6/libcrypto.a < ./scripts/CVE-2022-3602.wsh || echo ""

cve-2022-3786:
	wsh ../openssl/build-3.0.8/libcrypto.a < ./scripts/CVE-2022-3786.wsh || echo ""
	wsh ../openssl/build-3.0.7/libcrypto.a < ./scripts/CVE-2022-3786.wsh || echo ""
	wsh ../openssl/build-3.0.6/libcrypto.a < ./scripts/CVE-2022-3786.wsh || echo ""

cve-2022-3602-ubuntu-20.04:
	LD_PRELOAD=/lib/x86_64-linux-gnu/libpthread.so.0 wsh ../openssl/build-3.0.8/libcrypto.a < ./scripts/CVE-2022-3602.wsh || echo ""
	LD_PRELOAD=/lib/x86_64-linux-gnu/libpthread.so.0 wsh ../openssl/build-3.0.7/libcrypto.a < ./scripts/CVE-2022-3602.wsh || echo ""
	LD_PRELOAD=/lib/x86_64-linux-gnu/libpthread.so.0 wsh ../openssl/build-3.0.6/libcrypto.a < ./scripts/CVE-2022-3602.wsh || echo ""

cve-2022-3786-ubuntu-20.04:
	LD_PRELOAD=/lib/x86_64-linux-gnu/libpthread.so.0 wsh ../openssl/build-3.0.8/libcrypto.a < ./scripts/CVE-2022-3786.wsh || echo ""
	LD_PRELOAD=/lib/x86_64-linux-gnu/libpthread.so.0 wsh ../openssl/build-3.0.7/libcrypto.a < ./scripts/CVE-2022-3786.wsh || echo ""
	LD_PRELOAD=/lib/x86_64-linux-gnu/libpthread.so.0 wsh ../openssl/build-3.0.6/libcrypto.a < ./scripts/CVE-2022-3786.wsh || echo ""

complex-test:
	./complex.sh

chrome-test:
	cp /opt/google/chrome/chrome .
	wld --libify --no-init ./chrome
	./loader ./chrome
