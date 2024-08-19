
let t1
let t2

// for (let i = 0; i <= 20; i = i + 1) {
//   t1 = setTimeout(( ) => { console.log(i) }, 20_000)
// }
//
// for (let l in ['a', 'b', 'c', 'd', 'e']) {
//   t2 = setTimeout(( ) => { console.log(l) }, 5000)
// }

t1 = setTimeout(( ) => { console.log('t1') }, 20_000)

t2 = setTimeout(( ) => { console.log('t2') }, 5000)

t1.unref()

