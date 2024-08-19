
///
/// ::: Generics :::
///

//fn main( ) {
//
//  let numbers = vec![32, 36, 40, 44];
//
//  let largest_number = &numbers[0];
//
//  println!("largest_number = {largest_number}");
//
//}

//struct Sample {
//  name: &'static str
//}
//
//fn main( ) {
//
//  let s1 = Sample { name: "one" };
//  let s2 = Sample { name: "two" };
//  let s3 = Sample { name: "three" };
//
//  // let ss = vec![&s1, &s2, &s3];
//  let ss = vec![s1, s2, s3];
//
//  for s in &ss {
//    println!("{}", s.name);
//  }
//
//  let s11 = ss[0];
//
//  println!("{}", s11.name);
//
//  // println!("{}", ss[0].name); //=> error[E0507]: cannot move out of index of `Vec<Sample>`
//
//}

///// A number of useful functions to make our work easier
//pub mod util {
//
//  /// Find the largest number in a list
//  pub fn largest(list: &[i32]) -> &i32 {
//
//    let mut largest = &list[0];
//
//    for e in list {
//      if e.gt(&largest) { largest = e; }
//      // [PartialOrd in std::cmp - Rust | method.gt](https://doc.rust-lang.org/std/cmp/trait.PartialOrd.html#method.gt)
//    }
//
//    largest
//  }
//}
//
//fn main( ) {
//
//  let ns = vec![1, 4, 3, 2];
//
//  let nss = &ns[2..4];
//
//  println!("The largest number in {0:?} is {1}.", nss, util::largest(nss));
//}

///// A number of utility functions to make our work easier
//pub mod util {
//
//  /// Find the largest number in a list
//  pub fn largest<T: PartialOrd>(list: &[T]) -> &T {
//    // <T: PartialOrder> means, that the body of the function will work only for
//    // types that implement the `PartialOrder` trait. That restriction exists
//    // because the types that do not implement the trait many not have the `gt`
//    // method.
//
//    let mut largest = &list[0];
//
//    for e in list { if e.gt(largest) { largest = e } }
//
//    largest
//  }
//}
//
//fn main( ) {
//
//  let ns = vec![1, 4, 3, 2];
//
//  let ms = vec![0xff_u8, 0xcc_u8, 0x00_u8];
//
//  println!("The largest number in {0:?} is {1}", &ns, util::largest(&ns));
//  println!("The largest number in {0:?} is {1}", &ms, util::largest(&ms));
//}

struct Point<T, U> {
  x: T,
  y: U,
}

impl<T, U> Point<T, U> {
// Here, `T` and `U` in `impl` specifies generic types and `T` and `U` in `Point`
// specifies _concrete_ types, which will be obtained from `impl`.

  fn x(&self) -> &T {
    &self.x
  }

  fn y(&self) -> &U {
    &self.y
  }

  fn xy(&self) -> (&T, &U) {
    (&self.x, &self.y)
  }
}

impl Point<f32, f32> {
  fn distance_from_origin(&self) -> f32 {
    (self.x.powi(2) + self.y.powi(2)).sqrt()
  }
}

fn main( ) {

  let  p1 = Point { x: 1, y: 1.0 }; //=> Point<i32, f32>
  let _p2 = Point { x: 1, y: 1 }; //=> Point<i32, i32>
  let  p3 = Point { x: 1.0, y: 1.0 }; //=> Point<f32, f32>

  println!("p1.x = {}", p1.x());
  println!("p1.y = {}", p1.y());
  println!("(p1.x, p1.y) = {:?}", p1.xy());
  println!("p3's point from origin is {}", p3.distance_from_origin());

}

