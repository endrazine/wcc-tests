all:
	gcc loader.c -o loader

	apt install debootstrap
	debootstrap jammy ./chroot-test
