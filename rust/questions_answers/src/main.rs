
///
///                                      █████    ███
///                                     ▒▒███    ▒▒▒
///    █████████████ ████  ██████  ████████████  ████   ██████  ████████   █████
///   ███▒▒███▒▒███ ▒███  ███▒▒██████▒▒▒▒▒███▒  ▒▒███  ███▒▒███▒▒███▒▒███ ███▒▒
///  ▒███ ▒███ ▒███ ▒███ ▒███████▒▒█████ ▒███    ▒███ ▒███ ▒███ ▒███ ▒███▒▒█████
///  ▒███ ▒███ ▒███ ▒███ ▒███▒▒▒  ▒▒▒▒███▒███ ███▒███ ▒███ ▒███ ▒███ ▒███ ▒▒▒▒███
///  ▒▒███████ ▒▒████████▒▒██████ ██████ ▒▒█████ █████▒▒██████  ████ ███████████
///   ▒▒▒▒▒███  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒ ▒▒▒▒▒▒   ▒▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒ ▒▒▒▒▒▒▒▒▒▒▒
///       ▒███   ██████  ████████   █████ █████ ███ █████ ██████  ████████  █████
///       █████    ▒▒███▒▒███▒▒███ ███▒▒ ▒▒███ ▒███▒▒███ ███▒▒███▒▒███▒▒██████▒▒
///      ▒▒▒▒▒   ███████ ▒███ ▒███▒▒█████ ▒███ ▒███ ▒███▒███████  ▒███ ▒▒▒▒▒█████
///             ███▒▒███ ▒███ ▒███ ▒▒▒▒███▒▒███████████ ▒███▒▒▒   ▒███     ▒▒▒▒███
///            ▒▒████████████ ███████████  ▒▒████▒████  ▒▒██████  █████    ██████
///             ▒▒▒▒▒▒▒▒▒▒▒▒ ▒▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒ ▒▒▒▒    ▒▒▒▒▒▒  ▒▒▒▒▒    ▒▒▒▒▒▒
///

use std::str::FromStr;
use std::io::{Error, ErrorKind};

use warp::{Filter, Reply, Rejection};
use warp::reply::json;
use warp::reject::custom;
use warp::reject::Reject;
use warp::http::StatusCode;

use serde::Serialize;

#[derive(Serialize)]
struct Question {
  id: QuestionId,
  title: String,
  content: String,
  tags: Option<Tags>,
}

#[derive(Serialize)]
struct QuestionId(String);

#[derive(Debug)]
struct InvalidId;

impl Reject for InvalidId { }

#[derive(Serialize)]
struct Tags {
  list: Vec<String>,
}

impl Question {
  fn new(id: QuestionId, title: String, content: String, tags: Option<Tags>) -> Self {
    Question { id, title, content, tags }
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

async fn get_questions( ) -> Result<impl Reply, Rejection> {

  let question = Question::new(
    QuestionId::from_str("1").expect("No ID provided"),
    String::from("Frist question"),
    String::from("First question content"),
    Some(Tags { list: vec!(String::from("faq")) }),
  );

  match question.id.0.parse::<i32>() {
    Ok(_)  => Ok(json(&question)),
    Err(_) => Err(custom(InvalidId))
  }
}

async fn return_error(r: Rejection) -> Result<impl Reply, Rejection> {

  if let Some(_invalid_id) = r.find::<InvalidId>() {
    Ok(warp::reply::with_status(
      "No valid ID presented",
      StatusCode::UNPROCESSABLE_ENTITY,
    ))
  } else {
    Ok(warp::reply::with_status(
       "Route not found",
       StatusCode::NOT_FOUND,
    ))
  }
}

#[tokio::main]
async fn main( ) {

  let get_items = warp::get()
    .and(warp::path("questions"))
    .and(warp::path::end())
    .and_then(get_questions)
    .recover(return_error);

  warp::serve(get_items).run(([127, 0, 0, 1], 1337)).await;

  // Example requests
  // ----------------
  // `curl --silent http://127.0.0.1:1337/questions`
  // `curl --silent http://127.0.0.1:1337/questions | jq .title`
  // `curl --silent http://127.0.0.1:1337/questions | jq '.tags.list | .[0]'
  //
}

