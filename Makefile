all:
	gcc loader.c -o loader -ldl
	debootstrap $(shell cat /etc/lsb-release|grep CODENAME|awk -F "=" '{print $$2}') ./chroot-test || :

test:
	rm -f exec.log
	./test_all
	grep Load ./exec.log |wc -l

cve-2002-3602:
	wsh ../openssl/build-3.0.8/libcrypto.a /lib/x86_64-linux-gnu/libpthread.so.0 < ./scripts/CVE-2022-3602.wsh || echo ""
	wsh ../openssl/build-3.0.7/libcrypto.a /lib/x86_64-linux-gnu/libpthread.so.0 < ./scripts/CVE-2022-3602.wsh || echo ""
	wsh ../openssl/build-3.0.6/libcrypto.a /lib/x86_64-linux-gnu/libpthread.so.0 < ./scripts/CVE-2022-3602.wsh || echo ""
	
cve-2022-3786:
	wsh ../openssl/build-3.0.8/libcrypto.a /lib/x86_64-linux-gnu/libpthread.so.0 < ./scripts/CVE-2022-3786.wsh || echo ""
	wsh ../openssl/build-3.0.7/libcrypto.a /lib/x86_64-linux-gnu/libpthread.so.0 < ./scripts/CVE-2022-3786.wsh || echo ""
	wsh ../openssl/build-3.0.6/libcrypto.a /lib/x86_64-linux-gnu/libpthread.so.0 < ./scripts/CVE-2022-3786.wsh || echo ""

complex:
	./complex.sh

chrome:
	cp /opt/google/chrome/chrome .
	time wld --libify --no-init ./chrome
	./loader ./chrome

