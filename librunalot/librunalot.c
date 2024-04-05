#include <stdio.h>
#include <stdint.h>
#include <time.h>

#include "./librunalot.h"

void run_a_lot(char *lang, uint64_t n, do_stuff f) {
	uint64_t i;

	clock_t start, end;
	double cpu_time_used;

	start = clock();
	for (i = 0; i < n; i++) {
		f(i);
	}
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

	printf("%s: %ld iterations in %f seconds\n", lang, n, cpu_time_used);
}
