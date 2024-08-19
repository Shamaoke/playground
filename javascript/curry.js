// let length = l => l.length
//
// let lt = (a, b) => a < b
//
// // let bind = f => Function.prototype.bind.call(f)
//
// let _curry = (f, arty) => (...args) =>
//   lt(length(args), arty) ? _curry.bind(null, ...args)
//                          : f.call(null, ...args)
//
// let curry = f => _curry(f, length(f))
//
// let f = (a, b) => a + b
//
// let g = curry(f)
//
// let plus_2 = g(2)
//
// console.log(plus_2(3)(3))

// let curry = f => a => b => f(a, b)
//
// let sum = (a, b) => a + b
//
// let plus_2 = curry(sum)(2)
//
// console.log(plus_2(3))

// let sum2 = (a, b) => a + b
//
// let cur2 = f => a => b => f(a, b)
//
// let inc = cur2(sum2)(1)
//
// let dec = cur2(sum2)(-1)
//
// console.log(inc(10), dec(10))

// let curry = f => (...args) => (arty = f.length) =>
//   args.length < arty ? curry.bind(f, ...args)
//                      : f(...args)

// let curry = f => (args) => (arty = f.length) =>
//   arty > args.length ? f(...args)
//                      : curry(f, ...args, arty)
//
// let sum2 = (a, b) => a + b
//
// let inc = curry(sum2)(1)
//
// let dec = curry(sum2)(-1)
//
// console.log(curry(sum2)(1)(10))
// console.log(inc(10), dec(10))

// let curry = f => a => b ... => n => f(a, b, ..., n)
