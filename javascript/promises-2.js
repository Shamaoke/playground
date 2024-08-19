let Promise = {
  state: Array[Pending |   ]
}

let one = async ( ) => {
  try {
    let something = await something_to_finish() // it'll finish after 24 hours
    do_something_with(something)
  }
  catch {
    //
  }
  finally {
    //
  }
}

let two   = async ...
let three = async ...

...

let one_hundred = async ...

one()
two()
three()

...

one_hundred()
