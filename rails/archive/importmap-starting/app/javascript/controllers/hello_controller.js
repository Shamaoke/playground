
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [
    'name',
    'greeting',
  ]

  get name( ) {
    return this.nameTarget.value
  }

  // connect( ) {
  //   this.element.textContent = 'Hello, world!'
  // }

  greet( ) {
    // console.log('Hello, Stimulus!', this.element)
    // this.element.textContent = 'Hello, Stimulus!'

    // let element = this.nameTarget
    // let name = element.value
    //
    // console.log(`Hello, ${name}!`)

    this.greetingTarget.textContent = `Hello, ${this.name}!`

    // let elm = document.createElement('span')
    // elm.innerHTML = `<span class='bg-sky-400'>Hello</span>, ${this.name}!`

    // this.greetingTarget.appendChild(elm)

    // console.log(this.greetingTarget)

    // console.log(`Hello, ${this.name}!`)
  }
}

