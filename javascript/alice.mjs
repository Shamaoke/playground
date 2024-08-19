import Utils from './utils.mjs'

let sum = a => Utils.fold_left(a, (f, s) => f + s, 0)

let sumseq = async n => Utils.compose2(sum, Utils.seq, n)

// console.log('ok!')
// console.log('ok too!')
// console.log('ok free!')

// console.table([
//   ['sum', '[1..35]', sumseq(10000)]
// ])

// let f = (r, j) => r(sumseq(10000))
//
// let g = (v) => console.log(v)
//
// let p = new Promise(f)
//
// p.then(g)

// let h = v => new Array(v)

// let f = (r, j) => { try { r(h(-1)) } catch (e) { j(e) } }

// let g = (v) => console.log(v)

// let p = new Promise(f)

// p.then(g)

// let s = ( )    => console.log('succsess')
// let f = ( )    => console.log('failure')
// let c = (r, j) => ( r(new Array(1)), j(new Array(-1)) )
//
// let p = new Promise(c)
//
// p.then(s, f)

let one = (v) => sumseq(v)
let two = (v) => console.log(v) //=> Promise { <pending> }

// Promise { <pending> } -> 50005000 -> 1
//
// let two = (v) => console.log( v.then(v => console.log(v)) ) //=> Promice -> Result
//

let a = one(10000); two(a)

console.log('1') //=> {2} 1
