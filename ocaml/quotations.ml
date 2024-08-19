(* attributes (annotations in OCaml) *)
let[@one] x = 1
and[@two] y = 2
in[@sum]
1 + 2

let x = 1 [@one]
and y = 2 [@two]
in
1 + 2 [@sum]

let x = 1 + 1 [@attribute] (* this attribute relates to `1 + 1' *)
let y = 2 + 1 [@@attribute] (* this attribute relates to whole expression `let y = 2 + 1' *)

(* quoted strings *)
let str = {one|ok!two|ok too!three|ok three!|three|two|one}

let str =
  {one|
    ok!
    two|
      ok too!
      three|
        ok free!
      |three
    |two
  |one}

(* extensions nodes *)
[%html {|<div>one</div><div>two</div><div>three</div>|} ]

(** the same in JavaScript
 *  html`<div>one</div><div>two</div><div>three</div>`
 *)

[%html
  {|
      <div>one</div>
      <div>two</div>
      <div>three</div>
  |}
]

(** the same in JavaScript
 *
 * html`
 *   <div>one</div>
 *   <div>two</div>
 *   <div>three</div>
 * `
 *
 *)

let%sql people = {|select * from users where name eql "pavel" or name eql "elena"|}

let people = [%sql {| select * from users where name eql "Pavel" or name eql "Elena" |}]

let people = {%sql| select * from users where name eql "Pavel" or name eql "Elena"; |}

let expr = a [%pipe] b [%pipe] c

let span      = Html.(span [id "one"] "one")
let span      = [%html "<span id=\"one\">one</span>" ]
let%html span = "<span id=\"one\">one</span>"
let%html span = {|<span id="one">one</span>|}

let data      = [%html {|<span>one</span><span>two</span><span>three</span>|} ]
let data      = [%html "<span>one</span><span id=\"two\">span</span><span>three</span>" ]
let%html data = {data|<span>one</span><span>two</span><span>three</span>|data}

let container = Html.(div [id "container"; klass ["one"; "two"; "three"]] data)
let main      = [%html "<main>"[ container ]"</main>" ]
let%html main = "<main>"[container]"</main>"

let main = [%html
  "<main>"
    [ container ]
  "</main>"
]

(* variant type *)
type attr  = ..
type attr += Str   of string
type attr += Int   of int
type attr += Float of float

let to_string v = match v with
  | Str v   -> v
  | Int v   -> string_of_int v
  | Float v -> string_of_float v
  | _       -> "?"

(* vim: set filetype=ocaml: *)
