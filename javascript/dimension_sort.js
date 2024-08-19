// let comparator = ([f1, f2], [s1, s2]) => {
//   console.log(`f1: ${f1}`)
//   console.log(`s1: ${s1}`)
//   console.log(`f2: ${f2}`)
//   console.log(`s2: ${s2}`)
//   if (f1 != s1) {
//     return (f1 > s1 ? 1 : -1)
//   }
//   else if (f2 != s2) {
//     return (f2 > s2 ? 1 : -1)
//   }
//   else {
//     return 0
//   }
// }

let comparator = ([f1, f2], [s1, s2]) =>
    (f1 != s1) ? (f1 > s1 ? 1 : -1)
  : (f2 != s2) ? (f2 > s2 ? 1 : -1)
  : 0

let dsort = l => Array.prototype.sort.call(l, comparator)

let a = [ [1, 3], [1, 2] ]
let b = [ [1, 2], [1, 3] ]
let c = [ [1, 3], [1, 2], [2, 4], [1, 4], [1, 3] ]

console.log(dsort(a))
console.log(dsort(b))
console.log(dsort(c))
