
//! An example program showing the usage of tests

#[cfg(test)]
mod tests {

  use super::my::Rectangle;

  #[test]
  fn test_0001( ) {
    let r1 = Rectangle { width: 99, height: 66 };
    let r2 = Rectangle { width: 22, height: 11 };

    let actual = r1.is_hold(&r2);
    let expected = true;

    assert_eq!(actual, expected, "It is expected that {0} is {1}", actual, expected);
  }

  #[test]
  fn test_0002( ) {
    let r1 = Rectangle { width: 99, height: 66 };
    let r2 = Rectangle { width: 111, height: 222 };

    let actual = r1.is_hold(&r2);
    let expected = true;

    assert_ne!(actual, expected, "It is not expected that {0} is {1}", actual, expected);
  }
}

#[allow(dead_code)]
mod my {
  pub struct Rectangle {
    pub width: u32,
    pub height: u32,
  }

  impl Rectangle {
    pub fn is_hold(&self, other: &Rectangle) -> bool {
      self.width > other.width && self.height > other.height
    }
  }
}

fn main( ) { }

