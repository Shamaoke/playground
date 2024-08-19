/**
 * Check if an array is empty
 *
 * @param  {Array<T>} a - an array of elements of any type
 * @return {Boolean}
 */
let is_empty = a => a.length == 0

/**
 * Check if an array is not empty
 *
 * @param  {Array<T>} a - an array of elements of any type
 * @return {Boolean}
 */
let is_not_empty = a => a.length > 0

let head = a => ([h, ..._] = a, h)

let tail = a => ([_, ...t] = a, t)

let cons = (x, xs) => [x, ...xs]

let fold_left = (a, f, v) => {
  for (a; is_not_empty(a); a = tail(a))
    v = f(v, head(a))

  return v
}

// inspired by https://github.com/servo/servo/blob/master/components/layout/linked_list.rs#L13
// let fold_left = (a, f, v) => {
//   for (a; is_not_empty(a); Mem.replace(a, tail(a)))
//     Mem.replace(v, f(v, head(a)))
//
//   return v
// }

let rec_fold_left = (a, f, v) =>
  is_empty(a) ? v
              : rec_fold_left(tail(a), f, f(v, head(a)))

/* @curry
 * let rec_fold_left = (a, f, v) =>
 *   is_empty(a) ? v
 *               : rec_fold_left(tail(a), f, f(v, head(a)))
 *
 * let%curry rec_fold_left = (a, f, v) =>
 *   is_empty(a) ? v
 *               : rec_fold_left(tail(a), f, f(v, head(a)))
 */

/**
 * Reverse a given array
 *
 * @param  {Array<T>} a - an array of elements of any type
 * @return {Array<T>}
 */
let reverse = a => rec_fold_left(a, (xs, x) => cons(x, xs), [ ])

/**
 * Summarize numbers in a given array
 *
 * @param  {Array<Number>} a
 * @return {Number}
 */
let sum = a => fold_left(a, (f, s) => f + s, 0)

/**
 * Multiply numbers in a given array
 *
 * @param  {Array<Number>} a
 * @return {Number}
 */
let product = a => fold_left(a, (f, s) => f * s, 1)

/**
 * Join separate strings in a given array into a single string
 *
 * @param  {Array<String>} a
 * @param  {String} [sp=''] - an optional separator for strings
 * @return {String}
 */
let join = (a, sp = '') => fold_left(a, (f, s) => `${f}${s}${sp}`, '')

/**
 * Compute a square of a number
 *
 * @param {Array<number>} a - an array containing numbers from 1 to n
 *
 * @return {number} - a square of the last element of the given array
 */
// let square = (a) => fold_left( a, (f, s) => (2 * s - 1) + f, 0 )

/**
 * Compute a square of a number
 *
 * @param {number}
 *
 * @return {number}
 */
// let square = n => fold_left( to_ary( (1..n) ), (f, s) => (2 * s - 1) + f, 0 )
// let range  = function*(k) { for (let i = 1; i <= k; i = i + 1 ) yield i }
// let square = n => fold_left( [...range(n)], (f, s) => (2 * s - 1) + f, 0 )
let square = n => fold_left( [...(function* (k) { for (let i = 1; i <= k; i = i + 1) yield i })(n)], (f, s) => (2 * s - 1) + f, 0 )

/* :::examples::: */

let a = [1, 2, 3, 4, 5, 6, 7]

let b = ['ok!', 'ok too!', 'ok free!', 'ok for!']

let pp1 = ['Pavel', 'Elena']

let pp2 = ['Josh', 'Jack']

// console.log( [...range(8)] )
// console.log( square(25) )

console.log(rec_fold_left([1, 2, 3, 4], (f, s) => f + s, 0))

// console.log(rec_fold_left(a, (f, s) => f + s, 0))
// console.log(rec_fold_left(pp2, (f, s) => `${f}->${s}`, rec_fold_left(pp1, (f, s) => `${f}~>${s}`, '')))

// console.log(sum(a))

// console.log(product(a))

// console.log(join(b))

// console.log(join(b, "->"))

// console.log(fold_left(a, (a, b) => a + b, 0))
// console.log(fold_left(a, (a, b) => a * b, 1))

// console.log(fold_left(b, (a, b) => `${a}\n${b}`, ''))

// console.log(fold_left(pp2, (f, s) => `${f} ${s}`, fold_left(pp1, (f, s) => `${f} ${s}`, '')))
