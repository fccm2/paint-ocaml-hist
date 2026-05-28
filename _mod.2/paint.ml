module Fld = struct
  let fld f init n =
    let rec aux d temp_res =
      if d>=n then temp_res else
      let res_next = f d temp_res in
      aux (d+1) res_next
    in
    aux 0 init
end
module Lst = struct
  let ass_find key lst =
    let rec aux lst =
      match lst with
      | (this_key, this_ass)::lst -> if this_key = key then this_ass else aux lst
      | [] -> raise Not_found
    in
    aux lst
end

let new_img () =
  [], []

let add_pnt (x, y) d img =
  match img with
  | pnt, clr ->
    (((x, y), d)::pnt, clr)

let add_rct (x, y, w, h) d mg =
  let mg =
    Fld.fld (fun i mg ->
      Fld.fld (fun j mg ->
        add_pnt (i+x, j+y) d mg
      ) mg h
    ) mg w
  in
  (mg)

let add_clr d (r, g, b) img =
  match img with
  | pnt, clr ->
    (pnt, (d, (r, g, b))::clr)

 (*
  * (0, 0, 360, 240)
  *
  * (10, 10, 140, 90)
  *)
let print_img (x, y, w, h) img =
  print_endline "P3";
  print_endline ((string_of_int w) ^ " " ^ (string_of_int h));
  print_endline ("255");
  for j=y to pred (h-y) do
  for i=x to pred (w-x) do
  try
    match img with
    | pnt, clr ->
      let this_pnt_key = Lst.ass_find (i, j) pnt in
      let this_color = Lst.ass_find this_pnt_key (clr) in
      let r, g, b = this_color in
      let r, g, b = (r * 255, g * 255, b * 255) in
      if i<>0 then print_string (" ");
      print_string ((string_of_int r) ^ " " ^ (string_of_int g) ^ " " ^ (string_of_int b));
  with Not_found ->
    if i<>0 then
    print_string (" ");
    print_string ((string_of_int 0) ^ " " ^ (string_of_int 0) ^ " " ^ (string_of_int 0));
  done ;
  print_newline ();
  done


type pnt = (int * int)
type ndx = int
type clr = (int * int * int)
type mg = (pnt * ndx) list * (ndx * clr) list

