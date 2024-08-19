let s = new Set

/** @type {Set -> 'a -> Set<'a>} */
let add = s => e => Set.prototype.add.call(s, e)

/** @type {'a -> Set<'a>} */
let add_to_s = add(s)

add_to_s(1)
add_to_s(2)

let [a, b] = s

console.log(a, b)
