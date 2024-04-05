use std::env;
use std::os::raw::c_char;

extern "C" fn noop(i: u64) -> u64 {
    i+1
}

#[link(name = "runalot")]
extern {
   fn run_a_lot(lang: *const c_char, n: u64, do_stuff: extern fn(u64) -> u64);
}

fn main() {
    let args: Vec<String> = env::args().collect();

    let iterations = args[1].parse::<u64>().unwrap();
    unsafe { run_a_lot("rust\0".as_ptr() as *const c_char, iterations, noop) };
}
