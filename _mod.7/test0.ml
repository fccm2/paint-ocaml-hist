module Fld = Paint.Fld
module P = Paint
let () =
  let mg = P.new_img () in
  let mg = P.add_clr 0 (1, 0, 0) mg in
  let mg = P.add_clr 1 (0, 0, 1) mg in

  let mg = Fld.fld (fun i mg -> P.add_pnt (i, 0) 0 mg) mg 10 in
  let mg = Fld.fld (fun j mg -> P.add_pnt (j, 1) 1 mg) mg 10 in

  P.print_img (0, 0, 100, 80) mg

