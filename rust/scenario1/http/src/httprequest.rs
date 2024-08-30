
///
/// ::: HTTP Request :::
///

use std::collections::HashMap;
use std::any::type_name;

#[allow(unused)]
fn type_of<T>(_: T) -> String { String::from(type_name::<T>()) }

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

#[derive(Debug)]
pub struct HttpRequest {
  method: Method,
  version: Version,
  pub resource: Resource,
  pub headers: HashMap<String, String>,
}

impl HttpRequest {

  pub fn new( ) -> Self {
    HttpRequest {
      method: Method::Uninitialized,
      resource: Resource::Path(String::from("")),
      version: Version::Uninitialized,
      headers: HashMap::new(),
    }
  }

  fn get_request_line(req: &String) -> Vec::<&str> {

    // Request-Line = Method SP Request-URI SP HTTP-Version CRLF
    // [RFC 2616 - Hypertext Transfer Protocol -- HTTP/1.1](https://datatracker.ietf.org/doc/html/rfc2616#section-5.1)

    req
      .lines()
      .collect::<Vec::<&str>>()[0]
      .split_whitespace()
      .collect::<Vec::<&str>>()
  }

  fn get_headers(req: &String) -> HashMap::<String, String> {

    let binding =
      req.split("\r\n")
         .collect::<Vec<&str>>()[1..]
         .join("\r\n");

    let hs =
      binding.split("\r\n\r\n")
             .collect::<Vec<&str>>()[0];

    let res =
      hs.split("\r\n")
        .map(|e| e.split_once(":"))
        .map(|e| (e.unwrap().0.trim().to_owned(), e.unwrap().1.trim().to_owned()))
        .collect::<HashMap<String, String>>();

    res
  }

  fn get_method(req: &String) -> &str {
    HttpRequest::get_request_line(req)[0]
  }

  fn get_resource(req: &String) -> &str {
    HttpRequest::get_request_line(req)[1]
  }

  fn get_version(req: &String) -> &str {
    HttpRequest::get_request_line(req)[2]
  }

  pub fn set_method(&mut self, m: Method) -> &mut Self {
    self.method = m;
    self
  }

  pub fn set_resource(&mut self, r: Resource) -> &mut Self {
    self.resource = r;
    self
  }

  pub fn set_version(&mut self, v: Version) -> &mut Self {
    self.version = v;
    self
  }

  pub fn set_headers(&mut self, h: HashMap<String, String>) -> &mut Self {
    self.headers = h;
    self
  }
}

impl From<String> for HttpRequest {
  fn from(s: String) -> Self {

    let mut r = HttpRequest::new();

    (&mut r)
      .set_method(Method::from(HttpRequest::get_method(&s)))
      .set_resource(Resource::from(HttpRequest::get_resource(&s)))
      .set_version(Version::from(HttpRequest::get_version(&s)))
      .set_headers(HttpRequest::get_headers(&s));

    r
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
pub enum Resource {
  Path(String),
}

impl From<&str> for Resource {
  fn from(s: &str) -> Self {
    Resource::Path(s.to_owned())
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
      (String::from("Host"), String::from("localhost:3344")),
      (String::from("User-Agent"), String::from("curl/8.9.1")),
      (String::from("Accept"), String::from("*/*")),
    ]);

    assert_eq!(r.headers, h);
  }
}

