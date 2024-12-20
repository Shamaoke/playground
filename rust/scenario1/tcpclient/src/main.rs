
///
/// ::: TCP Client :::
///

use std::env::{ args };
use std::str::FromStr;
use std::net::{ TcpStream, SocketAddr };
use std::io::{ Read, Write };
// use std::io::{ Write };

fn main( ) {

  let port = u16::from_str(&args().nth(1).unwrap()).unwrap();

  // println!("{}", u16::from_str(&args().nth(1).unwrap()).unwrap())

  // for arg in args() { println!("{}"); }

  let socket = SocketAddr::from(([127, 0, 0, 1], port));

  // let _stream = TcpStream::connect(socket).unwrap();
  // let mut buffer = [0; 1024];

  if let Ok(mut stream) = TcpStream::connect(socket) {
    println!("Connected to the server");

    let mut buffer = [0; 1024];

    let request = b"Are you ok?";

    // stream.write(&mut buffer)
    stream.write(request).unwrap();
    stream.read(&mut buffer).unwrap();

    let response = std::str::from_utf8(&mut buffer).unwrap();

    println!("response: {}", response);

    // let size = stream.read(&mut buffer).unwrap();
    // let content = std::str::from_utf8(&buffer[..]).unwrap();
    // println!("size: {0}, content: {1}", size, content);

  } else {
    println!("Couldn't connect to server...");
  }
}

