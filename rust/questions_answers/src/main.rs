
///
/// ::: Questions/Answers :::
///

use std::fmt::{Display, Formatter};

use std::str::FromStr;
use std::io::{Error, ErrorKind};

struct Question {
  id: QuestionId,
  title: String,
  content: String,
  tags: Option<Tags>,
}

struct QuestionId(String);

struct Tags {
  list: Vec<String>,
}

impl Question {
  fn new(id: QuestionId, title: String, content: String, tags: Option<Tags>) -> Self {
    Question { id, title, content, tags }
  }
}

impl Display for Question {
  fn fmt(&self, f: &mut Formatter) -> std::fmt::Result {
    write!(f, "{0}) {1}\n{2}\n[{3}]", self.id, self.title, self.content, self.tags.as_ref().unwrap_or(&Tags { list: Vec::from([String::from("none")]) }).list.join(", "))
  }
}

impl Display for QuestionId {
  fn fmt(&self, f: &mut Formatter) -> std::fmt::Result {
    write!(f, "{}", self.0)
  }
}

impl Display for Tags {
  fn fmt(&self, f: &mut Formatter) -> std::fmt::Result {
    write!(f, "{}", self.list.join(" "))
  }
}

impl FromStr for QuestionId {
  type Err = Error;

  fn from_str(id: &str) -> Result<Self, Self::Err> {
    match id.is_empty() {
      false => Ok(QuestionId(id.to_string())),
      true  => Err(Error::new(ErrorKind::InvalidInput, "No ID provided")),
    }
  }
}

fn main( ) -> ( ) {

  let tags = Tags { list: Vec::from([String::from("rust"), String::from("string")]) };

  let question_1 = Question::new(
    QuestionId::from_str("1").expect("No ID provided"),
    String::from("What is the equivalent of the join operator over a vector of Strings?"),
    String::from(r#"I wasn't able to find the Rust equivalent for the "join" operator over a vector of Strings."#),
    Some(tags),
  );

  println!("{}", question_1);
  // println!("{}", question_1.tags.unwrap().list.join(", "));

  return ( );
}

