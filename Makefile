ITERATIONS ?= 100000000

all: bench_c bench_go bench_rust
build: build_c build_go build_rust

.PHONY: bench_c bench_go bench_rust

build_lib:
	@cd librunalot && gcc -c -Wall -Werror -fpic  -shared -o librunalot.so librunalot.c

build_c: build_lib
	@cd bench_c && gcc -L../librunalot -l runalot main.c -o bench_c

build_go: build_lib
	@cd bench_go && go build

build_rust: build_lib
	@cd bench_rust && cargo build -q

bench_c: build_c
	@bench_c/bench_c ${ITERATIONS}

bench_go: build_go
	@bench_go/bench_go ${ITERATIONS}

bench_rust: build_rust
	@cd bench_rust && cargo run -q ${ITERATIONS}

clean:
	@cd bench_rust; cargo clean
	@rm bench_go/bench_go librunalot/librunalot.so bench_c/bench_c
