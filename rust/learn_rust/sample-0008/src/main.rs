
// #[derive(Copy)]
struct Sample {
  n: u32,
  m: u32,
}

// impl Sample {
//   fn new(n: u32, m: u32) -> Self {
//     Self { n: n, m: m }
//   }
// }

impl Copy for Sample { }

impl Clone for Sample {
  fn clone(&self) -> Self {
    *self
  }
}

fn main() {

  // let s1 = Sample::new(1, 2);
  let s1 = Sample { n: 1, m: 2 };
  let s2 = s1;

  println!("s1.n: { }", s1.n);
  println!("s2.m: { }", s2.m);

  // let s1 = String::from("ok!");
  // let s2 = s1;

  //
  // let s2 = s1.clone();
  //
  // let mut s2 = String::new();
  // s2.clone_from(&s1);
  //
  // println!("s1: { }", s1);
  //

  // println!("s2: { }", s2);
  // println!("s2.capacity(): { }", s2.capacity());
  // println!("s2.len(): { }", s2.len());
}

