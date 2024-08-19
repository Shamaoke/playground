open Asttypes
open Parsetree
open Ast_mapper
open Ast_helper

(* let sample_mapper argv =
     { default_mapper with expr = fun mapper expr -> match expr with
         | { pexp_desc = Pexp_extension ({txt = "one"}, PStr [ ]) }   -> Exp.constant (Const_string "ok!")
         | { pexp_desc = Pexp_extension ({txt = "two"}, PStr [ ]) }   -> Exp.constant (Const_string "ok too!")
         | { pexp_desc = Pexp_extension ({txt = "three"}, PStr [ ]) } -> Exp.constant (Const_string "ok free!")
         | other -> default_mapper.expr mapper other } *)

let sample_mapper argv =
  let one   = { pexp_desc = Pexp_extension ({txt = "one"}, PStr [ ]) }
  and two   = { pexp_desc = Pexp_extension ({txt = "two"}, PStr [ ]) }
  and three = { pexp_desc = Pexp_extension ({txt = "three"}, PStr [ ]) }
  in
  { default_mapper with expr = fun mapper expr -> match expr with
      | one   -> Exp.constant (Const_string "ok!")
      | two   -> Exp.constant (Const_string "ok too!")
      | three -> Exp.constant (Const_string "ok free!")
      | other -> default_mapper.expr mapper other }

let () = register "sample_ppx" sample_mapper

(* usage *)
let one   = [%one]   (*~> ok! *)
let two   = [%two]   (*~> ok too! *)
let three = [%three] (*~> ok free! *)
