
struct Sample {
  data: String,
}

impl Drop for Sample {
  fn drop(&mut self) {
    println!("{ } has been dropped!", self.data);
  }
}

fn main() {

  // let s1 = Sample { data: String::from("s1") };
  // let s2 = Sample { data: String::from("s2") };
  //
  // println!("s1.data: {0}\ns2.data: {1}", s1.data, s2.data);

  let s1 = Sample { data: String::from("s") };
  let s2 = s1;

  println!("s2.data: { }", s2.data);

}

