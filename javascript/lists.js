let l1      = { v: 'ok!',      n: null } // v -- value; n --next
let l2      = { v: 'ok too!',  n: l1 }
let l3      = { v: 'ok free!', n: l2 }
let l4      = { v: 'ok for!',  n: l3 }
let s_list  = { v: 'ok fine!', n: l4 }

let f = (l, r = '', {v, n} = l) =>
  l.n == null ? `${r}${v}`
              : f(n, `${r}${v}\n`)

console.log(f(s_list))
