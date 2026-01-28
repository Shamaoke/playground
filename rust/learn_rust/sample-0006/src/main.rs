
use std::error::Error;

slint::include_modules!();

fn main() -> Result<(), Box<dyn Error>> {

  let main = Main::new()?;

  main.run()?;

  Ok(())
}

