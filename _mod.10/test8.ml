module Fld = Paint.Fld
module Lst = Paint.Lst
module P = Paint

let m0 () =
  let mg = P.new_img () in
  let mg = P.add_clr 1 (1, 1, 1) mg in
  let mg = P.add_clr 0 (0, 0, 0) mg in

  let mg = P.add_rct (0, 0, 100, 80) 1 mg in
         
  let (y0, y1) = (10, 25) in

  let (x0, x1), x2 = (10, 25), 40 in
  let ps0 = P.new_ln_h (x0, x1) y0 in
  let ps4 = P.new_ln_v x1 (y0, y1) in
  let ps1 = P.new_ln_h (x1, x2) y1 in

  let mg = Lst.iter_appnd (P.add_pnt) 0 ps0 mg in
  let mg = Lst.iter_appnd (P.add_pnt) 0 ps4 mg in
  let mg = Lst.iter_appnd (P.add_pnt) 0 ps1 mg in

  P.print_img (0, 0, 100, 80) mg

let () =
  let mg = P.new_img () in
  let mg = P.add_clr 2 (1, 0, 0) mg in
  let mg = P.add_clr 1 (1, 1, 1) mg in
  let mg = P.add_clr 0 (0, 0, 0) mg in

  let mg = P.add_rct (0, 0, 120, 70) 1 mg in
         
  let (y0, y1) = (20, 35) in

  let (x0, x1), x2 = (30, 50), 70 in
  let ps0 = P.new_ln_h (x0, x1) y0 in
  let ps4 = P.new_ln_v x1 (y0, y1) in
  let ps1 = P.new_ln_h (x1, x2) y1 in

  let mg = Lst.iter_appnd (P.add_pnt) 0 ps0 mg in
  let mg = Lst.iter_appnd (P.add_pnt) 2 ps4 mg in
  let mg = Lst.iter_appnd (P.add_pnt) 0 ps1 mg in


  let x0, y0 = (10, 10) in
  let x1, y1 = (20, 20) in

  let ps0 = P.new_ln_v x0 (y0, y1) in
  let ps1 = P.new_ln_v x1 (y0, y1) in

  let ps5 = P.new_ln_h (x0, x1) y0 in
  let ps4 = P.new_ln_h (x0, x1) y1 in

  let mg = Lst.iter_appnd (P.add_pnt) 0 ps0 mg in
  let mg = Lst.iter_appnd (P.add_pnt) 2 ps4 mg in
  let mg = Lst.iter_appnd (P.add_pnt) 0 ps1 mg in
  let mg = Lst.iter_appnd (P.add_pnt) 2 ps5 mg in

  P.print_img (0, 0, 120, 70) mg

