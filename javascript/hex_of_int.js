let hex_dig = i =>
    i == 10 ? 'a'
  : i == 11 ? 'b'
  : i == 12 ? 'c'
  : i == 13 ? 'd'
  : i == 14 ? 'e'
  : i == 15 ? 'f'
  : i

let compose2   = (f, g, x, y) => f(g(x, y))
let divi       = (i, j)       => Math.trunc(i / j)
let mod        = (i, j)       => i % j
let hex_of_mod =  i           => compose2(hex_dig, mod, i, 16)
let concat     = (i, s)       => String.prototype.concat.call(hex_of_mod(i), s)

let hex_of_int = (i, r = '') =>
  i == 0 ? r
         : hex_of_int( divi(i, 16), concat(i, r) )

console.log(hex_of_int(255))
