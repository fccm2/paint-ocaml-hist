module Fld = Paint.Fld
module Lst = Paint.Lst
module P = Paint

let () =
  let mg = P.new_img () in
  let mg = P.add_clr 2 (1, 0, 0) mg in
  let mg = P.add_clr 1 (1, 1, 1) mg in
  let mg = P.add_clr 0 (0, 0, 0) mg in

  let mg = P.add_rct (0, 0, 120, 70) 1 mg in

  let mg = P.add_ln_bk (35, 15) (80, 25) 2 mg in

  let mg = P.strk_rct (10, 10, 25, 10) 0 mg in
  let mg = P.strk_rct (80, 20, 25, 10) 0 mg in

  P.print_img (0, 0, 120, 70) mg

