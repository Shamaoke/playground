
use std::io::{stdin, Result};
use std::cmp::Ordering::{Less, Equal, Greater};
// or `use Ordering::*` in code

use rand::Rng;
use colored::Colorize;

fn main() -> Result<()> {

  let secret: u32 = rand::rng().random_range(1..=100);

  // println!("The secret is: {secret}");

  println!("{ }", "Guess the number!".green());

  loop {
    println!("Please, input your guess.");

    let mut guess = String::new();

    stdin().read_line(&mut guess).expect("Failed to read line.");

    let guess: u32 = match guess.trim().parse() {
      Ok(n) => n,
      Err(_) => continue,
    };

    println!("You guessed: {guess}");

    match guess.cmp(&secret) {
      Less => println!("{ }", "Too small".red()),
      Greater => println!("{ }", "Too big!".red()),
      Equal => {
        println!("{ }", "You win!".yellow());
        break Ok(())
      },
    }
  }
}

