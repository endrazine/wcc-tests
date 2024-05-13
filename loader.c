#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dlfcn.h>
#include <errno.h>
#include <string.h>
int main(int argc, char **argv)
{
	void *handle;
	if (argc < 2) {
		printf("Usage: %s </path/to/elf>\n", argv[0]);
		return -1;
	}
	handle = dlopen(argv[1], RTLD_LAZY);
	if (handle <= 0) {
		printf(" !! ERROR : %s\n", dlerror());
		exit(EXIT_FAILURE);
	}
	printf("Loading of Library successful\n");
	return 0;
}
