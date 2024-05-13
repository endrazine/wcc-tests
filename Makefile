all:
	gcc loader.c -o loader

	debootstrap jammy ./chroot-test

test:
	./test_all
