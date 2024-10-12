all::
	gcc ../loader.c -o loader -ldl

	debootstrap noble ./chroot-noble
	debootstrap jammy ./chroot-jammy
	debootstrap focal ./chroot-focal
	debootstrap bionic ./chroot-bionic
	debootstrap xenial ./chroot-xenial
	debootstrap trusty ./chroot-trusty

test::

	./test_all

clean:
	rm -f loader testbin
	rm -rf chroot-*
