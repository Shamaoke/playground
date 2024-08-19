[@@@main]

module[@a] A = struct end

(* is the same as *)

module A = struct end[@@a]

module[@b] B = struct
  [@@@b]
end
  [@@b]

let[@x] x = 2 and[@y] y = 3 in[@in] x + y

(* is the same as *)

let x = 2 [@@x] and y = 3 [@@y] in x + y [@in]

(* that is *)

(let x = 2 [@@x]) (and y = 3 [@@y]) (in x + y [@in])

let[@a.b.c] x = "a, b, c"

type%with_lenses t = {
  vendor  : string;
  make    : string;
  mileage : int
}

[%with_lenses type t = { vendor : string; make : string; mileage :int } ]
