let () =
  let outfile = ..
  and infile  = .. in
  Ast_mapper.apply ~source:infile ~target:outfile mapper

type ok = OK [@one] | OK_too [@two] | OK_free [@three] | OK_for [@four] [@@ok]

let%test "List.rev" =
  List.equal Int.equal (List.rev [3; 2; 1]) [1; 2; 3]

let "List.rev" =
  [%test List.equal Int.equal (List.rev [3; 2; 1]) [1; 2; 3] ]

