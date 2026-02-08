
//! An example program showing the implementation of the [`Deref`][0] trait and the usage of values of types which implement it
//!
//! [0]: https://doc.rust-lang.org/std/ops/trait.Deref.html

/// My module
mod my {

  use std::ops::Deref;

  /// A type which represents a string of characters
  pub struct String<'a> {
    pub data: &'a str,
  }

  impl<'a> Deref for String<'a> {

    type Target = str;

    fn deref(&self) -> &str { self.data }
  }
}

fn print(str: &str) { println!("{str}"); }

fn main( ) {

  let s = my::String { data: "ok! ok too!" };

  print(&s);
  print(&s[..4]);
  print(&s[4..]);
}

