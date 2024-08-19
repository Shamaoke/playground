
///
/// ::: Timestamp :::
///

use chrono::{DateTime, Utc};

pub trait Timestamp {
  fn timestamp(&self) -> DateTime<Utc> {
    Utc::now()
  }
}

