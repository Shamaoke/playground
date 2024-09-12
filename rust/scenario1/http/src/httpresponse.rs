
use std::collections::HashMap;
use std::io::Write;

pub struct HttpResponse<'a> {
  version: &'a str,
  status_code: &'a str,
  status_text: &'a str,
  headers: Option<HashMap<&'a str, &'a str>>,
  body: Option<String>,
}

impl<'a> HttpResponse<'a> {

  pub fn new(
    _status_code: &'a str,
    headers: Option<HashMap<&'a str, &'a str>>,
    body: Option<String>,
  ) -> HttpResponse<'a> {

    let mut res = HttpResponse::default();

    res.headers = match headers {
      Some(_) => headers,
      None => Some(HashMap::from([("Content-Type", "text/html")])),
    };

    res.status_text = match res.status_code {
      "200" => "OK",
      "400" => "Bad Request",
      "404" => "Not Found",
      "500" => "Internal Server Error",
      _ => "Not Found",
    };

    res.body = body;

    res
  }

  pub fn send(&self, write_stream: &mut impl Write) -> Result<(), ()> {

    write!(write_stream, "{}", String::from(self));

    Ok(())
  }

  pub fn version(&self) -> &str { self.version }

  pub fn status_code(&self) -> &str { self.status_code }

  pub fn status_text(&self) -> &str { self.status_text }

  pub fn headers(&self) -> String {

    let mut res = String::from("");

    self.headers
      .clone()
      .unwrap()
      .iter()
      .for_each(|(k, v)| res.push_str(format!("{k}: {v}\r\n").as_str()));

    res
  }

  pub fn body(&self) -> &str {

    match &self.body {
      Some(body) => body.as_str(),
      None => ""
    }
  }

}

impl<'a> Default for HttpResponse<'a> {
  fn default( ) -> Self {
    Self {
      version: "HTTP/1.1",
      status_code: "200",
      status_text: "OK",
      headers: None,
      body: None,
    }
  }
}

impl<'a> From<&HttpResponse<'a>> for String {
  fn from(res: &HttpResponse<'a>) -> String {
    format!(
      "{0} {1} {2}\r\n{3}Content-Length: {4}\r\n\r\n{5}",
      res.version(),
      res.status_code(),
      res.status_text(),
      res.headers(),
      res.body().len(),
      res.body(),
    )
  }
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn http_response_headers( ) {
    let headers = HashMap::from([("Content-Type", "text/html"), ("Content-Language", "en")]);
    let res = HttpResponse::new("200", Some(headers), Some(String::from("")));

    assert_eq!("Content-Type: text/html\r\nContent-Language: en\r\n", res.headers());
  }

  #[test]
  fn http_response_body( ) {
    let body = "<html></html>";
    let res = HttpResponse::new("200", None, Some(String::from(body)));

    assert_eq!("<html></html>", res.body());
  }

  #[test]
  fn http_response_from( ) {
    let s = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\nContent-Language: en\r\nContent-Length: 13\r\n\r\n<html></html>";

    let headers = HashMap::from([("Content-Type", "text/html"), ("Content-Language", "en")]);
    let body = String::from("<html></html>");
    let res = HttpResponse::new("200", Some(headers), Some(body));

    assert_eq!(s, String::from(&res));
  }
}

