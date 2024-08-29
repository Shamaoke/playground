
///
/// ::: TCP Server :::
///

use std::net::{ TcpListener, TcpStream, SocketAddr };
use std::io::{ Error };

fn handle_connection(stream: Result<TcpStream, Error>) {
  let _stream = stream.unwrap();
  println!("Connection established");
}

fn main( ) {

  // let socket = SocketAddr::from(([127, 0, 0, 1], 4433));

  let socket = SocketAddr::from(([127, 0, 0, 1], 0));

  let listener = TcpListener::bind(socket).unwrap();

  println!("Running on port {}", listener.local_addr().unwrap().port());

  // for stream in listener.incoming() { handle_connection(stream); }

  listener.incoming().for_each(handle_connection);
}

