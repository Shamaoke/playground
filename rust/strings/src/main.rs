
///
/// ::: Strings :::
///

fn main( ) {

  let s = "\
    GET /greeting HTTP/1.1\r\n\
    Host: localhost:3344\r\n\
    User-Agent: curl/8.9.1\r\n\
    Accept: */*\r\n

  ";

  println!("{s}");
}

