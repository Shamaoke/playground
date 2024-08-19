// function* range(n) { for (let i = 1; i <= n; i = i + 1) yield i }

// let range = function*(n) { for (let i = 1; i <= n; i = i + 1) yield i }

// console.log( [...range(5)] )

// console.log([...( function*(n) { for (let i = 1; i <= n; i = i + 1) yield i } )(5)])

let range = function* (a, b) { for (a; a <= b; a = a + 1) yield a }
//
// console.log([...range(4, 10)])
// console.log(Array.from( range(4, 10) ))
