//
// console.log(
//   c.constructor, // [Function A] if C.prototype.constructor is not set
//   c.getOne(),
//   c.getTwo()
// )
//

////
// function A(one) {
//   this.one = one
// }
//
// A.prototype.getOne = function() { return this.one }
//
// function B(two) {
//   this.two = two
// }
//
// B.prototype.getTwo = function() { return this.two }
//
// function C(one, two) {
//   A.call(this, one)
//   B.call(this, two)
// }
//
// C.prototype = Object.assign(A.prototype, B.prototype)
//
// C.prototype.constructor = C
//
// let c = new C('ok!', 'ok too!')
//
// console.log(c.getOne(), c.getTwo())
//
// console.log(c.__proto__) //=> { getOne: [Function (anonymous)], getTwo: [Function (anonymous)] }
//
// console.log(Object.getPrototypeOf(c)) //=> the same as above
//
// let c_prime = { one: 'ok again!', two: 'ok too again!' }
//
// console.log(
//   Object.getPrototypeOf(c).getOne.call(c_prime),
//   Object.getPrototypeOf(c).getTwo.call(c_prime)
// )
//
// console.log(c.__proto__.getOne.toString()) //=> function() { return this.one }
//

////
// function A(one, two) {
//   this.one = one
//   this.two = two
// }
//
// A.prototype.doOne = function() { return this.one }
// A.prototype.doTwo = function() { return this.two }
//
// let a = new A('ok!', 'ok too!')
//
// console.log(a.doOne(), a.doTwo())
//
// the same as above
// let a = Object.create(A.prototype); A.call(a, 'ok!', 'ok too!')
//
// console.log(a.doOne(), a.doTwo())
//
// the same as above
// let a = Reflect.construct(A, ['ok!', 'ok too!'])
//
// console.log(a.doOne(), a.doTwo())
//

////
// function A() {
//   /* no action */
// }
//
// A.prototype.getOne = function() { return this.one }
// A.prototype.getTwo = function() { return this.two }
//
// function B(one, two) {
//   this.one    = one
//   this.two    = two
//   this.target = new.target
// }
//
// let b = Reflect.construct(B, ['ok!', 'ok too!'], A)
//
// console.log(b.getOne(), b.getTwo())
//
// console.log(b.constructor) //=> [Function: A]
//
// console.log(b.target) //=> [Function: A]
//
// Details:
//
// • [Reflect.construct()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect/construct)
//
// • [new.target](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new.target)
//

function A() { }

A.prototype.doOne = function () { return 'ok!' }
A.prototype.doTwo = function () { return 'ok too!' }

let handlers = {
  callback: function() { console.log('proxy') },

  apply: function(target, thisArg, args) {
    this.callback()

    return target()
  }
}

let a = new A()

let aDoOneProxy = new Proxy(a.doOne, handlers)

console.log(a.doOne()) //=> ok!

console.log(aDoOneProxy()) //=> proxy\nok!

/* vim: set textwidth=80 colorcolumn=80: */

