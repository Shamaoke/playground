let test_compose xs =
  let f x = mod x 2
  and g x = dec x
  and h   = g >> f in
  let composition = F.map h xs
  (* and composite   = F.map f (F.map g xs) in *)
  and composite   = F.map f @@ F.map g xs in
  expect (eql composition composite)

let test_compose xs =
  let f x = mod x 2 in
  let g x = dec x in
  let h   = g >> f in
  let composition = F.map h xs in
  let composite   = F.map f @@ F.map g xs in
    expect @@ eql composition composite

module Option_applicative : (Applicative with type 'a t = 'a option) = struct
  include Option_functor

  let pure x = Some x

  let apply fo xo = match fo, xo with
    | Some f, Some x -> Some (f x)
    | _              -> None
end

let rec insert n l = match l with
  | [ ]    -> [n]
  | h :: t -> if n < h then n :: l
                       else h :: insert n t

let rec insert n l = match l with
  | [ ]               -> [n]
  | h :: t when n < h -> n :: l
  | h :: t            -> h :: insert n t

let rec sort l = match l with
  | [ ]    -> [ ]
  | [_]    -> [_]
  | h :: t -> insert h @@ sort t

let rec sort n l =
  let rec insert n l = match l with
    | [ ]               -> [n]
    | h :: t when n < h -> n :: l
    | h :: t            -> h :: insert n t
  in match l with
    | [ ]    -> [ ]
    | [_]    -> [_]
    | h :: t -> insert h (sort t)

