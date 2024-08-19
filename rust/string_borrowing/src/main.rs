
///
/// ::: String borrowing :::
///

#[allow(dead_code)]
fn first( ) -> () {

  let one: &str = "ok!";
  let one_prime: &str = one;

  println!("one = {0}\none_prime = {1}", one, one_prime);

  return ();
}

#[allow(dead_code)]
fn second( ) -> () {

  let greeting: &str = "Hello!";

  let gr_1: String = String::from(greeting);
  let gr_2: String = gr_1;

  // println!("gr_1 = {0}\ngr_2 = {1}", gr_1, gr_2); //=> gr_1 was marked as `uninit` after moving
  println!("gr_1 = {0}\ngr_2 = {1}", String::from("moved"), gr_2);

  return ();
}

#[allow(dead_code)]
fn third( ) -> () {

  let greeting: &str = "Hello!";

  let gr_1: String = String::from(greeting);
  let gr_2: String = String::from(greeting);

  println!("gr_1 = {0}\ngr_2 = {1}", gr_1, gr_2);

  return ();
}

fn add_address(mut address: String, postal_code: Option<&str>) -> String {
  address.push_str(postal_code.unwrap_or(""));
  address
}

macro_rules! add_address {
  ($address: expr) => { add_address($address, None) };
  ($address: expr, $delim: expr) => { add_address($address, $delim) };
}

fn main( ) -> () {

  first();
  // second();
  // third();

  let address: String = String::from("Kolomna, Dobrolyubova 10a, 51");
  let postal_code: &str = "140411";

  println!("{}", add_address!(address, Some(postal_code)));

  // println!("{}", address); //=> address was marked as `uninit` after moving the ownershit of it to the `add_address` function

  return ();
}

