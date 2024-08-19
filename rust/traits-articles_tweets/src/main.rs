
///
/// ::: Traits :::
///

use crate::tweet::Tweet;
use crate::article::Article;
use crate::item::Item;
// use crate::summary::Summary;

// use crate::display::{display, display_new};

// mod summary;
mod timestamp;
mod tweet;
mod article;
mod item;
// mod display;

fn main( ) {

  let tweet = Tweet::new(
    String::from("Pavel"),
    String::from("I'm going to buy a PC case."),
  );

  let article = Article::new(
    String::from("Pavel"),
    String::from("Buying a PC case"),
    String::from("I'm going to buy a PC case."),
  );

  let item_tweet = Item::new(tweet);
  let item_article = Item::new(article);

  item_tweet.display();
  item_article.display();

  // display_new(tweet);
  // display(article);

}

