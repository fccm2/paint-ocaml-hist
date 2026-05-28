module Fld = Paint.Fld
module Lst = Paint.Lst
module P = Paint

let () =
  let mg = P.new_img () in
  let mg = P.add_clr 0 (0, 1, 0) mg in

  let p0 = (20, 10) in
  let p1 = (45, 20) in
  let ps = P.new_ln p0 p1 in

  let mg = Lst.iter_appnd (P.add_pnt) 0 ps mg in

  let ps = P.new_ln (5, 5) (7, 40) in
  let mg = Lst.iter_appnd (P.add_pnt) 0 ps mg in

  let ps = P.new_ln (30, 20) (55, 10) in
  let mg = Lst.iter_appnd (P.add_pnt) 0 ps mg in

  P.print_img (0, 0, 100, 80) mg

