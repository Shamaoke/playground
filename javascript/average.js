let sum = (list, result = 0, [h, ...t] = list) =>
  list.length == 0 ? result
                   : sum(t, result + h)

let length = list => list.length

// let avg = list => sum(list) / length(list)

let avg = (list, result = 0, length = list.length, [h, ...t] = list) =>
  list.length == 0 ? result / length
                   : avg(t, result + h, length)

let a = [2, 2, 2]

let b = [3, 3]

let c = [1, 2, 3]

let d = [8, 8, 1]

let e = [4, 3, 2, 1]

let lists = [a, b, c, d, e]

function f (delimeters, objects, result = '', [h, ...t] = objects) {
  return objects.length == 0 ? result
                             : f(delimeters, t, `${result}[${h}] -> sum: ${sum(h)}, length: ${length(h)}, avg: ${avg(h)}\n`)
}

console.log(f`${lists}`)
