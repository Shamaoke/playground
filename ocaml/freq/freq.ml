
(** Building: `ocamlfind -package base -package stdio -linkpkg -o freq freq.ml`
    Usage: `echo "one\none\ntwo\nthree" | freq` *)

open Base
open Stdio

let build_counts ( ) =
  let find_line counts line =
    List.Assoc.find counts ~equal:String.equal line in
  let callback counts line =
    let count = match find_line counts line with
      | None   -> 0
      | Some n -> n
    in
      List.Assoc.add counts ~equal:String.equal line @@ Int.succ count
  in
    In_channel.fold_lines In_channel.stdin ~init:[ ] ~f:callback

let ( ) =
  build_counts ( )
  |> List.sort ~compare:(fun (_, a) (_, b) -> Int.descending a b)
  |> (fun l -> List.take l 10)
  |> List.iter ~f:(fun (line, count) -> printf "%3d: %s\n" count line)

