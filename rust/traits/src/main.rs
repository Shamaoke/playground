
///
/// ::: Traits :::
///

use std::any::Any;

trait Employee {
  fn val(&self) -> &String;

  fn as_any(&self) -> &dyn Any;
}

#[derive(Debug)]
struct Director {
  val: String
}

impl Employee for Director {
  fn val(&self) -> &String { &self.val }

  fn as_any(&self) -> &dyn Any { self }
}

#[derive(Debug)]
struct Subordinate {
  val: String
}

impl Employee for Subordinate {
  fn val(&self) -> &String { &self.val }

  fn as_any(&self) -> &dyn Any { self }
}

fn employee(n: u8) -> Box<dyn Employee> {
  if n == 0 {
    Box::new(Director { val: String::from("director") })
  } else {
    Box::new(Subordinate { val: String::from("subordinate") })
  }
}

fn main( ) {

  let d = employee(0);
  let s = employee(1);

  println!("{}", d.as_any().downcast_ref::<Director>().unwrap().val());
  println!("{}", s.as_any().downcast_ref::<Subordinate>().unwrap().val());

  // let d: Box<dyn Employee> = Box::new(Director { val: String::from("director") });
  // let director: &Director = d.as_any().downcast_ref::<Director>().unwrap();
  // dbg!(director);
}

