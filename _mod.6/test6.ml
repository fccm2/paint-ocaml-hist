module Fld = Paint.Fld
module P = Paint
let () =
  let mg = P.new_img () in
  let mg = P.add_clr 0 (0, 1, 0) mg in

  (*
  let x0, x1 = (10, 30) in
  let ps = P.new_ln_h (x0, x1) 10 in

  let mg = Fld.fld_init (fun mg p -> P.add_pnt p 0 mg) mg ps in
  *)

  (*
  let y0, y1 = (4, 14) in
  let ps = P.new_ln_v 15 (y0, y1) in

  let mg = Fld.fld_init (fun mg p -> P.add_pnt p 0 mg) mg ps in
  *)

  let xc, yc = (30, 7) in
  let ps0 = P.new_crl (xc, yc) 6 in

  let x, y, w, h = (25, 10, 10, 4) in
  let ps1 = P.new_rct (x, y, w, h) in

  let is_in p ps =
    let rec aux_in ps =
      match ps with
      | p0::ps -> if p0 = p then true else aux_in ps
      | [] -> false
    in
    aux_in ps
  in
  let ps =
    let rec aux ps0 ps1 cc =
      match ps0 with
      | p::ps0 -> if is_in p ps1 then aux ps0 ps1 cc else aux ps0 ps1 (p::cc)
      | [] -> cc
    in
    aux ps0 ps1 []
  in

  let mg = Fld.fld_init (fun mg p -> P.add_pnt p 0 mg) mg ps in

  P.print_img (0, 0, 40, 15) mg
