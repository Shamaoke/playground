export function log(msg) {
  let elm = document.createElement('pre')
  let txt = document.createTextNode(msg)
  let cnt = document.getElementById('container')

  cnt.appendChild(elm.appendChild(txt))

  // txt |> elm.appendChild |> cnt.appendChild

  // cnt.appendChild <| elm.appendChild <| txt
}
