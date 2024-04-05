# C -> {C,go,rust} calls performance

TL;DR: each language gives a no-op callback to C which calls it N times. Then we see who's the fastest.
Spoiler: `C` and `rust` have similar performance, `go` is 50 times slower.

You'll need:
- `go`
- `cargo`
- `gcc`
- `make`

The `Makefile` is your documentation starting point.

The code is ugly, but it's not a beauty pageant, deal with it.
