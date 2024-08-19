// function Sample() { }
//
// Object.defineProperty(
//   Sample,
//   Symbol.hasInstance,
//   { value: (v) => { return v instanceof Date },
//     enumerable:   true,
//     configurable: true,
//     writable:     true }
// )

// Sample[Symbol.hasInstance] = (v) => { return v instanceof Date }

// class Sample {
//   static [Symbol.hasInstance](v) {
//     return v instanceof Date
//   }
// }

// function Foo( ) { }

// function Bar( ) { }

// Bar[Symbol.hasInstance] = function(v) { return v instanceof Foo }
// Bar[Symbol.one] = function(v) { return `hello ${v}` }

// class Baz { }

// Baz[Symbol.hasInstance] = function(v) { return v instanceof Foo }
// This should work but for some reason it doesn't.
// In Node.js the [similar][*] definition is working.
// [*]: https://nodejs.org/api/util.html#util_util_promisify_original

// class Baz {
//   static [Symbol.hasInstance](v) {
//     return v instanceof Foo
//   }
// }

/// What's a difference between defining a new property for
/// an object with dot/bracket notation and Object.defineProperty

// Object.defineProperty(
//   Bar,
//   Symbol.hasInstance,
//   { value(v) { return v instanceof Foo } }
// )

class Parent {
  // static get [Symbol.species]() { return Parent }

  one() { return this.constructor[Symbol.species] }

  two() { return this.constructor[Symbol.species] }
}

class Child extends Parent {
  // static get [Symbol.species]() { return Parent }

  three() { return this.constructor[Symbol.species] }
}

/* vim: set textwidth=60 colorcolumn=60: */
