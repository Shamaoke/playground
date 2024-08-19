
///
/// ::: std::result::Result :::
///

/// [Result in std::result - Rust](https://doc.rust-lang.org/std/result/enum.Result.html)

fn is_successful(arg: &str) -> Result<u8, u8> {
  match arg {
    "ok" => Ok(0),
    _    => Err(1),
  }
}

fn main( ) -> ( ) {

  let r_1: Result<u8, u8> = is_successful("ok");
  let r_2: Result<u8, u8> = is_successful("error");

  println!("r_1: {0}\nr_2: {1}", r_1.unwrap(), r_2.unwrap_err());

  return ( );
}
