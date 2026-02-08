
//! An example program showing the usage of a struct type and the [`From`][0] trait implementation for the type
//!
//! [0]: https://doc.rust-lang.org/1.92.0/core/convert/trait.From.html

/// My module
mod my {

  /// The `Sample` struct type
  pub struct Sample {
    pub n: u32,
    pub m: u32,
  }

  impl From<&[u32; 2]> for Sample {

    /// Converts from a two elements `u32` slice to the `Sample` type
    fn from(value: &[u32; 2]) -> Self {
      Self { n: value[0], m: value[1] }
    }
  }
}

fn main( ) {

  use my::Sample;

  let n = 88;
  let m = 99;

  let mut s1 = Sample { n, m };
  //let s2 = Sample { n: s1.n, m: s1.m };
  let s2 = Sample { n: 77, ..s1 };

  s1.m = 66;

  println!("s1.n: {0}\ns1.m: {1}\ns2.n: {2}\ns2.m: {3}", s1.n, s1.m, s2.n, s2.m);

  // let s = Sample::from(&[77u32, 88u32]);

  // println!("n: {0}\nm: {1}", s.n, s.m);

  // match Sample::from(&[66u32, 77u32]) {
  //   Sample { n, m } => println!("n: {n}\nm: {m}")
  // };
}

