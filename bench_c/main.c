#include <stdlib.h>
#include <stdint.h>
#include "../librunalot/librunalot.h"

uint64_t noop(uint64_t i) {
	return(i+1);
}

int main(int argc, char *argv[]) {
	run_a_lot("C", strtoull (argv[1], NULL, 10), noop);
}
