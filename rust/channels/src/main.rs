
///
/// ::: Channels :::
///

use std::thread;
use std::sync::mpsc::sync_channel;
use std::time::Duration;

fn main( ) {

  #![allow(unused_labels)]

  let (s, r) = sync_channel::<&str>(1);

  s.send("ok!").unwrap();

  'res: { let res = r.recv_timeout(Duration::from_secs(4)).unwrap();

  println!("{res}"); }

  thread::sleep(Duration::from_secs(10));

  s.send("ok too!").unwrap();

  let res = r.recv_timeout(Duration::from_secs(4)).unwrap();

  println!("{res}");
}

