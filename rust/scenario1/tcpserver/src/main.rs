
///
/// ::: TCP Server :::
///

use std::net::{ TcpListener, TcpStream, SocketAddr };
use std::io::{ Error, Read, Write };
// use std::io::{ Error, Read };
// use std::io::{ Error, Write };

#[allow(unused)]
fn handle_connection(stream: Result<TcpStream, Error>) {

  // let _stream = stream.unwrap();
  let mut stream = stream.unwrap();
  // let msg = "ok!".as_bytes();
  // let msg = b"ok!";
  let mut buffer = [0; 1024];

  // stream.write(&msg).unwrap();
  // stream.write(msg).unwrap();

  stream.read(&mut buffer).unwrap();
  // stream.write(&mut buffer).unwrap();

  let request = std::str::from_utf8(&mut buffer).unwrap();

  println!("request: {}", request);

  // let response = b"I'm OK!";
  // let response = "I'm OK!";
  // let response = "Я в проядке!";
  let response = "大丈夫だよ！";

  stream.write(response.as_bytes()).unwrap();
}

fn main( ) {

  // let socket = SocketAddr::from(([127, 0, 0, 1], 4433));

  let socket = SocketAddr::from(([127, 0, 0, 1], 0));

  let listener = TcpListener::bind(socket).unwrap();

  println!("Running on port {}", listener.local_addr().unwrap().port());

  // for stream in listener.incoming() { handle_connection(stream); }

  // listener.incoming().for_each(handle_connection);

  loop {
    match listener.accept() {
      Ok((mut stream, _)) => {
        let mut buffer = [0; 1024];
        stream.read(&mut buffer).unwrap();
        let request = std::str::from_utf8(&mut buffer).unwrap();
        println!("request: {}", request);
        let response = "大丈夫だよ！";
        stream.write(response.as_bytes()).unwrap();
      },
      Err(e) => println!("Couldn't get client: {e:?}"),
    }
  }
}

