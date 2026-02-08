fn main() {
  // let s = ['a', 'b', 'c'];
  // let ss = &s[0..2];

  // let s = &['a', 'b', 'c'][0..2];
  // let s = &['a', 'b', 'c'][..2];
  let s = &['あ', 'い', 'う', 'え', 'お'][..2];

  // let mut it = s.iter();
  let mut en = s.iter().enumerate();

  // loop {
  //   match it.next() {
  //     Some(&e) => println!("e: { }", e),
  //     None => break,
  //   };
  // }

  // while let Some(&e) = it.next() { println!("e: { }", e); }
  while let Some((i, &e)) = en.next() { println!("{0}: {1}", i, e); }

  // for e in s { println!("e: { }", e); }

  // let mut range = 0..3; // Ranges are iterators

  // loop {
  //   match range.next() {
  //     Some(x) => {
  //       println!("Next value: {}", x);
  //     }
  //     None => {
  //       break; // Break the loop when the iterator is exhausted
  //     }
  //   }
  // }

  // for e in ss.iter() {
  //   println!("e: { }", e);
  // }
  // or
  // for e in ss { println!("e: { }", e); }

  // let s = "ok! ok too! ok free!";
  // let ss = &s[0..3];

  // for e in ss.lines() {
  //   println!("e: { }", e );
  // }
}
