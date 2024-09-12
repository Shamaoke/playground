
///
/// ::: Modules :::
///

fn f( ) { println!("outer"); }

mod m {

  fn f( ) { println!("inner"); }

  pub fn g( ) {

    f();

    self::f();

    super::f();
  }
}

fn main( ) {
  m::g();
}

