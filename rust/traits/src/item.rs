
///
/// ::: Item :::
///

use crate::tweet::Tweet;
use crate::article::Article;
use crate::timestamp::Timestamp;

pub struct Item<T> {
  item: T
}

impl<T> Item<T> {
  pub fn new(item: T) -> Self {
    Item { item: item }
  }
}

impl Item<Tweet> {
  pub fn display(&self) {
    println!(
      "{0}: {1}\nat {2}",
      self.item.username(),
      self.item.content(),
      self.item.timestamp(),
    );
  }
}

impl Item<Article> {
  pub fn display(&self) {
    println!(
      "{0} by {1}\n{2}\nat {3}",
      self.item.headline(),
      self.item.author(),
      self.item.content(),
      self.item.timestamp(),
    );
  }
}

