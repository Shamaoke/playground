
///
/// ::: TCP Client :::
///

use std::env::{ args };
use std::str::FromStr;
use std::net::{ TcpStream, SocketAddr };

fn main( ) {

  let port = u16::from_str(&args().nth(1).unwrap()).unwrap();

  // println!("{}", u16::from_str(&args().nth(1).unwrap()).unwrap())

  // for arg in args() { println!("{}"); }

  let socket = SocketAddr::from(([127, 0, 0, 1], port));

  // let _stream = TcpStream::connect(socket).unwrap();

  if let Ok(_stream) = TcpStream::connect(socket) {
    println!("Connected to the server!");
  } else {
    println!("Couldn't connect to server...");
  }
}

