
///
/// ::: Tweet :::
///

// use crate::summary::Summary;
use crate::timestamp::Timestamp;

pub struct Tweet {
  username: String,
  content: String,
}

impl Tweet {
  pub fn new(username: String, content: String) -> Self {
    Tweet { username: username, content: content }
  }

  pub fn username(&self) -> &String { &self.username }
  pub fn content(&self) -> &String { &self.content }
}

// impl Summary for Tweet {
//   fn summarize(&self) -> String {
//     format!("{0}: {1}\nat {2}", self.username, self.content, self.timestamp())
//   }
// }

impl Timestamp for Tweet { }

