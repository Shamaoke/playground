
///
/// ::: Closures :::
///

use std::any::type_name;

#[allow(unused)]
fn type_of<T>(_: T) -> String { String::from(type_name::<T>()) }

fn main( ) {

  // 1. Closures, unlike functions, can capture the environment in which they were defined.
  // let n = 3i8;
  // // fn f( ) -> i8 { n } //=> error[E0434]: can't capture dynamic environment in a fn item
  // let f = | | -> i8 { n };

  // 2. To be able to infer the type of a closure the closure should be used somewhere.
  // let f = |n| n + 1; //~> error[E0284]: type annotations needed
  // Use either `let f = |n: i32| -> i32 { n + 1 };` or `let f = |n| n + 1; f(4);`

  // 3. The type of a closure is infered when the closure is used the first time.
  // let id = |e| e;
  // id("id");
  // id(4); //~> error[E0308]: mismatched types

  // 4. Closures can capture values from their environment either by borrowing
  // them or by moving the owenership of them.
  //
  // When a closure doesn't mutate a value which it captures — the value is captured
  // as immutable borrow.
  //  let nums = vec![1, 2, 3, 4];
  //  let f = | | nums;
  //
  // When a closure does mutate a value which it captures — the value is captured
  // as mutable borrow.
  // let mut nums = vec![1, 2, 3, 4];
  // let f = | | nums.push(5);

  // To force a closure to take an owenership of a capture — use the `move` operator
  // before the closure definition.
  // let mut nums = vec![1, 2, 3, 4];
  // let f = move | | nums.push(5);

  // 5. When a closure captures a value and then is used as a body of a new thread,
  // the captured value should be _moved_ to the closure, because in the case of
  // a borrowing the new thread may outlive the main one and the value borrowed
  // can be dropped.
  //
  // Example 1
  // ---------
  // use std::thread;
  //
  // let nums = vec![1, 2, 3, 4];
  //
  // let f = | | println!("{:?}", nums); //~> error[E0373]: closure may outlive the
  //                                     //current function, but it borrows `nums`,
  //                                     //which is owned by the current function
  //
  // let f = move | | println!("{:?}", nums);
  //
  // thread::spawn(f).join().unwrap()
  //
  // Example 2
  // ---------
  // use std::thread;
  //
  // let nums = vec![1, 2, 3, 4];
  //
  // let f = move | | println!("{0}: {1:?}", thread::current().name().unwrap(), nums);
  // let g = f.clone();
  //
  // // let t1 = thread::spawn(f);
  // // let t2 = thread::spawn(g);
  //
  // // let _r = t1.join();
  // // t2.join().unwrap();
  //
  // let t1 = thread::Builder::new().name(String::from("t1")).spawn(f);
  // let t2 = thread::Builder::new().name(String::from("t2")).spawn(g);
  //
  // let _r = t1.unwrap().join();
  // t2.unwrap().join().unwrap();

  // 6. A closure can do the following things with the external environment:
  // • Move the captured value — implements the [`FnOnce`][1] trait;
  // • Mutate the captured value — implements the [`FnMut`][2] trait;
  // • Nither move nor mutate the captured value — implements the [`Fn`][3] trait;
  // • Capture nothing — also implements the [`Fn`][4] trait.
  //
  // [1]: https://doc.rust-lang.org/std/ops/trait.FnOnce.html
  // [2]: https://doc.rust-lang.org/std/ops/trait.FnMut.html
  // [3]: https://doc.rust-lang.org/std/ops/trait.Fn.html
  // [4]: https://doc.rust-lang.org/std/ops/trait.Fn.html

  //
  // fn do_once<F, T>(f: F) -> T
  //   where F: FnOnce( ) -> T
  // {
  //   // f(); f() //~> error[E0382]: use of moved value: `f`
  //
  //   f()
  // }
  //
  // struct S { val: String }
  //
  // let mut v = Vec::<S>::new();
  //
  // let s = S { val: String::from("val") };
  //
  // let f = | | v.push(s);
  //
  // f(); f(); //~> error[E0382]: use of moved value: `f`
  //
  // do_once(f); do_once(f); //~> error[E0382]: use of moved value: `f`
  //

  //
  // fn do_many<F, T>(f: F) -> T
  //   where F: Fn( ) -> T
  // {
  //   f(); f()
  // }
  //
  // let mut v = vec![1, 2, 3];
  // let f = | | v.push(4); //~> error[E0525]: expected a closure that implements
  // the `Fn` trait, but this closure only implements `FnMut`
  // let f = | | v; //~> error[E0525]: expected a closure that implements the `Fn`
  // trait, but this closure only implements `FnOnce`
  // let f = | | &v.push(4); //~> error[E0525]: expected a closure that implements
  // the `Fn` trait, but this closure only implements `FnMut`
  //
  // let f = | | &v; //=> ok
  // let f = | | vec![1, 2, 3]; //=> ok
  //
  // do_many(f);
  //
  // let f = | | vec![1, 2, 3];
  //
  // do_many(f); // the `f` value is moved here to the `do_many` context.
  // do_many(f); // No error occurs, because the <Closure> type implements the
  // `Copy` trait.
  //

  //
  // fn do_many_mut<F, T>(mut f: F) -> T
  //   where F: FnMut( ) -> T
  // {
  //   f(); f()
  // }
  //
  // let mut v = vec![1, 2, 3];
  //
  // let f = | | v.push(4);
  //
  // let mut g = f;
  //
  // do_many_mut(f);
  // do_many_mut(f);
  //

  // struct S { val: String }
  // let mut v = Vec::<S>::new();
  // let mut f = | | v.push(S { val: String::from("val") });
  // f();
  // f();

  // #[derive(Clone)]
  // struct S { val: String }
  // let s = S { val: String::from("val") };
  // let mut v = Vec::<S>::new();
  // let mut f = | | v.push(s.clone());
  // f();
  // f();

  // #[derive(Debug)]
  // struct S { val: String }
  // let s = S { val: String::from("val") };
  // let mut v = Vec::<&S>::new();
  // let mut f = | | v.push(&s);
  // f();
  // f();
  // dbg!(v);

  // #[derive(Debug)]
  // struct S { val: String }
  // let s = S { val: String::from("val") };
  // let mut v = Vec::<S>::new();
  // let f = move | | v.push(s);
  // let f = move | | { v.push(s); v };
  // let mut v = f();
  // dbg!(v);
  //
  // dbg!(v); //~> error[0382]: use of moved value `v`
  // dbg!(s); //~> error[0382]: use of moved value `s`

  // [Closure types - The Rust Reference](https://doc.rust-lang.org/reference/types/closure.html)
}

