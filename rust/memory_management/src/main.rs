
///
/// ::: Rust memory management :::
///

//
// struct Sample {
//   name: &'static str,
// }
//
// impl Drop for Sample {
//   fn drop(&mut self) {
//     println!("Dropping `{}`.", self.name);
//   }
// }
//
// fn main( ) {
//   { Sample { name: "sample" }; } //=> Dropping `sample`.
// }
//
// Details
// -------
// [Drop in std::ops - Rust](https://doc.rust-lang.org/std/ops/trait.Drop.html)
//

//
// #[derive(Debug)] allows `{s1:?}` to be used in println!
// #[derive(Debug, Copy)]
// #[derive(Debug, Copy, Clone)]
// struct Sample {
//   #[allow(dead_code)]
//   name: &'static str,
// }
//
// impl Sample {
//   fn inspect(&self) {
//     println!("{self:?}");
//   }
// }
//
// impl Copy for Sample { }
//
// impl Clone for Sample {
//   // fn clone(&self) -> Sample { *self }
//   fn clone(&self) -> Sample { self.inspect(); *self }
// }
//
// fn main( ) {
//
//   let s1 = Sample { name: "sample" };
//   let s2 = s1;
//   // let s2 = s1.clone();
//
//   // s1.inspect();
//   // s2.inspect();
//
//   println!("{s1:?}\n{s2:?}");
// }
//
// #[derive(Debug, Copy, Clone)]
// struct Sample {
//   #[allow(dead_code)]
//   name: &'static str,
// }
//
// fn inspect(t: Sample) {
//   println!("{t:?}");
// }
//
// fn main( ) {
//
//   let s = Sample { name: "sample" };
//
//   inspect(s);
//
//   println!("{s:?}");
// }
//
// Details
// -------
// • [Clone in std::clone - Rust](https://doc.rust-lang.org/std/clone/trait.Clone.html)
//
// • [Copy in std::marker - Rust](https://doc.rust-lang.org/std/marker/trait.Copy.html)
//

// #[derive(Debug)]
// struct Sample<'a> { // <'a> How to use!
//   name: &'a str
// }
//
// fn main( ) {
//
//   let s = Sample { name: "sample" };
//
//   println!("{s:?}");
// }

// #[derive(Debug)]
// struct Sample<'a> {
//   #[allow(dead_code)]
//   name: &'a str
// }
//
// fn inspect(t: &Sample) {
//   println!("{t:?}");
// }
//
// fn main( ) {
//   let s = &Sample { name: "sample" };
//
//   inspect(s);
//
//   println!("{s:?}");
// }

//
// fn main( ) {
//
//   let a = 5;
//   let b = a;
//
//   println!("a = {a}\nb = {b}");
// }
//

//
// #[derive(Debug, Copy, Clone)]
// struct Sample<'a> {
//   #[allow(dead_code)]
//   name: &'a str,
// }
//
// fn inspect<T: std::fmt::Debug>(v: T) {
//   println!("{v:?}");
// }
//
// fn main( ) {
//
//   let s = Sample { name: "sample" };
//
//   inspect(s);
//
//   println!("{s:?}"); //=> error[E0382]: borrow of moved value: `s`. The `Clone`
//                      //trait should be implemented for the type.
//
//   let n = 5;
//
//   inspect(n); //=> No error occurs. The `Clone` trait has built-in implementation
//               // for integer types.
//
//   println!("{n:?}");
// }
//

//
// fn main( ) {
//
//   let s_1 = String::from("ok!");
//
//   let s_2 = &s_1;
//
//   println!("s_1 = {s_1}\ns_2 = {s_2}");
// }
//

//
// fn main( ) {
//
//   let s_1 = &String::from("ok!");
//
//   let s_2 = &s_1;
//
//   println!("s_1 = {s_1}\ns_2 = {s_2}");
// }
//

//
// fn main( ) {
//
//   let mut s_1 = String::from("ok!");
//
//   s_1.push_str("\nok too!");
//
//   println!("{s_1}");
//
//   // let s_2 = &s_1;
//
//   // s_2.push_str("\nok too!");
//
//   // println!("s_1 = {s_1}\ns_2 = {s_2}");
// }
//

//
// fn main( ) {
//
//   let mut s_1 = String::from("ok!");
//
//   let s_2 = &mut s_1;
//
//   println!("{s_2}");
//
//   let s_3 = &mut s_1;
//
//   println!("{s_3}"); //=> No error.
//
//   // println!("s_2 = {s_2}\ns_3 = {s_3}"); //=> error[E0499]: cannot borrow
//   // `s_1` as mutable more than once at a time
// }
//

//
// fn main( ) {
//
//   let mut s_1 = String::from("ok!");
//
//   let s_2 = &s_1;
//
//   println!("s_2 = {s_2}");
//
//   let s_3 = &mut s_1;
//
//   println!("s_3 = {s_3}");
// }
//

//
// fn get_string( ) -> &String {
//
//   let s = String::from("ok!");
//
//   &s
// }
//
// fn main( ) {
//
//   let s = get_string();
//
//   println!("s = {s}");
// }
//

//
// fn main( ) {
//
//   let n = 5;
//   let m = n;
//
//   println!("n = {n}\nm = {m}");
//
//   let s = String::from("string");
//   let r = s;
//
//   // println!("s = {s}\nr = {r}"); //=> error[E0382]: borrow of moved value: `s`
//
// }
//

//
// fn main( ) {
//   let s = String::from("ok!");
//   let r = s.clone();
//
//   println!("s = {s}\nr = {r}");
// }
//

//
// fn main( ) {
//
//   let s = String::from("ok!");
//
//   let r = &s;
//
//   let t = &(*r); // == &s
// }
//

//
// fn main( ) {
//
//   let s = String::from("ok!");
//
//   // let r = &s;
//
//   let t = *s;
// }
//

//
// fn main( ) {
//
//   let mut v = vec!["ok!", "ok for!", "ok free!"];
//
//   let vs = &mut v[..];
//
//   vs[1] = "ok too!";
//
//   println!("{v:?}");
//
// }
//
// fn main( ) {
//
//   let s = String::from("ありがとう");
//
//   let ss = &s[0..3];
//
//   println!("{ss}");
//
// }
//
//
// fn main( ) {
//
//   let v_1 = vec!["ok!", "ok too!", "ok free!"];
//
//   let mut v_2 = Vec::from(&v_1[..2]);
//
//   v_2.push("ok sex!");
//
//   println!("v_1 = {v_1:?}\nv_2 = {v_2:?}");
//
// }
//
// fn main( ) {
//
//   let s = String::from("ok!");
//
//   let r = &s;
//
//   let t = *r;
//
//   println!("t = {t}");
//
// }
//
// Details
// -------
//
// [slice - Rust](https://doc.rust-lang.org/std/primitive.slice.html)
//

  // { let s1 = Sample;
  //   let s2 = s1;
  //
  //   println!("{s1:?}"); // error[E0382]: borrow of moved value: `s1` }

  // { let s = String::from("ok!");
  //   let r = &s;

  //   println!("{r}");
  //   println!("{s}"); }

  // let s = String::from("ok!");
  // let r = s; //=> The `s` value was moved to `r`. Now `s` doesn't refer to anything.

  // println!("{r}");
  // println!("{s}"); //=> error[E0382]: borrow of moved value: `s`

  // let string: &String = &String::from("ok!");

  // println!("{}", string); //=> (`string`) not found in this scope

  // {
  //   println!("{}", string); //=> (`string`) not found in this scope

  //   let string: &str = "ok!"; //=> Here, `string` comes into the scope.

  //   println!("{}", string);
  // } //=> Here, `string` goes out of scope.

  // println!("{}", string); //=> (`string`) not found in this scope


  // { let string: String = String::from("ok!");

  //   println!("{string}");
  // }

  // println!("{string}"); //=> (`string`) not found in this scope


  // let mut one: String = String::from("ok!");
  // let mut two: String = String::from("ok too!");
  // let mut del: String = String::from("\n");

  // let result: String = format!("{one}{del}{two}");

  // println!("{result}");

  // string.push_str("\n");
  // string.push_str("ok too!");

  // println!("{string}");

