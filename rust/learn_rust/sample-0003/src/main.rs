
//
// Run with `cargo run && bat -p|--plain ~/.desktop/data.txt`.
//

use std::fs::File;
use std::io::prelude::Write;

fn main() {

  let path = "/home/user/.desktop/data.txt";
  let content = b"ok!\nok too!\nok free!";

  let mut file = File::create(&path).unwrap();

  // file.write_all(content).expect("There was an error writing to file path");
  //
  // or
  let _ = file.write_all(content);
}

