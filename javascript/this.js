this.rabbit = 'ok!'

let o = {
  rabbit: 'ok too!',
  f: function ( ) { return this },
  g: ( ) => { return this }
}

console.log(o.g().rabbit)
console.log(o.f().rabbit)

let o =
{ rabbit: 'ok too!',
  f:      function ( ) { return this },
  g:      ( ) => { return this } }

let o =
  { rabbit: 'ok too!',
    f:      function ( ) { return this },
    g:      ( ) => { return this },
  }
