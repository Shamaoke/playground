
use std::io::stdin;

fn main() {

  let c = [1, 2, 3, 4];

  loop {

    let mut i = String::new();

    stdin().read_line(&mut i).expect("Failed to read the line");

    let i: usize = match i.trim().parse() {

      Ok(n) if n > c.len() - 1 => {
        println!("n > 3, continue");
        continue;
      },

      Ok(n) => n,

      Err(_) => {
        println!("n is not a valid value, continue");
        continue;
      },
    };

    let e = c[i];

    println!("e = { }", e);
  }
}

