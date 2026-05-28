module Fld = Paint.Fld
module Lst = Paint.Lst
module P = Paint
let () =
  let mg = P.new_img () in
  let mg = P.add_clr 0 (0, 1, 0) mg in

  let x0, x1 = (10, 35) in
  let ps4 = P.new_ln_h (x0, x1) 4 in

  let y0, y1 = (4, 14) in
  let ps5 = P.new_ln_v 27 (y0, y1) in

  let xc, yc = (30, 7) in
  let ps0 = P.new_crl (xc, yc) 6 in

  let x, y, w, h = (23, 10, 14, 4) in
  let ps1 = P.new_rct (x, y, w, h) in

  let ps = Lst.diff ps0 ps1 in

  let ps = Lst.diff ps ps4 in
  let ps = Lst.diff ps ps5 in

  let mg = Fld.fld_init (fun mg p -> P.add_pnt p 0 mg) mg ps in

  let ps = Lst.diff ps1 ps0 in

  let mg = Fld.fld_init (fun mg p -> P.add_pnt p 0 mg) mg ps in

  P.print_img (0, 0, 40, 15) mg
