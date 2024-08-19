
trait Inspect {
  fn inspect(&self) -> ( );
}

#[derive(Debug)]
struct One {
  description: &'static str
}

#[derive(Debug)]
struct Two {
  description: &'static str
}

impl Inspect for One {
  fn inspect(&self) { println!("{}", self.description); }
}

impl Inspect for Two {
  fn inspect(&self) { println!("{}", self.description); }
}

fn main( ) {

  let one = One { description: "This is one." };
  let two = Two { description: "This is two." };

  one.inspect();
  two.inspect();

}

