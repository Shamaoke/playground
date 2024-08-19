
///
/// ::: Article :::
///

// use crate::summary::Summary;
use crate::timestamp::Timestamp;

pub struct Article {
  author: String,
  headline: String,
  content: String,
}

impl Article {
  pub fn new(author: String, headline: String, content: String) -> Self {
    Article { author: author, headline: headline, content: content }
  }

  pub fn author(&self) -> &String { &self.author }
  pub fn headline(&self) -> &String { &self.headline }
  pub fn content(&self) -> &String { &self.content }
}

// impl Summary for Article {
//   fn summarize(&self) -> String {
//     format!("{0} by {1}\n{2}\nat {3}", self.headline, self.author, self.content, self.timestamp())
//   }
// }

impl Timestamp for Article { }

