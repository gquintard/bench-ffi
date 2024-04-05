package main

// #cgo LDFLAGS: -L ../librunalot -lrunalot
// #include <stdint.h>
// # include "../librunalot/librunalot.h"
// uint64_t noop(uint64_t);
import "C"
import "os"
import "strconv"

//export noop
func noop(i C.uint64_t) C.uint64_t { 
	return i + 1
}

func main() {
	iterations, _ := strconv.ParseUint(os.Args[1], 10, 64)
	C.run_a_lot(C.CString("go"), C.uint64_t(iterations), (*[0]byte)(C.noop))
}
