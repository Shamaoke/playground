
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

use std::collections::HashMap;

use warp::{ Filter, Reply, Rejection };
use warp::reply::json;
use warp::reject::custom;
use warp::reject::Reject;
use warp::http::{ Method, StatusCode };
use warp::filters::cors::CorsForbidden;

use serde::{ Serialize, Deserialize };

#[derive(Clone)]
struct Store {
  questions: HashMap<QuestionId, Question>
}

impl Store {

  fn new( ) -> Self {
    Store {
      questions: Self::init()
    }
  }

  fn init( ) -> HashMap<QuestionId, Question> {

    let file = include_str!("../questions.json");

    serde_json::from_str(file).expect("Can't read questions.json")
  }
}

#[derive(Serialize, Deserialize, Clone)]
struct Question {
  id: QuestionId,
  title: String,
  content: String,
  tags: Option<Tags>,
}

#[derive(Serialize, Deserialize, Clone, Eq, Hash, PartialEq)]
struct QuestionId(String);

#[derive(Serialize, Deserialize, Clone)]
struct Tags {
  list: Vec<String>,
}

async fn get_questions(store: Store) -> Result<impl Reply, Rejection> {

  // let res: Vec<Question> = store.questions.values().cloned().collect();
  // or
  let res = store.questions.values().cloned().collect::<Vec<Question>>();

  Ok(warp::reply::json(&res))
}

async fn return_error(r: Rejection) -> Result<impl Reply, Rejection> {

  if let Some(error) = r.find::<CorsForbidden>() {
    Ok(warp::reply::with_status(
      error.to_string(),
      StatusCode::FORBIDDEN,
    ))
  } else {
    Ok(warp::reply::with_status(
       "Route not found".to_string(),
       StatusCode::NOT_FOUND,
    ))
  }
}

#[tokio::main]
async fn main( ) {

  let store = Store::new();
  let store_filter = warp::any().map(move | | store.clone());

  // Define a resonse to the cross-origin OPTIONS request and set which origins,
  // methods and headers are allowed.
  let cors = warp::cors()
    .allow_any_origin()
    .allow_header("content-type")
    .allow_methods(
      &[Method::GET, Method::POST, Method::PUT, Method::DELETE]
    );

  let get_items = warp::get()
    .and(warp::path("questions"))
    .and(warp::path::end())
    .and(store_filter)
    .and_then(get_questions)
    .recover(return_error);

  let routes = get_items.with(cors);

  warp::serve(routes).run(([127, 0, 0, 1], 1337)).await;

  // Example requests
  // ----------------
  // `curl --silent http://127.0.0.1:1337/questions`
  // `curl --silent http://127.0.0.1:1337/questions | jq .title`
  // `curl --silent http://127.0.0.1:1337/questions | jq '.tags.list | .[0]'
  //
  // Request acceptable origins, methods and headers for forein origin clients.
  // ````
  // curl --request OPTIONS '127.0.0.1:1337/questions' \
  //      --header 'Origin: https://other.io' \
  //      --header 'Access-Control-Request-Method: PUT' \
  //      --header 'Access-Control-Request-Headers: content-type' \
  //      --verbose
  // ````
}

