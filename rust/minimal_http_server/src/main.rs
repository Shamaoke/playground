
use warp::Filter;

struct UsersController { }

impl UsersController {
  fn index( ) -> String {
    String::from("Hello, users!")
  }
}

#[tokio::main]
async fn main( ) {

  let index = warp::path::end()
    .map(| | format!("Hello, world!"));

  // let users = warp::path("users")
  //   .map(| | format!("Hello, users!"));

  let users = warp::path("users")
    .map(&UsersController::index);

  // let users = warp::path("users")
  //   .and(warp::path::param())
  //   .map(|name: String| format!("Hello, {}!", name));

  let routes = warp::get()
    .and(index)
    .or(users);

  warp::serve(routes).run(([127, 0, 0, 1], 1337)).await;
}

