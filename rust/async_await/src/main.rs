
///
/// ::: async/await :::
///

// use std::collections::HashMap;

// use reqwest::Response;

// fn get_date(resp: &Response) -> &str {
//   resp.headers().get("date").unwrap().to_str().unwrap()
// }

use reqwest::Client;

#[tokio::main]
async fn main( ) -> Result<( ), Box<dyn std::error::Error>> {

  // let resp = reqwest::get("https://httpbin.org/ip").await?;

  // .json::<HashMap<String, String>>()
  // .await?;

  // println!("Fetching the result...");

  // println!("Status: {}\n", resp.status());
  // println!("Host: {:?}\n", resp.headers());
  // println!("date: {}\n", get_date(&resp));
  // println!("The result is {:?}.", resp);

  let client = Client::new();

  let builder = client.get("https://httpbin.org/ip");

  let response = builder.send().await?;

  println!("{:?}", response);

  Ok(())
}

