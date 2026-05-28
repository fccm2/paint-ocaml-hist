module Fld = struct
  let fld_init f init lst =
    let rec aux temp_res lst =
      match lst with
      | v::tl -> aux (f temp_res v) tl
      | [] -> temp_res
    in
    aux init lst
  let fld f init n =
    let rec aux d temp_res =
      if d>=n then temp_res else
      let res_next = f d temp_res in
      aux (d+1) res_next
    in
    aux 0 init
end
module Lst = struct
  let lst_fltr f lst =
    let rec aux lst cc =
      match lst with
      | v::tl -> aux tl (if f v then (v::cc) else cc)
      | [] -> cc
    in
    aux lst []
  let rev_append this lst =
    let rec aux_appd this lst =
      match this with
      | v::tl -> aux_appd tl (v::lst)
      | [] -> lst
    in
    aux_appd this lst
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

let add_crl (xc, yc) r d mg =
  let x1, y1 = (xc+r, yc+r) in
  let x0, y0 = (xc-r, yc-r) in
  let w, h = (x1-x0+1, y1-y0+1) in
  let x, y = (x0, y0) in
  let mg =
    Fld.fld (fun i mg ->
      Fld.fld (fun j mg ->
        let ti = xc - (i+x) in
        let tj = yc - (j+y) in
        let td = (ti * ti) + (tj * tj) in
        if td < (r * r)
        then add_pnt (i+x, j+y) d mg else mg
      ) mg h
    ) mg w
  in
  (mg)

let new_ln_h (x0, x1) y =
  let x0, x1 = if x0 < x1 then x0, x1 else x1, x0 in
  let rec iter_acc = (fun cc x ->
    if x <= x1 then iter_acc ((x, y)::cc) (x+1) else cc
  ) in
  let cc = iter_acc [] x0 in
  (cc)

let new_ln_v x (y0, y1) =
  let y0, y1 = if y0 < y1 then y0, y1 else y1, y0 in
  let rec iter_acc = (fun cc y ->
    if y <= y1 then iter_acc ((x, y)::cc) (y+1) else cc
  ) in
  let cc = iter_acc [] y0 in
  (cc)

let new_crl (xc, yc) r =
  let x1, y1 = (xc+r, yc+r) in
  let x0, y0 = (xc-r, yc-r) in
  let rec iter_acc = (fun cc y ->
    if y <= y1 then begin
      let h_ln = new_ln_h (x0, x1) y in
      let h_ln = Lst.lst_fltr (fun (x, y) ->
        let ti, tj = x - xc, y - yc in
        if ((ti * ti) + (tj * tj)) < (r * r) then true else false) h_ln in
      let cc = Lst.rev_append h_ln cc in
      iter_acc cc (y+1)
    end else cc
  ) in
  let cc = iter_acc [] y0 in
  (cc)

let new_rct (x, y, w, h) =
  let x0, x1 = x, x+w in
  let y0, y1 = y, y+h in
  let rec iter_acc = (fun cc y ->
    if y <= y1 then begin
      let h_ln = new_ln_h (x0, x1) y in
      let cc = Lst.rev_append h_ln cc in
      iter_acc cc (y+1)
    end else cc
  ) in
  let cc = iter_acc [] y0 in
  (cc)

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

