
//
// ::: CubeSat :::
//

#![allow(unused)]

#[derive(Debug)]
struct CubeSat {
  id: u64,
  mailbox: Mailbox,
}

impl CubeSat {
  fn recv(&mut self) -> Option<Message> {
    self.mailbox.messages.pop()
  }
}

#[derive(Debug)]
struct Mailbox {
  messages: Vec<Message>
}

type Message = String;

#[derive(Debug)]
enum StatusMessage {
  Ok
}

struct GroundStation;

impl GroundStation {
  fn send(&self, to: &mut CubeSat, msg: Message) {
    to.mailbox.messages.push(msg);
  }
}

fn check_status(sat_id: CubeSat) -> CubeSat {
  println!("{:?}: {:?}", sat_id, StatusMessage::Ok);
  sat_id
}

fn main( ) {

  let gr_st = GroundStation { };

  let mut sat_a = CubeSat {
    id: 0,
    mailbox: Mailbox { messages: vec![ ] },
  };

  // println!("t0: {:?}", sat_a);

  dbg!(&sat_a);

  gr_st.send(&mut sat_a, Message::from("ok!"));

  // println!("t1: {:?}", sat_a);

  dbg!(&sat_a);

  let msg = sat_a.recv();

  dbg!(&sat_a);
  dbg!(&msg);

  // println!("t2: {:?}", sat_a);

  // println!("msg: {:?}", msg);

  // let sat_a = CubeSat { id: 0 };
  // let sat_b = CubeSat { id: 1 };
  // let sat_c = CubeSat { id: 2 };

  // let sat_a = check_status(sat_a);
  // let sat_b = check_status(sat_b);
  // let sat_c = check_status(sat_c);

  // let sat_a = check_status(sat_a);
  // let sat_b = check_status(sat_b);
  // let sat_c = check_status(sat_c);
}

