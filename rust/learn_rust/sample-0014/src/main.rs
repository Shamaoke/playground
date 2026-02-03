
mod my {
  pub fn get_string( ) -> String {

    let s = String::from("ok!");

    s
  }
}

fn main() {

  let s = my::get_string( );

  println!("s: { }", s);
}

