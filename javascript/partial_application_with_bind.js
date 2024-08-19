
let inc = (n, m) => m + n

let incOne = inc.bind(null, 1)

let incTwo = inc.bind(null, 2)

let num = 1

console.log(incOne(num), incTwo(num)) //=> 2 3

