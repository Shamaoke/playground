let eq = (l, m) => l == m

let compare = v => eq(v, 'one') && 'eql'

console.log(compare('one')) //=> 'eql'
console.log(compare('two')) //=> false

// see ./optional.js for a better solution

// let compare = v =>
//   is_eql(v, 'one') && (console.log('ok!') || console.log('not equal one'))
