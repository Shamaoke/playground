
use std::error::Error;

slint::include_modules!();

fn main( ) -> Result<(), Box<dyn Error>> {

  let ui = Main::new()?;

  ui.run()?;

  Ok(())
}

