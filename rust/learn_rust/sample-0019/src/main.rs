
//! An example program showing the usage of non-owing types as structure fields

mod my {

  #[allow(dead_code)]
  #[derive(Debug)]
  pub struct Account<'a> {
    pub active: bool,
    pub username: &'a str,
    pub email: &'a str,
    pub pass: &'a str,
    pub signin_count: u64,
  }
}

fn main( ) {

  use my::Account;

  let active = true;
  let username = "alekhin";
  let email = "alekhin.kolomna@yandex.ru";
  let pass ="tieCh9ei";
  let signin_count = 99;

  let a = Account {
    active,
    username,
    email,
    pass,
    signin_count,
  };

  // println!("{:?}", a);
  // println!("{:#?}", a);
  dbg!(&a);

  // println!(
  //   "username: {0}\nemail: {1}\npass: {2}\nactive: {3}\nsignin_count: {4}",
  //   a.username,
  //   a.email,
  //   a.pass,
  //   if a.active { "yes" } else { "no" },
  //   a.signin_count,
  // );
}

