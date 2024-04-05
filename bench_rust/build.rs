fn main() {
    println!("cargo:rustc-link-lib=runalot");
    println!("cargo:rustc-link-search=../librunalot/");
    println!("cargo:rerun-if-changed=./runalot.so");
}
