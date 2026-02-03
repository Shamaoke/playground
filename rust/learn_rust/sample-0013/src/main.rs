
mod my {
  pub fn get_str<'a>( ) -> &'a str {

    let s = "ok!";

    &s
  }
}

fn main() {

  let str = my::get_str( );

  let s = String::from(str);

  println!("s: {s}");
}

