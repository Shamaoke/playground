
///
/// ::: Lifetime :::
///

use std::any::type_name;

fn type_of<T>(_: T) -> String { String::from(type_name::<T>()) }

fn main( ) {

  let s = String::from("ok!");
  let r;

  {
    let t = &s; // t -> &s
    r = &t; // r -> &(t -> s)
    // r = t; // r = t -> s
    println!("type_of(t) -> {}", type_of(t)); //=> `type_of(t) -> &alloc::string::String`
    // println!("typeof(r = t) -> {}", type_of(r));  //=> `type_of(r) -> &alloc::string::String`
    println!("typeof(r = &t) -> {}", type_of(r));  //=> `type_of(r) -> &&alloc::string::String`
  }

  // println!("{r}"); //=> `ok!`
}

