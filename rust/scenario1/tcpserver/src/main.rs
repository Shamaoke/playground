
///
/// ::: TCP Server :::
///

use std::net::{ TcpListener, TcpStream, SocketAddr };
// use std::io::{ Error, Read, Write };
use std::io::{ Error, Write };

fn handle_connection(stream: Result<TcpStream, Error>) {

  // let _stream = stream.unwrap();
  let mut stream = stream.unwrap();
  let msg = "ok!".as_bytes();
  // let mut buffer = [0; 1024];

  println!("Connection established");

  stream.write(&msg).unwrap();

  // stream.read(&mut buffer).unwrap();
  // stream.write(&mut buffer).unwrap();
}

fn main( ) {

  // let socket = SocketAddr::from(([127, 0, 0, 1], 4433));

  let socket = SocketAddr::from(([127, 0, 0, 1], 0));

  let listener = TcpListener::bind(socket).unwrap();

  println!("Running on port {}", listener.local_addr().unwrap().port());

  // for stream in listener.incoming() { handle_connection(stream); }

  listener.incoming().for_each(handle_connection);
}

