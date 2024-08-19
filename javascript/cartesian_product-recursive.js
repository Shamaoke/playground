/** @type {Set<number> -> Set<number> -> Set<Set<number>>} */
/* let product => s1 => s2 => r = new Set => [h1, ...t1] = s1, [h2, ...t2] = s2 =>
 *   s1.size == 0 ? r
 *                : product(t1, t2, [..r])
 */


/** @type { Array<number> ->
 *          Array<number> ->
 *          Array<Array<number>> ->
 *          [Array<number>] ->
 *          [Array<number>] ->
 *          Array<Array<number>> }
 */

// let product = (s1, s2, r = [ ], [h1, ...t1] = s2, [h2, ...t2] = s1) =>
//   s1.length == 0 ? r
//                  : product(t1, t2, product(t1, t2, [...r, [h1, h2]]))
//

// let product = (s1, s2, r = [ ], [h1, ...t1] = s1, [h2, ...t2] = s2) =>
//     (s1.length == 0 || s2.length == 0) ? r
//   : (console.log(`[${s1}], [${s2}], [<${h1}>, ${t1}], [<${h2}>, ${t2}], [${r}]`), product(t1, t2, [...r, [h1, h2], ...product([h1], t2), ...product(t1, s2)]))

// let product = (s1, s2, r = [ ], [h1, ...t1] = s1, [h2, ...t2] = s2) =>
//     (s1.length == 0 || s2.length == 0) ? r
//   : (console.log(`[${s1}], [${s2}], [<${h1}>, ${t1}], [<${h2}>, ${t2}], [${r}]`), product(t1, t2, product( [h1], t2, product(t1, s2, [...r, [h1, h2]]) )))

// let product = (l1, l2, r = [ ], [h1, ...t1] = l1, [h2, ...t2] = l2) =>
//     (l1.length == 0 || l2.length == 0) ? r
//   : product( l1, t2, product(l2, t1, [...r, [h1, h2]]) )

// let product = (l1, l2, r = [ ], [h1, ...t1] = l1, [h2, ...t2] = l2) =>
//     (l1.length == 0 || l2.length == 0) ? r
//   : (console.log(`[${l1}], [${l2}], [<${h1}>, ${t1}], [<${h2}>, ${t2}], [${r}]`), product( [h1], t2, product(t1, l2, [...r, [h1, h2]]) ))

// let product = (l1, l2, r = [ ], [h1, ...t1] = l1, [h2, ...t2] = l2) =>
//     (l1.length == 0 || l2.length == 0) ? r
//                                        : product([h1], t2, product(t1, l2, [...r, [h1, h2]]))

// let product = (l1, l2, r = [ ], [h1, ...t1] = l1, [h2, ...t2] = l2) =>
//     (l1.length == 0 || l2.length == 0) ? r
//                                        : product( [h1], t2, product(t1, l2, [...r, [h1, h2]]) )

let size = l => l.length

let is_empty = l => size(l) == 0

let either_empty = (l1, l2) => (is_empty(l1) || is_empty(l2))

// let product = (l1, l2, r = [ ], [h1, ...t1] = l1, [h2, ...t2] = l2) =>
//   either_empty(l1, l2) ? r
//                        : product( [h1], t2, product(t1, l2, [...r, [h1, h2]]) )

let product = l1 => (l2, r = [ ], [h1, ...t1] = l1, [h2, ...t2] = l2) =>
  either_empty(l1, l2) ? r
                       : product([h1])(t2, product(t1)(l2, [...r, [h1, h2]]))

let comparator = ([f1, f2], [s1, s2]) =>
    (f1 != s1) ? (f1 > s1 ? 1 : -1)
  : (f2 != s2) ? (f2 > s2 ? 1 : -1)
  : 0

let dsort = l => Array.prototype.sort.call(l, comparator)

let compose = (f, g, x, h = g(x)) => f(h(h(x)))

let sproduct = l => compose(dsort, product, l)

let colors = [1, 2, 3, 4, 5, 6]

console.table(sproduct(colors))
// console.log(sproduct(colors))

// let compose2 = (f, g, x1, x2) => f(g(x1)(x2))
//
// let sproduct = (l1, l2) => compose2(dsort, product, l1, l2)

// let product = (l1, l2, [h1, ...t1] = l1, [h2, ...t2] = l2) =>
//     (l1.length == 0 || l2.length == 0) ? [ ]
//   : [ [h1, h2], ...product([h1], t2), ...product(t1, l2) ]



// let oks  = ['ok!', 'ok too!', 'ok free!', 'ok for!']
// let nums = [1, 2, 3, 4]
// let nams = ['Pavel', 'Elena', 'Josh', 'Jack']
// console.log(dsort(product(oks, product(nums, nams))))
