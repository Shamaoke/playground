
///
/// ::: Deref :::
///

///
/// Details
/// -------
///
/// • [Deref in std::ops - Rust](https://doc.rust-lang.org/std/ops/trait.Deref.html)
///
/// • [Explaining Rust's Deref trait - timClicks (Tim McNamara)](https://timclicks.dev/explaining-rusts-deref-trait/)
///
/// • [Boxes, Heaps, and Stacks - Tim McNamara - Rust Linz, September 2022 - YouTube](https://www.youtube.com/watch?v=DEE1GKMbtgw)
///
/// 1) Rust provides “auto-deref” behavior for _method calls_, which means that a)
///    there are fewer asterisks in your code made than you might expect if
///    you’re from a language where they’re all explicit...
///
/// 2) Dereferencing means accessing the data that’s referred to by a reference.
///
/// 3) Are references the same thing as borrows?
///
///    Almost, but not quite. In most cases, the terms borrows and references
///    can be used interchangeably.
///
///    Borrowing has a slightly stronger meaning however. It’s tied to Rust’s
///    ownership system. All borrows are references, but a reference is not
///    necessarily a borrow.
///
/// 4) Generally speaking, the dereference operator works by taking a reference
///    and returning what’s being referred to (known formally as the referent).
///
/// 5) There’s no requirement for the type that’s provided by dereferencing to
///    be the type that you started with [So, you can dereference to _any_ type.].
///
/// 6) The term “pointer type” can be somewhat off-putting. By this, I mean any
///    type which manages some backing data structure [The `Item` type in the
///    following example is what's called a “pointer type”, because it manages a
///    value of str/Val types.].
///
/// 7) Pointer types are essentially a gateway or interface to some inner type.
///    The Deref trait is the hook that library authors can use to provide the
///    desired functionality.
///
/// 8) The term “smart pointer” means a pointer type with added semantics, such
///    as reference counting. The canonical examples in the standard library are
///    `std::rc::Rc` and `std::sync::Arc`, which both provide shared ownership
///    via reference counting.
///
/// 9) Moreover, the dot operator — the one you use when you call a method —
///    implicitly dereferences self.
///

use std::ops::Deref;
use std::any::type_name;

#[allow(unused)]
fn type_of<T>(_: T) -> String { String::from(type_name::<T>()) }

// #[derive(Debug, Copy, Clone)]
// struct Val();
//
// #[derive(Debug, Copy, Clone)]
// struct Item {
//   val: Val
// }

#[derive(Debug, Copy, Clone)]
struct Item<'a> {
  val: &'a str
}

// impl<'a> Copy for Item<'a> { }
//
// impl<'a> Clone for Item<'a> { fn clone(&self) -> Self { *self } }

impl<'a> Deref for Item<'a> {

  type Target = &'a str;

  fn deref(&self) -> &Self::Target { &self.val }
}

// impl Deref for Item {
//
//   type Target = Val;
//
//   fn deref(&self) -> &Self::Target { &self.val }
// }

fn main( ) {

  let i = Item { val: "ok!" }; //=> `i` is the _referent_.
  // let j = &i; //=> `j` is a reference to `i`.
  // let k = *j; dbg!(k); //=> `k = Item { .. }`, `Item` is copied to `k`, because
  // there is still a reference to `i` — `j`. Thus, the traits `Copy` and `Clone`
  // should be implemented for Item.
  // let l: &str = **j; dbg!(l); //=> `l = "ok!"`. Since the type of `l` is forced
  // to be `&str` and the `Deref` trait has been implemented for `Item`,
  // the `Item` is coerced to `&str`.
  // let m = &**j; dbg!(m); //=> `m = "ok!"`
  // let n = &*j; dbg!(n); //=> `n = Item { ... }`
  let len = i.len(); dbg!(len); //=> `len = 3`. The `len` method is called not
  // on the `Item` itself, but on the value it contains, because  method calls
  // automatically dereference values of the types which implement the `Deref`
  // trait. So, `i.len() == (*i).len()`.

  // let i = Item { val: Val() };
  // let j = &i;
  // let k = **j; dbg!(k);

  // let i = Item { val: "ok!" }; // dbg!(&i, type_of(&i));
  // let j = &i; // dbg!(&j, type_of(&j));
  // let k = &*i; println!("{:?}", k);

  // let i = Item { val: "ok!" };
  // let j: &str = &i; //=> `j = "ok!"`
  // let j = &*i; //=> `j = "ok!"`
  // let j = &i; //=> `j = Item { val: "ok!" }`
  // let j = i; //=> `j = Item { val: "ok!" }`
  //
  // dbg!(j);

  // let s = String::from("ok!");
  // let r = &s; //=> `r = "ok!"`
  // dbg!(r);
  // dbg!(s);

  // let a = 1;  dbg!(a, type_of(a));
  // let b = &a; dbg!(b, type_of(b));
  // let c = *b; dbg!(c, type_of(c));

}

