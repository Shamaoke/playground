
//! An example program showing the usage of associated functions

#[cfg(test)]
mod test {
  use super::my::Rectangle;

  #[test]
  fn test_0001( ) {
    let square = Rectangle::square(22);

    let actual = square.width;
    let expected = square.height;

    assert_eq!(actual, expected, "It is expected that {0} is equal to {1}", actual, expected);
  }
}

#[allow(dead_code)]
mod my {
  pub struct Rectangle {
    pub width: u32,
    pub height: u32,
  }

  impl Rectangle {
    pub fn square(size: u32) -> Self {
      Self {
        width: size,
        height: size,
      }
    }
  }
}

fn main( ) { }

