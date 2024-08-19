let m = new Map([
  ['one',   'ok!'],
  ['two',   'ok too!'],
  ['three', 'ok free!'],
  ['four',  'ok for!'],
  ['five',  'ok fine!'],
])

for (let [k, v] of m)
  console.log(`${k} => ${v}`)
