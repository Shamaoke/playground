
///
/// ::: HTTP Request :::
///

use std::collections::HashMap;

// use std::collections::HashMap;

// #[derive(Debug, PartialEq)]
// pub enum Resource {
//   Path(String),
// }
//
// #[derive(Debug)]
// pub struct HttpRequest {
//   pub method: Method,
//   pub version: Version,
//   pub resource: Resource,
//   pub headers: HashMap<String, String>,
//   pub msg_body: String,
// }
//
// impl From<String> for HttpRequest {
//   fn from(s: String) -> Self {
//   }
// }

// fn process_req_line(s: &str) -> (Method, Resource, Version) {
//
// }

// fn process_header_line(s: &str) -> (String, String) {
//
// }

#[derive(Debug, PartialEq)]
pub enum Resource {
  Path(String),
}

#[derive(Debug)]
pub struct HttpRequest {
  pub method: Method,
  pub version: Version,
  pub resource: Resource,
  pub headers: HashMap<String, String>,
}

impl HttpRequest {

  pub fn new() -> Self {
    HttpRequest {
      method: Method::Uninitialized,
      version: Version::Uninitialized,
      resource: Resource::Path(String::from("")),
      headers: HashMap::new(),
    }
  }

  pub fn method(&mut self, m: Method) -> &Self {
    self.method = m;
    self
  }
}

impl From<String> for HttpRequest {
  fn from(s: String) -> Self {

    let mut r = HttpRequest::new();

    s.lines().for_each(|l| {
      if l.contains("HTTP") {
        (&mut r).method(Method::from(
          l.split_whitespace()
           .collect::<Vec::<&str>>()[0]
        ));
      }
    });

    println!("{:?}", r);

    // for line in s.lines() {
    //   if line.contains("HTTP") {
    //     // let request = &mut r;
    //     (&mut r).method(Method::from(line.split_whitespace().collect::<Vec::<&str>>()[0]));
    //   }
    // }

    r

    // HttpRequest {
    //   method: Method::Get,
    //   version: Version::V1_1,
    //   resource: Resource::Path(String::from("/greeting")),
    //   headers: HashMap::from([
    //     (String::from("Host"), String::from("localhost")),
    //   ]),
    // }
  }
}

#[derive(Debug, PartialEq)]
pub enum Method {
  Get,
  Post,
  Uninitialized,
}

impl From<&str> for Method {
  fn from(s: &str) -> Self {
    match s {
      "GET"  => Method::Get,
      "POST" => Method::Post,
      _ => Method::Uninitialized,
    }
  }
}

#[derive(Debug, PartialEq)]
pub enum Version {
  V1_1,
  V2_0,
  Uninitialized,
}

impl From<&str> for Version {
  fn from(s: &str) -> Version {
    match s {
      "HTTP/1.1" => Version::V1_1,
      _ => Version::Uninitialized,
    }
  }
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn test_method_into( ) {
    let m: Method = "GET".into();
    assert_eq!(m, Method::Get);
  }

  #[test]
  fn test_method_from( ) {
    let m = Method::from("GET");
    assert_eq!(m, Method::Get);
  }

  #[test]
  fn test_version_into( ) {
    let v: Version = "HTTP/1.1".into();
    assert_eq!(v, Version::V1_1);
  }

  #[test]
  fn test_version_from( ) {
    let v = Version::from("HTTP/1.1");
    assert_eq!(v, Version::V1_1);
  }

  #[test]
  fn test_http_request_from_method_get( ) {
    let s = String::from("GET /greeting HTTP/1.1\r\nHost: localhost:3344\r\nUser-Agent: curl/8.9.1\r\nAccept: */*\r\n\r\n");
    let r = HttpRequest::from(s);

    assert_eq!(r.method, Method::Get);
  }

  #[test]
  fn test_http_request_from_method_post( ) {
    let s = String::from("POST /greeting HTTP/1.1\r\nHost: localhost:3344\r\nUser-Agent: curl/8.9.1\r\nAccept: */*\r\n\r\n");
    let r = HttpRequest::from(s);

    assert_eq!(r.method, Method::Post);
  }

  #[test]
  fn test_http_request_from_version( ) {
    let s = String::from("GET /greeting HTTP/1.1\r\nHost: localhost:3344\r\nUser-Agent: curl/8.9.1\r\nAccept: */*\r\n\r\n");
    let r = HttpRequest::from(s);

    assert_eq!(r.version, Version::V1_1);
  }

  #[test]
  fn test_http_request_from_resource( ) {
    let s = String::from("GET /greeting HTTP/1.1\r\nHost: localhost:3344\r\nUser-Agent: curl/8.9.1\r\nAccept: */*\r\n\r\n");
    let r = HttpRequest::from(s);

    assert_eq!(r.resource, Resource::Path(String::from("/greeting")));
  }

  #[test]
  fn test_http_request_from_headers( ) {
    let s = String::from("GET /greeting HTTP/1.1\r\nHost: localhost:3344\r\nUser-Agent: curl/8.9.1\r\nAccept: */*\r\n\r\n");
    let r = HttpRequest::from(s);
    let h = HashMap::from([
      (String::from("Host"), String::from("localhost"))
    ]);

    assert_eq!(r.headers, h);
  }
}

