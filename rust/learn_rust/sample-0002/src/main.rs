
use std::io::stdin;

fn main() {

  let mut input = String::new();

  match stdin().read_line(&mut input) {
    Ok(n)  => println!("{n} bytes read\nInput is `{input}`."),
    Err(e) => println!("Error: {e}"),
  }
}

