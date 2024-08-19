
///
/// ::: Book ISBN :::
///

struct Book {
  title: String,
  isbn:  Option<String>
}

fn main( ) -> () {

  let book_1 = Book {
    title: "Rust web development".to_string(),
    isbn:  Some(String::from("1-234-567"))
  };

  let book_2 = Book {
    title: "The Rust programming language".to_string(),
    isbn:  None
  };

  match book_1.isbn {
    Some(value) => println!("The ISBN of \"{0}\" is \"{1}\".", book_1.title, value),
    None => println!("The book \"{0}\" doesn't have an ISBN.", book_1.title)
  }

  match book_2.isbn {
    Some(value) => println!("The ISBN of \"{0}\" is \"{1}\".", book_2.title, value),
    None => println!("The book \"{0}\" doesn't have an ISBN.", book_2.title)
  }

  return ();
}

