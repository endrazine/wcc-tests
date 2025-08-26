#!/bin/bash

for testbin in /usr/sbin/sshd /usr/sbin/apache2 /usr/sbin/nginx
do
	cp ${testbin} ./test
	time wld --libify --no-init ./test
	./loader ./test
done
