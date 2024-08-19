let join = (a, s = ' ', r = '', [h, ...t] = a) =>
    a.length == 0 ? r
  : a.length == 1 ? a[0]
  : a.length == 2 ? `${r}${a[0]} and ${a[1]}`
  : join(t, s, `${r}${h}${s}`)

join([ ], ', ') //=> ''
join(['a'], ', ') //=> 'a'
join(['a', 'b'], ', ') //=> 'a and b'
join(['a', 'b', 'c', 'd', 'e', 'f'], ', ') //=> 'a, b, c, d, e and f'
