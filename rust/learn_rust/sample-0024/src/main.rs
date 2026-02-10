
//! An example program showing the usage of an enum type and creating a method on it

mod my {
  pub enum Sample<'a> {
    A(&'a str),
    B(&'a str),
  }

  impl<'a> Sample<'a> {
    pub fn call(&self) {
      match self {
        Self::A(s) => println!("A called with { }", s),
        Self::B(s) => println!("B called with { }", s),
      }
    }
  }
}

fn main( ) {

  use my::Sample;

  let a = Sample::A("a");
  let b = Sample::B("b");

  a.call();
  b.call();
}

