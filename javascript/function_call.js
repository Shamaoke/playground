function Product (name, price, category) {
  this._name     = name
  this._price    = price
  this._category = category
}

Product.prototype.getName = function ( ) { return this._name }

Product.prototype.getPrice = function ( ) { return this._price }

Product.prototype.getCategory = function ( ) { return this._category }

function Food (name, price, category) {
  Product.call(this, name, price, 'food')
}

Food.prototype = new Product

function Toy (name, price, category) {
  Product.call(this, name, price, 'toys')
}

Toy.prototype = new Product

let feta     = new Food('feta', 5)
let pizza    = new Food('pizza', 15)
let cheese   = new Food('cheese', 35)
let icecream = new Food('icecream', 5)

let robot = new Toy('robot', 10)
let car   = new Toy('car', 10)
let boat  = new Toy('boat', 15)

let food = [ feta, pizza, cheese, icecream ]
let toys = [ robot, car, boat ]

function props (delimeters, objects, result = '', [h, ...t] = objects) {
  return objects.length == 0 ? result
                             : props(delimeters, t, `${result}${h.getCategory()} | ${h.getName()}: ${h.getPrice()}\n`)
}

console.log(props`${[...food, ...toys]}`)
