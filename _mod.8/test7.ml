module Fld = Paint.Fld
module P = Paint

let interv_map ab cd (e) =
  let a, b = (ab) in
  let c, d = (cd) in
  let ab_diff = (b - a) in
  let cd_diff = (d - c) in
  let f = (e - a) in
  ((f * cd_diff) / ab_diff) + c

let new_ln (x0, y0) (x1, y1) =
  let ab = (x0, x1) in
  let cd = (y0, y1) in
  let xd = if x1 > x0 then x1 - x0 else x0 - x1 in
  let yd = if y1 > y0 then y1 - y0 else y0 - y1 in
  let ps = ref [] in
  if xd > yd then
    for e = x0 to x1 do
      let r = interv_map ab cd (e) in
      let x, y = (e, r) in
      ps := (x, y) :: !ps
    done
  else
    for e = y0 to y1 do
      let r = interv_map cd ab (e) in
      let x, y = (r, e) in
      ps := (x, y) :: !ps
    done
  ; !ps
;;

(*
val new_ln : int * int -> int * int ->
  (int * int) list
*)

let () =
  let mg = P.new_img () in
  let mg = P.add_clr 0 (0, 1, 0) mg in

  let p0 = (20, 10) in
  let p1 = (45, 20) in
  let ps = new_ln p0 p1 in
  let rec aux_iter ps mg =
    match ps with
    | p :: ps -> aux_iter ps (P.add_pnt (p) 0 mg)
    | [] -> mg
  in
  let mg = aux_iter ps mg in

  let ps = new_ln (5, 5) (7, 40) in
  let mg = aux_iter ps mg in

  let ps = new_ln (30, 20) (55, 10) in
  let mg = aux_iter ps mg in

  P.print_img (0, 0, 100, 80) mg

