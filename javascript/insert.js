// let insert = n =>
//              a => { let _f = (n, a, r) => n <= a[0] ? [...r, n, ...a]
//                                                       : _f(n, a.slice(1), [...r, a[0]])
//
//                     let _g = (n, a, r) => n > a[a.length - 1] ? [...r, ...a, n]
//                                                                 : _f(n, a, r)
//
//                     return _g(n, a, [ ]) }

// let insert = n => (a, r = [ ]) =>
//     a.length == 0       ? [n]
//   : n > a[a.length - 1] ? [...r, ...a, n]
//   : n <= a[0]           ? [...r, n, ...a]
//   : insert(n)(a.slice(1), [...r, a[0]])
//
// let f = insert(0)
// let g = insert(5)
// let h = insert(11)
//
// let a = [ ]
// let b = [2, 4, 7, 10]
//
// f(a) //=> [<0>]
//
// f(b) //=> [<0>, 2, 4, 7, 10]
// g(b) //=> [2, 4, <5>, 7, 10]
// h(b) //=> [2, 4, 7, 10, <11>]

// console.log( f(a), g(a), h(a) )
// console.log( f(b), g(b), h(b) )

// let insert = n => (a, r = [ ]) =>
//     a.length == 0                         ? [n]
//   : ([h, ...t] = a, n >  t[t.length - 1]) ? [...a, n]
//   : ([h, ...t] = a, n <= h)               ? [...r, n, ...a]
//   : insert(n)(t, [...r, h])
//
// let f = insert(0)
// let g = insert(5)
// let j = insert(11)
//
// let a = [ ]
// let b = [2, 4, 7, 10]
//
// console.log( f(a), g(a), j(a) )
// console.log( f(b), g(b), j(b) )

// let insert = n => (a, r = [ ], [h, ...t] = a) =>
//     a.length == 0       ? [n]
//   : n > a[a.length - 1] ? [...a, n]
//   : n <= h              ? [...r, n, ...a]
//   : insert(n)(t, [...r, h])

/* :::version a::: */

/* let insert = (n, a, r = [ ], [h, ...t] = a) =>
 *     a.length == 0       ? [n]
 *   : n > a[a.length - 1] ? [...a, n]
 *   : n <= h              ? [...r, n, ...a]
 *   : insert(n, t, [...r, h])
 *
 * console.log( insert(9999, Array.from({length: 10000}, (e, i) => i)) )
 */

/* :::version b::: */
/* (doesn't work)  */

let is_empty = a => a.length == 0

let is_not_empty = a => a.length > 0

let head = a => ([h, ..._] = a, h)

let tail = a => ([_, ...t] = a, t)

let cons = (x, xs) => [x, ...xs]

let fold_left = (a, f, v) =>
  is_empty(a) ? v
              : fold_left(tail(a), f, f(v, head(a)))

let insert = (n, a, r = [ ]) =>
    n > head(a) ? fold_left(a, (xs, x) => cons(x, xs), r)
                : fold_left(a, (xs, x) => cons(xs, x), r)

let n = 5
let a = [2, 4, 7, 10]

console.log(insert(n, a))

// function insert(n, arr) { let i = 0; while (n > arr[i]) i++; arr.splice(i, 0, n); return arr; }

// console.log( insert(5000, Array.from({length: 10000}, (e, i) => i)) )

// let f = insert(0)
// let g = insert(5)
// let h = insert(11)
//
// let a = [ ]
// let b = [2, 4, 7, 10]
//
// f(a) //=> [<0>]
//
// f(b) //=> [<0>, 2, 4, 7, 10]
// g(b) //=> [2, 4, <5>, 7, 10]
// h(b) //=> [2, 4, 7, 10, <11>]
//
// console.log( f(a), g(a), h(a) )
// console.log( f(b), g(b), h(b) )
//
// console.log( f, g, h )
