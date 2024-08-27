
///
/// ::: Traits :::
///

trait Employee {
  fn val(&self) -> &str;
}

struct Director<'a> {
  val: &'a str
}

impl<'a> Employee for Director<'a> {
  fn val(&self) -> &str { self.val }
}

struct Subordinate<'a> {
  val: &'a str
}

impl<'a> Employee for Subordinate<'a> {
  fn val(&self) -> &str { self.val }
}

fn employee(n: u8) -> Box<dyn Employee> {
  if n == 0 {
    Box::new(Director { val: "director" })
  } else {
    Box::new(Subordinate { val: "subordinate" })
  }
}

fn main( ) {

  dbg!(employee(0).val());
  dbg!(employee(1).val());
}

