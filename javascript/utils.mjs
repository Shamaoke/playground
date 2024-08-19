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

let head = (a, [h, ..._] = a) => h

let tail = (a, [_, ...t] = a) => t

let cons = (x, xs) => [x, ...xs]

let fold_left = (a, f, v) => {
  for (a; is_not_empty(a); a = tail(a))
    v = f(v, head(a))

  return v
}

let rec_fold_left = (a, f, v) =>
  is_empty(a) ? v
              : rec_fold_left(tail(a), f, f(v, head(a)))

let range = function* (a, b) { for (a; a <= b; a = a + 1) yield a }

let seq = n => [...range(0, n)]

let compose2 = (f, g, x) => f(g(x))

export default {
  compose2,
  seq,
  is_empty,
  is_not_empty,
  head,
  tail,
  cons,
  fold_left,
  rec_fold_left,
}
