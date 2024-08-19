
let response
// let buffer
// let result
// let instance
let addOne

try {
  // response = await fetch('main.wasm')

  // buffer = response.arrayBuffer()

  // result = WebAssembly.instantiate(buffer)

  // instance = result.instance

  // addOne = instance.exports.add_one

  response = await fetch('main.wasm')

  addOne = response.arrayBuffer() |> WebAssembly.instantiate(%).instance

} catch(e) {
  console.error(e)

} finally {

}

function main() {
  let result = addOne(1)

  return result //~> 2
}

