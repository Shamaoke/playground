
///
/// ::: std::option::Option :::
///

/// [Option in std::option - Rust](https://doc.rust-lang.org/std/option/enum.Option.html)

use std::fmt::{Display, Formatter};

struct Setting {
  name: &'static str,
  value: &'static str,
}

impl Display for Setting {
  fn fmt(&self, f: &mut Formatter) -> std::fmt::Result {
    write!(f, "{0}: {1}", self.name, self.value)
  }
}

fn is_set(setting: &Setting) -> Option<&str> {
  match setting {
    Setting { name: "debug", value: "on" }  => Some("on"),
    Setting { name: "debug", value: "off" } => Some("off"),
    _ => None,
  }
}

fn main( ) -> ( ) {

  let debug_on    = Setting { name: "debug", value: "on" };
  let debug_off   = Setting { name: "debug", value: "off" };
  let debug_unset = Setting { name: "", value: "" };

  println!("debug: {}", is_set(&debug_on).unwrap_or("unset"));
  println!("debug: {}", is_set(&debug_off).unwrap_or("unset"));
  println!("debug: {}", is_set(&debug_unset).unwrap_or("unset"));

  return ( );
}

