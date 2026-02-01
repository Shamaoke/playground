
mod my {

  pub fn get_length(s: String) -> (String, usize) {

    let l = s.len();

    (s, l)
  }
}

fn main() {

  let s = String::from("ok!");

  let (s, l) = my::get_length(s);

  println!("The lengh of \"{s}\" is {l}.");
}

