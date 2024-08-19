
function Parent(name) {
  this._name = name
}

function Child(name) {
  console.log(this)
  console.log(this._name)
  Parent.call(this, name)
  console.log(this._name)
}

let one = new Child('one')

function Sample( ) {
  console.log(this)
}

Sample()

