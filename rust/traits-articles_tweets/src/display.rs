
///
/// ::: Display :::
///

use crate::summary::Summary;
use crate::timestamp::Timestamp;

pub fn display_new<T>(item: &T)
where
  T: Summary + Timestamp
{
  println!("New! {}", item.summarize());
}

pub fn display(item: &(impl Summary + Timestamp)) { println!("{}", item.summarize()); }

