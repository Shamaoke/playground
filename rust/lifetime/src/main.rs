
//
// ::: Lifetime :::
//

#![allow(unused)]

use std::any::type_name;

// struct S(String);
//
// fn type_of<T>(_: T) -> String { String::from(type_name::<T>()) }
//
// // target lifetime
// //   | input lifetime
// //   |       | output lifetime
// //   |       |         |
// fn f<'a>(a: &'a S) -> &'a S { a }

// #[derive(Debug, Clone, Copy)]
#[derive(Debug, Clone)]
struct S { }

impl Drop for S {

  fn drop(&mut self) {
    println!("S was dropped");
    let _ = self;
  }
}

// fn f<'a>(a: &'a u8, b: &'a u8) -> &'a u8 { a }

fn f(s: S) -> S {
  // declare s;
  // let s = @1;
  // return s;
  // drop s;

  s
}

fn main( ) {

  let s = S { };

  let s = f(s);

  dbg!(s);

  // let n = S { };
  // // let n = 4;
  // let r;

  // {
  //   let m = n.clone();
  //   r = m;
  // }

  // dbg!(n);

  // let l = 1;
  // let n = &l; // n -> l
  // let r;

  // {
  //   let m = &n; // m -> (n -> l) ~> m -> l
  //   r = f(n, m);
  // }

  // println!("{}", r);

  // let n = 1;
  // let r;

  // {
  //   let m = &n;
  //   r = m;
  // }

  // println!("{}", r);

  // let n = 1;
  // let r;
  // {
  //     let m = 2;
  //     r = f(&n, &m);
  // }
  // println!("{}", r);
  //
  // let n = &4;
  // let r;
  //
  // {
  //   let m = &5;
  //   r = f(n, m);
  // }
  //
  // println!("{}", r);

  // 1.
  // let s;
  //
  // {
  //   let r = S("ok!".to_owned());
  //   s = &r; // `s` and `r` lifetimes ended here
  // }

  // 2.
  // let s;
  //
  // {
  //   let r = S("ok".to_owned());
  //   s = &r; // `r` lifetime ended here
  // }
  //
  // let t = s; // `s` lifetime ended here

  // let s = S(String::from("ok!"));
  // let r;

  // {
  //   let s = S(String::from("ok too!")); // `s` shadows the `s` from the outer scope
  //   r = id(&s); // Here `s` is &S { 0: String::from("ok too!") } because of the aformentioned.
  // }

  // println!("outer: {}", r.0);

  // let s = String::from("ok!");
  // let r;

  // {
  //   let t = &s; // t -> &s
  //   r = &t; // r -> &(t -> s)
  //   // r = t; // r = t -> s ~> r = s
  //   println!("type_of(t) -> {}", type_of(t)); //=> `type_of(t) -> &alloc::string::String`
  //   // println!("typeof(r = t) -> {}", type_of(r));  //=> `type_of(r) -> &alloc::string::String`
  //   println!("typeof(r = &t) -> {}", type_of(r));  //=> `type_of(r) -> &&alloc::string::String`
  // }

  // println!("{r}"); //=> `ok!`
}

