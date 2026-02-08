
//! An example program showing defining methods for instances of a struct

mod my {
  #[derive(Debug)]
  pub struct Rectangle {
    pub width: u32,
    pub height: u32,
  }

  impl Rectangle {

    #[allow(dead_code)]
    pub fn area(&self) -> u32 {
      self.width * self.height
    }
    // is the same as
    // pub fn area(self: &Self) -> u32 {
    //   self.width * self.height
    // }
  }

  impl Default for Rectangle {
    fn default() -> Self {
      Self {
        width: 10,
        height: 20,
      }
    }
  }
}

fn main() {

  use my::Rectangle;

  // let width = 66;
  // let height = 99;
  //
  // let rectangle = Rectangle { width, height };
  //
  // println!(
  //   "widht: {0}\nheight: {1}\narea: {2}",
  //   rectangle.width,
  //   rectangle.height,
  //   rectangle.area(),
  // );
  //
  // dbg!(&rectangle);

  let rectangle2 = Rectangle { ..Default::default() };

  dbg!(&rectangle2);
}

