
///
/// ::: Closures :::
///

fn main( ) {

  let n = 3i8;
  // fn f( ) -> i8 { n } //=> error[E0434]: can't capture dynamic environment in a fn item
  let f = | | -> i8 { n };
}

