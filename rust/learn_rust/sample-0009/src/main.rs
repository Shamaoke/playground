
fn take(s: String) -> String {
  println!("Aquired {s}");
  s
}

fn copy(n: i32) {
  println!("Copied {n}");
}

fn main() {

  let s = String::from("ok!");

  let s = take(s);

  println!("s: { }", s);

  let n = 99;

  copy(n);

  println!("n: { }", n);
}

