
mod my {
  pub fn get_len(s: &String) -> usize { s.len() }
}

fn main() {

  let s = String::from("ok!");
  let l = my::get_len(&s);

  println!("The length of \"{s}\" is {l}.");
}

